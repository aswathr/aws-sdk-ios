//
//  MTLModel+NSCoding.m
//  Mantle
//
//  Created by Justin Spahr-Summers on 2013-02-12.
//  Copyright (c) 2013 GitHub. All rights reserved.
//

#import "AWSMTLModel+NSCoding.h"
#import "AWSEXTRuntimeExtensions.h"
#import "AWSEXTScope.h"
#import "AWSMTLReflection.h"
#import <objc/runtime.h>

void awsmtl_loadMTLNSCoding(void){
}

// Used in archives to store the modelVersion of the archived instance.
static NSString * const AWSMTLModelVersionKey = @"AWSMTLModelVersion";

// Used to cache the reflection performed in +allowedSecureCodingClassesByPropertyKey.
static void *AWSMTLModelCachedAllowedClassesKey = &AWSMTLModelCachedAllowedClassesKey;

// Returns whether the given NSCoder requires secure coding.
static BOOL coderRequiresSecureCoding(NSCoder *coder) {
	SEL requiresSecureCodingSelector = @selector(requiresSecureCoding);

	// Only invoke the method if it's implemented (i.e., only on OS X 10.8+ and
	// iOS 6+).
	if (![coder respondsToSelector:requiresSecureCodingSelector]) return NO;

	BOOL (*requiresSecureCodingIMP)(NSCoder *, SEL) = (__typeof__(requiresSecureCodingIMP))[coder methodForSelector:requiresSecureCodingSelector];
	if (requiresSecureCodingIMP == NULL) return NO;

	return requiresSecureCodingIMP(coder, requiresSecureCodingSelector);
}

// Returns all of the given class' encodable property keys (those that will not
// be excluded from archives).
static NSSet *encodablePropertyKeysForClass(Class modelClass) {
	return [[modelClass encodingBehaviorsByPropertyKey] keysOfEntriesPassingTest:^ BOOL (NSString *propertyKey, NSNumber *behavior, BOOL *stop) {
		return behavior.unsignedIntegerValue != AWSMTLModelEncodingBehaviorExcluded;
	}];
}

// Verifies that all of the specified class' encodable property keys are present
// in +allowedSecureCodingClassesByPropertyKey, and throws an exception if not.
static void verifyAllowedClassesByPropertyKey(Class modelClass) {
	NSDictionary *allowedClasses = [modelClass allowedSecureCodingClassesByPropertyKey];

	NSMutableSet *specifiedPropertyKeys = [[NSMutableSet alloc] initWithArray:allowedClasses.allKeys];
	[specifiedPropertyKeys minusSet:encodablePropertyKeysForClass(modelClass)];

	if (specifiedPropertyKeys.count > 0) {
		[NSException raise:NSInvalidArgumentException format:@"Cannot encode %@ securely, because keys are missing from +allowedSecureCodingClassesByPropertyKey: %@", modelClass, specifiedPropertyKeys];
	}
}

@implementation AWSMTLModel (NSCoding)

#pragma mark Versioning

+ (NSUInteger)modelVersion {
	return 0;
}

#pragma mark Encoding Behaviors

+ (NSDictionary *)encodingBehaviorsByPropertyKey {
	NSSet *propertyKeys = self.propertyKeys;
	NSMutableDictionary *behaviors = [[NSMutableDictionary alloc] initWithCapacity:propertyKeys.count];

	for (NSString *key in propertyKeys) {
		objc_property_t property = class_getProperty(self, key.UTF8String);
		NSAssert(property != NULL, @"Could not find property \"%@\" on %@", key, self);

		awsmtl_propertyAttributes *attributes = awsmtl_copyPropertyAttributes(property);
		@onExit {
			free(attributes);
		};

		AWSMTLModelEncodingBehavior behavior = (attributes->weak ? AWSMTLModelEncodingBehaviorConditional : AWSMTLModelEncodingBehaviorUnconditional);
		behaviors[key] = @(behavior);
	}

	return behaviors;
}

+ (NSDictionary *)allowedSecureCodingClassesByPropertyKey {
	NSDictionary *cachedClasses = objc_getAssociatedObject(self, AWSMTLModelCachedAllowedClassesKey);
	if (cachedClasses != nil) return cachedClasses;

	// Get all property keys that could potentially be encoded.
	NSSet *propertyKeys = [self.encodingBehaviorsByPropertyKey keysOfEntriesPassingTest:^ BOOL (NSString *propertyKey, NSNumber *behavior, BOOL *stop) {
		return behavior.unsignedIntegerValue != AWSMTLModelEncodingBehaviorExcluded;
	}];

	NSMutableDictionary *allowedClasses = [[NSMutableDictionary alloc] initWithCapacity:propertyKeys.count];

	for (NSString *key in propertyKeys) {
		objc_property_t property = class_getProperty(self, key.UTF8String);
		NSAssert(property != NULL, @"Could not find property \"%@\" on %@", key, self);

		awsmtl_propertyAttributes *attributes = awsmtl_copyPropertyAttributes(property);
		@onExit {
			free(attributes);
		};

		// If the property is not of object or class type, assume that it's
		// a primitive which would be boxed into an NSValue.
		if (attributes->type[0] != '@' && attributes->type[0] != '#') {
			allowedClasses[key] = @[ NSValue.class ];
			continue;
		}

		// Omit this property from the dictionary if its class isn't known.
		if (attributes->objectClass != nil) {
			allowedClasses[key] = @[ attributes->objectClass ];
		}
	}

	// It doesn't really matter if we replace another thread's work, since we do
	// it atomically and the result should be the same.
	objc_setAssociatedObject(self, AWSMTLModelCachedAllowedClassesKey, allowedClasses, OBJC_ASSOCIATION_COPY);

	return allowedClasses;
}

- (id)decodeValueForKey:(NSString *)key withCoder:(NSCoder *)coder modelVersion:(NSUInteger)modelVersion {
	NSParameterAssert(key != nil);
	NSParameterAssert(coder != nil);

	SEL selector = AWSMTLSelectorWithCapitalizedKeyPattern("decode", key, "WithCoder:modelVersion:");
	if ([self respondsToSelector:selector]) {
		NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:[self methodSignatureForSelector:selector]];
		invocation.target = self;
		invocation.selector = selector;
		[invocation setArgument:&coder atIndex:2];
		[invocation setArgument:&modelVersion atIndex:3];
		[invocation invoke];

		__unsafe_unretained id result = nil;
		[invocation getReturnValue:&result];
		return result;
	}

	@try {
		if (coderRequiresSecureCoding(coder)) {
			NSArray *allowedClasses = self.class.allowedSecureCodingClassesByPropertyKey[key];
			NSAssert(allowedClasses != nil, @"No allowed classes specified for securely decoding key \"%@\" on %@", key, self.class);
			
			return [coder decodeObjectOfClasses:[NSSet setWithArray:allowedClasses] forKey:key];
		} else {
			return [coder decodeObjectForKey:key];
		}
	} @catch (NSException *ex) {
		NSLog(@"*** Caught exception decoding value for key \"%@\" on class %@: %@", key, self.class, ex);
		@throw ex;
	}
}

#pragma mark NSCoding

- (instancetype)initWithCoder:(NSCoder *)coder {
	BOOL requiresSecureCoding = coderRequiresSecureCoding(coder);
	NSNumber *version = nil;
	if (requiresSecureCoding) {
		version = [coder decodeObjectOfClass:NSNumber.class forKey:AWSMTLModelVersionKey];
	} else {
		version = [coder decodeObjectForKey:AWSMTLModelVersionKey];
	}
	
	if (version == nil) {
		NSLog(@"Warning: decoding an archive of %@ without a version, assuming 0", self.class);
	} else if (version.unsignedIntegerValue > self.class.modelVersion) {
		// Don't try to decode newer versions.
		return nil;
	}

	if (requiresSecureCoding) {
		verifyAllowedClassesByPropertyKey(self.class);
	} else {
		// Handle the old archive format.
		NSDictionary *externalRepresentation = [coder decodeObjectForKey:@"externalRepresentation"];
		if (externalRepresentation != nil) {
			NSAssert([self.class methodForSelector:@selector(dictionaryValueFromArchivedExternalRepresentation:version:)] != [AWSMTLModel methodForSelector:@selector(dictionaryValueFromArchivedExternalRepresentation:version:)], @"Decoded an old archive of %@ that contains an externalRepresentation, but +dictionaryValueFromArchivedExternalRepresentation:version: is not overridden to handle it", self.class);

			NSDictionary *dictionaryValue = [self.class dictionaryValueFromArchivedExternalRepresentation:externalRepresentation version:version.unsignedIntegerValue];
			if (dictionaryValue == nil) return nil;

			NSError *error = nil;
			self = [self initWithDictionary:dictionaryValue error:&error];
			if (self == nil) NSLog(@"*** Could not decode old %@ archive: %@", self.class, error);

			return self;
		}
	}

	NSSet *propertyKeys = self.class.propertyKeys;
	NSMutableDictionary *dictionaryValue = [[NSMutableDictionary alloc] initWithCapacity:propertyKeys.count];

	for (NSString *key in propertyKeys) {
		id value = [self decodeValueForKey:key withCoder:coder modelVersion:version.unsignedIntegerValue];
		if (value == nil) continue;

		dictionaryValue[key] = value;
	}

	NSError *error = nil;
	self = [self initWithDictionary:dictionaryValue error:&error];
	if (self == nil) NSLog(@"*** Could not unarchive %@: %@", self.class, error);

	return self;
}

- (void)encodeWithCoder:(NSCoder *)coder {
	if (coderRequiresSecureCoding(coder)) verifyAllowedClassesByPropertyKey(self.class);

	[coder encodeObject:@(self.class.modelVersion) forKey:AWSMTLModelVersionKey];

	NSDictionary *encodingBehaviors = self.class.encodingBehaviorsByPropertyKey;
	[self.dictionaryValue enumerateKeysAndObjectsUsingBlock:^(NSString *key, id value, BOOL *stop) {
		@try {
			// Skip nil values.
			if ([value isEqual:NSNull.null]) return;
			
			switch ([encodingBehaviors[key] unsignedIntegerValue]) {
					// This will also match a nil behavior.
				case AWSMTLModelEncodingBehaviorExcluded:
					break;
					
				case AWSMTLModelEncodingBehaviorUnconditional:
					[coder encodeObject:value forKey:key];
					break;
					
				case AWSMTLModelEncodingBehaviorConditional:
					[coder encodeConditionalObject:value forKey:key];
					break;
					
				default:
					NSAssert(NO, @"Unrecognized encoding behavior %@ on class %@ for key \"%@\"", self.class, encodingBehaviors[key], key);
			}
		} @catch (NSException *ex) {
			NSLog(@"*** Caught exception encoding value for key \"%@\" on class %@: %@", key, self.class, ex);
			@throw ex;
		}
	}];
}

#pragma mark NSSecureCoding

+ (BOOL)supportsSecureCoding {
	// Disable secure coding support by default, so subclasses are forced to
	// opt-in by conforming to the protocol and overriding this method.
	//
	// We only implement this method because XPC complains if a subclass tries
	// to implement it but does not override -initWithCoder:. See
	// https://github.com/github/Mantle/issues/74.
	return NO;
}

@end

@implementation AWSMTLModel (OldArchiveSupport)

+ (NSDictionary *)dictionaryValueFromArchivedExternalRepresentation:(NSDictionary *)externalRepresentation version:(NSUInteger)fromVersion {
	return nil;
}

@end
