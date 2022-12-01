//
// Copyright 2010-2022 Amazon.com, Inc. or its affiliates. All Rights Reserved.
//
// Licensed under the Apache License, Version 2.0 (the "License").
// You may not use this file except in compliance with the License.
// A copy of the License is located at
//
// http://aws.amazon.com/apache2.0
//
// or in the "license" file accompanying this file. This file is distributed
// on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either
// express or implied. See the License for the specific language governing
// permissions and limitations under the License.
//

#import "AWSComprehendResources.h"
#import <AWSCore/AWSCocoaLumberjack.h>

@interface AWSComprehendResources ()

@property (nonatomic, strong) NSDictionary *definitionDictionary;

@end

@implementation AWSComprehendResources

+ (instancetype)sharedInstance {
    static AWSComprehendResources *_sharedResources = nil;
    static dispatch_once_t once_token;

    dispatch_once(&once_token, ^{
        _sharedResources = [AWSComprehendResources new];
    });

    return _sharedResources;
}

- (NSDictionary *)JSONObject {
    return self.definitionDictionary;
}

- (instancetype)init {
    if (self = [super init]) {
        //init method
        NSError *error = nil;
        _definitionDictionary = [NSJSONSerialization JSONObjectWithData:[[self definitionString] dataUsingEncoding:NSUTF8StringEncoding]
                                                                options:kNilOptions
                                                                  error:&error];
        if (_definitionDictionary == nil) {
            if (error) {
                AWSDDLogError(@"Failed to parse JSON service definition: %@",error);
            }
        }
    }
    return self;
}

- (NSString *)definitionString {
    return @"{\
  \"version\":\"2.0\",\
  \"metadata\":{\
    \"apiVersion\":\"2017-11-27\",\
    \"endpointPrefix\":\"comprehend\",\
    \"jsonVersion\":\"1.1\",\
    \"protocol\":\"json\",\
    \"serviceFullName\":\"Amazon Comprehend\",\
    \"serviceId\":\"Comprehend\",\
    \"signatureVersion\":\"v4\",\
    \"signingName\":\"comprehend\",\
    \"targetPrefix\":\"Comprehend_20171127\",\
    \"uid\":\"comprehend-2017-11-27\"\
  },\
  \"operations\":{\
    \"BatchDetectDominantLanguage\":{\
      \"name\":\"BatchDetectDominantLanguage\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"BatchDetectDominantLanguageRequest\"},\
      \"output\":{\"shape\":\"BatchDetectDominantLanguageResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"TextSizeLimitExceededException\"},\
        {\"shape\":\"BatchSizeLimitExceededException\"},\
        {\"shape\":\"InternalServerException\"}\
      ],\
      \"documentation\":\"<p>Determines the dominant language of the input text for a batch of documents. For a list of languages that Amazon Comprehend can detect, see <a href=\\\"https://docs.aws.amazon.com/comprehend/latest/dg/how-languages.html\\\">Amazon Comprehend Supported Languages</a>. </p>\"\
    },\
    \"BatchDetectEntities\":{\
      \"name\":\"BatchDetectEntities\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"BatchDetectEntitiesRequest\"},\
      \"output\":{\"shape\":\"BatchDetectEntitiesResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"TextSizeLimitExceededException\"},\
        {\"shape\":\"UnsupportedLanguageException\"},\
        {\"shape\":\"BatchSizeLimitExceededException\"},\
        {\"shape\":\"InternalServerException\"}\
      ],\
      \"documentation\":\"<p>Inspects the text of a batch of documents for named entities and returns information about them. For more information about named entities, see <a href=\\\"https://docs.aws.amazon.com/comprehend/latest/dg/how-entities.html\\\">Entities</a> in the Comprehend Developer Guide. </p>\"\
    },\
    \"BatchDetectKeyPhrases\":{\
      \"name\":\"BatchDetectKeyPhrases\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"BatchDetectKeyPhrasesRequest\"},\
      \"output\":{\"shape\":\"BatchDetectKeyPhrasesResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"TextSizeLimitExceededException\"},\
        {\"shape\":\"UnsupportedLanguageException\"},\
        {\"shape\":\"BatchSizeLimitExceededException\"},\
        {\"shape\":\"InternalServerException\"}\
      ],\
      \"documentation\":\"<p>Detects the key noun phrases found in a batch of documents.</p>\"\
    },\
    \"BatchDetectSentiment\":{\
      \"name\":\"BatchDetectSentiment\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"BatchDetectSentimentRequest\"},\
      \"output\":{\"shape\":\"BatchDetectSentimentResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"TextSizeLimitExceededException\"},\
        {\"shape\":\"UnsupportedLanguageException\"},\
        {\"shape\":\"BatchSizeLimitExceededException\"},\
        {\"shape\":\"InternalServerException\"}\
      ],\
      \"documentation\":\"<p>Inspects a batch of documents and returns an inference of the prevailing sentiment, <code>POSITIVE</code>, <code>NEUTRAL</code>, <code>MIXED</code>, or <code>NEGATIVE</code>, in each one.</p>\"\
    },\
    \"BatchDetectSyntax\":{\
      \"name\":\"BatchDetectSyntax\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"BatchDetectSyntaxRequest\"},\
      \"output\":{\"shape\":\"BatchDetectSyntaxResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"TextSizeLimitExceededException\"},\
        {\"shape\":\"UnsupportedLanguageException\"},\
        {\"shape\":\"BatchSizeLimitExceededException\"},\
        {\"shape\":\"InternalServerException\"}\
      ],\
      \"documentation\":\"<p>Inspects the text of a batch of documents for the syntax and part of speech of the words in the document and returns information about them. For more information, see <a href=\\\"https://docs.aws.amazon.com/comprehend/latest/dg/how-syntax.html\\\">Syntax</a> in the Comprehend Developer Guide. </p>\"\
    },\
    \"BatchDetectTargetedSentiment\":{\
      \"name\":\"BatchDetectTargetedSentiment\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"BatchDetectTargetedSentimentRequest\"},\
      \"output\":{\"shape\":\"BatchDetectTargetedSentimentResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"TextSizeLimitExceededException\"},\
        {\"shape\":\"UnsupportedLanguageException\"},\
        {\"shape\":\"BatchSizeLimitExceededException\"},\
        {\"shape\":\"InternalServerException\"}\
      ],\
      \"documentation\":\"<p>Inspects a batch of documents and returns a sentiment analysis for each entity identified in the documents.</p> <p>For more information about targeted sentiment, see <a href=\\\"https://docs.aws.amazon.com/comprehend/latest/dg/how-targeted-sentiment.html\\\">Targeted sentiment</a>.</p>\"\
    },\
    \"ClassifyDocument\":{\
      \"name\":\"ClassifyDocument\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"ClassifyDocumentRequest\"},\
      \"output\":{\"shape\":\"ClassifyDocumentResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"ResourceUnavailableException\"},\
        {\"shape\":\"TextSizeLimitExceededException\"},\
        {\"shape\":\"InternalServerException\"}\
      ],\
      \"documentation\":\"<p>Creates a new document classification request to analyze a single document in real-time, using a previously created and trained custom model and an endpoint.</p> <p>You can input plain text or you can upload a single-page input document (text, PDF, Word, or image). </p> <p>If the system detects errors while processing a page in the input document, the API response includes an entry in <code>Errors</code> that describes the errors.</p> <p>If the system detects a document-level error in your input document, the API returns an <code>InvalidRequestException</code> error response. For details about this exception, see <a href=\\\"https://docs.aws.amazon.com/comprehend/latest/dg/idp-inputs-sync-err.html\\\"> Errors in semi-structured documents</a> in the Comprehend Developer Guide. </p>\"\
    },\
    \"ContainsPiiEntities\":{\
      \"name\":\"ContainsPiiEntities\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"ContainsPiiEntitiesRequest\"},\
      \"output\":{\"shape\":\"ContainsPiiEntitiesResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"TextSizeLimitExceededException\"},\
        {\"shape\":\"UnsupportedLanguageException\"},\
        {\"shape\":\"InternalServerException\"}\
      ],\
      \"documentation\":\"<p>Analyzes input text for the presence of personally identifiable information (PII) and returns the labels of identified PII entity types such as name, address, bank account number, or phone number.</p>\"\
    },\
    \"CreateDocumentClassifier\":{\
      \"name\":\"CreateDocumentClassifier\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"CreateDocumentClassifierRequest\"},\
      \"output\":{\"shape\":\"CreateDocumentClassifierResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"ResourceInUseException\"},\
        {\"shape\":\"TooManyTagsException\"},\
        {\"shape\":\"TooManyRequestsException\"},\
        {\"shape\":\"ResourceLimitExceededException\"},\
        {\"shape\":\"UnsupportedLanguageException\"},\
        {\"shape\":\"KmsKeyValidationException\"},\
        {\"shape\":\"InternalServerException\"}\
      ],\
      \"documentation\":\"<p>Creates a new document classifier that you can use to categorize documents. To create a classifier, you provide a set of training documents that labeled with the categories that you want to use. After the classifier is trained you can use it to categorize a set of labeled documents into the categories. For more information, see <a href=\\\"https://docs.aws.amazon.com/comprehend/latest/dg/how-document-classification.html\\\">Document Classification</a> in the Comprehend Developer Guide. </p>\"\
    },\
    \"CreateEndpoint\":{\
      \"name\":\"CreateEndpoint\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"CreateEndpointRequest\"},\
      \"output\":{\"shape\":\"CreateEndpointResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"ResourceInUseException\"},\
        {\"shape\":\"ResourceLimitExceededException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ResourceUnavailableException\"},\
        {\"shape\":\"TooManyRequestsException\"},\
        {\"shape\":\"TooManyTagsException\"},\
        {\"shape\":\"InternalServerException\"}\
      ],\
      \"documentation\":\"<p>Creates a model-specific endpoint for synchronous inference for a previously trained custom model For information about endpoints, see <a href=\\\"https://docs.aws.amazon.com/comprehend/latest/dg/manage-endpoints.html\\\">Managing endpoints</a>.</p>\"\
    },\
    \"CreateEntityRecognizer\":{\
      \"name\":\"CreateEntityRecognizer\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"CreateEntityRecognizerRequest\"},\
      \"output\":{\"shape\":\"CreateEntityRecognizerResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"ResourceInUseException\"},\
        {\"shape\":\"TooManyTagsException\"},\
        {\"shape\":\"TooManyRequestsException\"},\
        {\"shape\":\"ResourceLimitExceededException\"},\
        {\"shape\":\"UnsupportedLanguageException\"},\
        {\"shape\":\"KmsKeyValidationException\"},\
        {\"shape\":\"InternalServerException\"}\
      ],\
      \"documentation\":\"<p>Creates an entity recognizer using submitted files. After your <code>CreateEntityRecognizer</code> request is submitted, you can check job status using the API. </p>\"\
    },\
    \"DeleteDocumentClassifier\":{\
      \"name\":\"DeleteDocumentClassifier\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DeleteDocumentClassifierRequest\"},\
      \"output\":{\"shape\":\"DeleteDocumentClassifierResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"TooManyRequestsException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ResourceUnavailableException\"},\
        {\"shape\":\"ResourceInUseException\"},\
        {\"shape\":\"InternalServerException\"}\
      ],\
      \"documentation\":\"<p>Deletes a previously created document classifier</p> <p>Only those classifiers that are in terminated states (IN_ERROR, TRAINED) will be deleted. If an active inference job is using the model, a <code>ResourceInUseException</code> will be returned.</p> <p>This is an asynchronous action that puts the classifier into a DELETING state, and it is then removed by a background job. Once removed, the classifier disappears from your account and is no longer available for use. </p>\"\
    },\
    \"DeleteEndpoint\":{\
      \"name\":\"DeleteEndpoint\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DeleteEndpointRequest\"},\
      \"output\":{\"shape\":\"DeleteEndpointResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"ResourceInUseException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"TooManyRequestsException\"},\
        {\"shape\":\"InternalServerException\"}\
      ],\
      \"documentation\":\"<p>Deletes a model-specific endpoint for a previously-trained custom model. All endpoints must be deleted in order for the model to be deleted. For information about endpoints, see <a href=\\\"https://docs.aws.amazon.com/comprehend/latest/dg/manage-endpoints.html\\\">Managing endpoints</a>.</p>\"\
    },\
    \"DeleteEntityRecognizer\":{\
      \"name\":\"DeleteEntityRecognizer\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DeleteEntityRecognizerRequest\"},\
      \"output\":{\"shape\":\"DeleteEntityRecognizerResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"TooManyRequestsException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ResourceUnavailableException\"},\
        {\"shape\":\"ResourceInUseException\"},\
        {\"shape\":\"InternalServerException\"}\
      ],\
      \"documentation\":\"<p>Deletes an entity recognizer.</p> <p>Only those recognizers that are in terminated states (IN_ERROR, TRAINED) will be deleted. If an active inference job is using the model, a <code>ResourceInUseException</code> will be returned.</p> <p>This is an asynchronous action that puts the recognizer into a DELETING state, and it is then removed by a background job. Once removed, the recognizer disappears from your account and is no longer available for use. </p>\"\
    },\
    \"DeleteResourcePolicy\":{\
      \"name\":\"DeleteResourcePolicy\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DeleteResourcePolicyRequest\"},\
      \"output\":{\"shape\":\"DeleteResourcePolicyResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InternalServerException\"}\
      ],\
      \"documentation\":\"<p>Deletes a resource-based policy that is attached to a custom model.</p>\"\
    },\
    \"DescribeDocumentClassificationJob\":{\
      \"name\":\"DescribeDocumentClassificationJob\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DescribeDocumentClassificationJobRequest\"},\
      \"output\":{\"shape\":\"DescribeDocumentClassificationJobResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"TooManyRequestsException\"},\
        {\"shape\":\"JobNotFoundException\"},\
        {\"shape\":\"InternalServerException\"}\
      ],\
      \"documentation\":\"<p>Gets the properties associated with a document classification job. Use this operation to get the status of a classification job.</p>\"\
    },\
    \"DescribeDocumentClassifier\":{\
      \"name\":\"DescribeDocumentClassifier\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DescribeDocumentClassifierRequest\"},\
      \"output\":{\"shape\":\"DescribeDocumentClassifierResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"TooManyRequestsException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InternalServerException\"}\
      ],\
      \"documentation\":\"<p>Gets the properties associated with a document classifier.</p>\"\
    },\
    \"DescribeDominantLanguageDetectionJob\":{\
      \"name\":\"DescribeDominantLanguageDetectionJob\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DescribeDominantLanguageDetectionJobRequest\"},\
      \"output\":{\"shape\":\"DescribeDominantLanguageDetectionJobResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"JobNotFoundException\"},\
        {\"shape\":\"TooManyRequestsException\"},\
        {\"shape\":\"InternalServerException\"}\
      ],\
      \"documentation\":\"<p>Gets the properties associated with a dominant language detection job. Use this operation to get the status of a detection job.</p>\"\
    },\
    \"DescribeEndpoint\":{\
      \"name\":\"DescribeEndpoint\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DescribeEndpointRequest\"},\
      \"output\":{\"shape\":\"DescribeEndpointResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"TooManyRequestsException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InternalServerException\"}\
      ],\
      \"documentation\":\"<p>Gets the properties associated with a specific endpoint. Use this operation to get the status of an endpoint. For information about endpoints, see <a href=\\\"https://docs.aws.amazon.com/comprehend/latest/dg/manage-endpoints.html\\\">Managing endpoints</a>.</p>\"\
    },\
    \"DescribeEntitiesDetectionJob\":{\
      \"name\":\"DescribeEntitiesDetectionJob\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DescribeEntitiesDetectionJobRequest\"},\
      \"output\":{\"shape\":\"DescribeEntitiesDetectionJobResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"JobNotFoundException\"},\
        {\"shape\":\"TooManyRequestsException\"},\
        {\"shape\":\"InternalServerException\"}\
      ],\
      \"documentation\":\"<p>Gets the properties associated with an entities detection job. Use this operation to get the status of a detection job.</p>\"\
    },\
    \"DescribeEntityRecognizer\":{\
      \"name\":\"DescribeEntityRecognizer\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DescribeEntityRecognizerRequest\"},\
      \"output\":{\"shape\":\"DescribeEntityRecognizerResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"TooManyRequestsException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InternalServerException\"}\
      ],\
      \"documentation\":\"<p>Provides details about an entity recognizer including status, S3 buckets containing training data, recognizer metadata, metrics, and so on.</p>\"\
    },\
    \"DescribeEventsDetectionJob\":{\
      \"name\":\"DescribeEventsDetectionJob\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DescribeEventsDetectionJobRequest\"},\
      \"output\":{\"shape\":\"DescribeEventsDetectionJobResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"JobNotFoundException\"},\
        {\"shape\":\"TooManyRequestsException\"},\
        {\"shape\":\"InternalServerException\"}\
      ],\
      \"documentation\":\"<p>Gets the status and details of an events detection job.</p>\"\
    },\
    \"DescribeKeyPhrasesDetectionJob\":{\
      \"name\":\"DescribeKeyPhrasesDetectionJob\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DescribeKeyPhrasesDetectionJobRequest\"},\
      \"output\":{\"shape\":\"DescribeKeyPhrasesDetectionJobResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"JobNotFoundException\"},\
        {\"shape\":\"TooManyRequestsException\"},\
        {\"shape\":\"InternalServerException\"}\
      ],\
      \"documentation\":\"<p>Gets the properties associated with a key phrases detection job. Use this operation to get the status of a detection job.</p>\"\
    },\
    \"DescribePiiEntitiesDetectionJob\":{\
      \"name\":\"DescribePiiEntitiesDetectionJob\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DescribePiiEntitiesDetectionJobRequest\"},\
      \"output\":{\"shape\":\"DescribePiiEntitiesDetectionJobResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"JobNotFoundException\"},\
        {\"shape\":\"TooManyRequestsException\"},\
        {\"shape\":\"InternalServerException\"}\
      ],\
      \"documentation\":\"<p>Gets the properties associated with a PII entities detection job. For example, you can use this operation to get the job status.</p>\"\
    },\
    \"DescribeResourcePolicy\":{\
      \"name\":\"DescribeResourcePolicy\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DescribeResourcePolicyRequest\"},\
      \"output\":{\"shape\":\"DescribeResourcePolicyResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InternalServerException\"}\
      ],\
      \"documentation\":\"<p>Gets the details of a resource-based policy that is attached to a custom model, including the JSON body of the policy.</p>\"\
    },\
    \"DescribeSentimentDetectionJob\":{\
      \"name\":\"DescribeSentimentDetectionJob\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DescribeSentimentDetectionJobRequest\"},\
      \"output\":{\"shape\":\"DescribeSentimentDetectionJobResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"JobNotFoundException\"},\
        {\"shape\":\"TooManyRequestsException\"},\
        {\"shape\":\"InternalServerException\"}\
      ],\
      \"documentation\":\"<p>Gets the properties associated with a sentiment detection job. Use this operation to get the status of a detection job.</p>\"\
    },\
    \"DescribeTargetedSentimentDetectionJob\":{\
      \"name\":\"DescribeTargetedSentimentDetectionJob\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DescribeTargetedSentimentDetectionJobRequest\"},\
      \"output\":{\"shape\":\"DescribeTargetedSentimentDetectionJobResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"JobNotFoundException\"},\
        {\"shape\":\"TooManyRequestsException\"},\
        {\"shape\":\"InternalServerException\"}\
      ],\
      \"documentation\":\"<p>Gets the properties associated with a targeted sentiment detection job. Use this operation to get the status of the job.</p>\"\
    },\
    \"DescribeTopicsDetectionJob\":{\
      \"name\":\"DescribeTopicsDetectionJob\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DescribeTopicsDetectionJobRequest\"},\
      \"output\":{\"shape\":\"DescribeTopicsDetectionJobResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"JobNotFoundException\"},\
        {\"shape\":\"TooManyRequestsException\"},\
        {\"shape\":\"InternalServerException\"}\
      ],\
      \"documentation\":\"<p>Gets the properties associated with a topic detection job. Use this operation to get the status of a detection job.</p>\"\
    },\
    \"DetectDominantLanguage\":{\
      \"name\":\"DetectDominantLanguage\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DetectDominantLanguageRequest\"},\
      \"output\":{\"shape\":\"DetectDominantLanguageResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"TextSizeLimitExceededException\"},\
        {\"shape\":\"InternalServerException\"}\
      ],\
      \"documentation\":\"<p>Determines the dominant language of the input text. For a list of languages that Amazon Comprehend can detect, see <a href=\\\"https://docs.aws.amazon.com/comprehend/latest/dg/how-languages.html\\\">Amazon Comprehend Supported Languages</a>. </p>\"\
    },\
    \"DetectEntities\":{\
      \"name\":\"DetectEntities\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DetectEntitiesRequest\"},\
      \"output\":{\"shape\":\"DetectEntitiesResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"ResourceUnavailableException\"},\
        {\"shape\":\"TextSizeLimitExceededException\"},\
        {\"shape\":\"UnsupportedLanguageException\"},\
        {\"shape\":\"InternalServerException\"}\
      ],\
      \"documentation\":\"<p>Detects named entities in input text when you use the pre-trained model. Detects custom entities if you have a custom entity recognition model. </p> <p> When detecting named entities using the pre-trained model, use plain text as the input. For more information about named entities, see <a href=\\\"https://docs.aws.amazon.com/comprehend/latest/dg/how-entities.html\\\">Entities</a> in the Comprehend Developer Guide.</p> <p>When you use a custom entity recognition model, you can input plain text or you can upload a single-page input document (text, PDF, Word, or image). </p> <p>If the system detects errors while processing a page in the input document, the API response includes an entry in <code>Errors</code> for each error. </p> <p>If the system detects a document-level error in your input document, the API returns an <code>InvalidRequestException</code> error response. For details about this exception, see <a href=\\\"https://docs.aws.amazon.com/comprehend/latest/dg/idp-inputs-sync-err.html\\\"> Errors in semi-structured documents</a> in the Comprehend Developer Guide. </p>\"\
    },\
    \"DetectKeyPhrases\":{\
      \"name\":\"DetectKeyPhrases\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DetectKeyPhrasesRequest\"},\
      \"output\":{\"shape\":\"DetectKeyPhrasesResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"TextSizeLimitExceededException\"},\
        {\"shape\":\"UnsupportedLanguageException\"},\
        {\"shape\":\"InternalServerException\"}\
      ],\
      \"documentation\":\"<p>Detects the key noun phrases found in the text. </p>\"\
    },\
    \"DetectPiiEntities\":{\
      \"name\":\"DetectPiiEntities\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DetectPiiEntitiesRequest\"},\
      \"output\":{\"shape\":\"DetectPiiEntitiesResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"TextSizeLimitExceededException\"},\
        {\"shape\":\"UnsupportedLanguageException\"},\
        {\"shape\":\"InternalServerException\"}\
      ],\
      \"documentation\":\"<p>Inspects the input text for entities that contain personally identifiable information (PII) and returns information about them.</p>\"\
    },\
    \"DetectSentiment\":{\
      \"name\":\"DetectSentiment\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DetectSentimentRequest\"},\
      \"output\":{\"shape\":\"DetectSentimentResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"TextSizeLimitExceededException\"},\
        {\"shape\":\"UnsupportedLanguageException\"},\
        {\"shape\":\"InternalServerException\"}\
      ],\
      \"documentation\":\"<p>Inspects text and returns an inference of the prevailing sentiment (<code>POSITIVE</code>, <code>NEUTRAL</code>, <code>MIXED</code>, or <code>NEGATIVE</code>). </p>\"\
    },\
    \"DetectSyntax\":{\
      \"name\":\"DetectSyntax\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DetectSyntaxRequest\"},\
      \"output\":{\"shape\":\"DetectSyntaxResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"TextSizeLimitExceededException\"},\
        {\"shape\":\"UnsupportedLanguageException\"},\
        {\"shape\":\"InternalServerException\"}\
      ],\
      \"documentation\":\"<p>Inspects text for syntax and the part of speech of words in the document. For more information, see <a href=\\\"https://docs.aws.amazon.com/comprehend/latest/dg/how-syntax.html\\\">Syntax</a> in the Comprehend Developer Guide. </p>\"\
    },\
    \"DetectTargetedSentiment\":{\
      \"name\":\"DetectTargetedSentiment\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DetectTargetedSentimentRequest\"},\
      \"output\":{\"shape\":\"DetectTargetedSentimentResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"TextSizeLimitExceededException\"},\
        {\"shape\":\"UnsupportedLanguageException\"},\
        {\"shape\":\"InternalServerException\"}\
      ],\
      \"documentation\":\"<p>Inspects the input text and returns a sentiment analysis for each entity identified in the text.</p> <p>For more information about targeted sentiment, see <a href=\\\"https://docs.aws.amazon.com/comprehend/latest/dg/how-targeted-sentiment.html\\\">Targeted sentiment</a>.</p>\"\
    },\
    \"ImportModel\":{\
      \"name\":\"ImportModel\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"ImportModelRequest\"},\
      \"output\":{\"shape\":\"ImportModelResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ResourceInUseException\"},\
        {\"shape\":\"ResourceUnavailableException\"},\
        {\"shape\":\"TooManyTagsException\"},\
        {\"shape\":\"TooManyRequestsException\"},\
        {\"shape\":\"ResourceLimitExceededException\"},\
        {\"shape\":\"KmsKeyValidationException\"},\
        {\"shape\":\"InternalServerException\"}\
      ],\
      \"documentation\":\"<p>Creates a new custom model that replicates a source custom model that you import. The source model can be in your AWS account or another one.</p> <p>If the source model is in another AWS account, then it must have a resource-based policy that authorizes you to import it.</p> <p>The source model must be in the same AWS region that you're using when you import. You can't import a model that's in a different region.</p>\"\
    },\
    \"ListDocumentClassificationJobs\":{\
      \"name\":\"ListDocumentClassificationJobs\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"ListDocumentClassificationJobsRequest\"},\
      \"output\":{\"shape\":\"ListDocumentClassificationJobsResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"TooManyRequestsException\"},\
        {\"shape\":\"InvalidFilterException\"},\
        {\"shape\":\"InternalServerException\"}\
      ],\
      \"documentation\":\"<p>Gets a list of the documentation classification jobs that you have submitted.</p>\"\
    },\
    \"ListDocumentClassifierSummaries\":{\
      \"name\":\"ListDocumentClassifierSummaries\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"ListDocumentClassifierSummariesRequest\"},\
      \"output\":{\"shape\":\"ListDocumentClassifierSummariesResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"TooManyRequestsException\"},\
        {\"shape\":\"InternalServerException\"}\
      ],\
      \"documentation\":\"<p>Gets a list of summaries of the document classifiers that you have created</p>\"\
    },\
    \"ListDocumentClassifiers\":{\
      \"name\":\"ListDocumentClassifiers\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"ListDocumentClassifiersRequest\"},\
      \"output\":{\"shape\":\"ListDocumentClassifiersResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"TooManyRequestsException\"},\
        {\"shape\":\"InvalidFilterException\"},\
        {\"shape\":\"InternalServerException\"}\
      ],\
      \"documentation\":\"<p>Gets a list of the document classifiers that you have created.</p>\"\
    },\
    \"ListDominantLanguageDetectionJobs\":{\
      \"name\":\"ListDominantLanguageDetectionJobs\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"ListDominantLanguageDetectionJobsRequest\"},\
      \"output\":{\"shape\":\"ListDominantLanguageDetectionJobsResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"TooManyRequestsException\"},\
        {\"shape\":\"InvalidFilterException\"},\
        {\"shape\":\"InternalServerException\"}\
      ],\
      \"documentation\":\"<p>Gets a list of the dominant language detection jobs that you have submitted.</p>\"\
    },\
    \"ListEndpoints\":{\
      \"name\":\"ListEndpoints\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"ListEndpointsRequest\"},\
      \"output\":{\"shape\":\"ListEndpointsResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"TooManyRequestsException\"},\
        {\"shape\":\"InternalServerException\"}\
      ],\
      \"documentation\":\"<p>Gets a list of all existing endpoints that you've created. For information about endpoints, see <a href=\\\"https://docs.aws.amazon.com/comprehend/latest/dg/manage-endpoints.html\\\">Managing endpoints</a>.</p>\"\
    },\
    \"ListEntitiesDetectionJobs\":{\
      \"name\":\"ListEntitiesDetectionJobs\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"ListEntitiesDetectionJobsRequest\"},\
      \"output\":{\"shape\":\"ListEntitiesDetectionJobsResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"TooManyRequestsException\"},\
        {\"shape\":\"InvalidFilterException\"},\
        {\"shape\":\"InternalServerException\"}\
      ],\
      \"documentation\":\"<p>Gets a list of the entity detection jobs that you have submitted.</p>\"\
    },\
    \"ListEntityRecognizerSummaries\":{\
      \"name\":\"ListEntityRecognizerSummaries\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"ListEntityRecognizerSummariesRequest\"},\
      \"output\":{\"shape\":\"ListEntityRecognizerSummariesResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"TooManyRequestsException\"},\
        {\"shape\":\"InternalServerException\"}\
      ],\
      \"documentation\":\"<p>Gets a list of summaries for the entity recognizers that you have created.</p>\"\
    },\
    \"ListEntityRecognizers\":{\
      \"name\":\"ListEntityRecognizers\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"ListEntityRecognizersRequest\"},\
      \"output\":{\"shape\":\"ListEntityRecognizersResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"TooManyRequestsException\"},\
        {\"shape\":\"InvalidFilterException\"},\
        {\"shape\":\"InternalServerException\"}\
      ],\
      \"documentation\":\"<p>Gets a list of the properties of all entity recognizers that you created, including recognizers currently in training. Allows you to filter the list of recognizers based on criteria such as status and submission time. This call returns up to 500 entity recognizers in the list, with a default number of 100 recognizers in the list.</p> <p>The results of this list are not in any particular order. Please get the list and sort locally if needed.</p>\"\
    },\
    \"ListEventsDetectionJobs\":{\
      \"name\":\"ListEventsDetectionJobs\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"ListEventsDetectionJobsRequest\"},\
      \"output\":{\"shape\":\"ListEventsDetectionJobsResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"TooManyRequestsException\"},\
        {\"shape\":\"InvalidFilterException\"},\
        {\"shape\":\"InternalServerException\"}\
      ],\
      \"documentation\":\"<p>Gets a list of the events detection jobs that you have submitted.</p>\"\
    },\
    \"ListKeyPhrasesDetectionJobs\":{\
      \"name\":\"ListKeyPhrasesDetectionJobs\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"ListKeyPhrasesDetectionJobsRequest\"},\
      \"output\":{\"shape\":\"ListKeyPhrasesDetectionJobsResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"TooManyRequestsException\"},\
        {\"shape\":\"InvalidFilterException\"},\
        {\"shape\":\"InternalServerException\"}\
      ],\
      \"documentation\":\"<p>Get a list of key phrase detection jobs that you have submitted.</p>\"\
    },\
    \"ListPiiEntitiesDetectionJobs\":{\
      \"name\":\"ListPiiEntitiesDetectionJobs\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"ListPiiEntitiesDetectionJobsRequest\"},\
      \"output\":{\"shape\":\"ListPiiEntitiesDetectionJobsResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"TooManyRequestsException\"},\
        {\"shape\":\"InvalidFilterException\"},\
        {\"shape\":\"InternalServerException\"}\
      ],\
      \"documentation\":\"<p>Gets a list of the PII entity detection jobs that you have submitted.</p>\"\
    },\
    \"ListSentimentDetectionJobs\":{\
      \"name\":\"ListSentimentDetectionJobs\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"ListSentimentDetectionJobsRequest\"},\
      \"output\":{\"shape\":\"ListSentimentDetectionJobsResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"TooManyRequestsException\"},\
        {\"shape\":\"InvalidFilterException\"},\
        {\"shape\":\"InternalServerException\"}\
      ],\
      \"documentation\":\"<p>Gets a list of sentiment detection jobs that you have submitted.</p>\"\
    },\
    \"ListTagsForResource\":{\
      \"name\":\"ListTagsForResource\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"ListTagsForResourceRequest\"},\
      \"output\":{\"shape\":\"ListTagsForResourceResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InternalServerException\"}\
      ],\
      \"documentation\":\"<p>Lists all tags associated with a given Amazon Comprehend resource. </p>\"\
    },\
    \"ListTargetedSentimentDetectionJobs\":{\
      \"name\":\"ListTargetedSentimentDetectionJobs\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"ListTargetedSentimentDetectionJobsRequest\"},\
      \"output\":{\"shape\":\"ListTargetedSentimentDetectionJobsResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"TooManyRequestsException\"},\
        {\"shape\":\"InvalidFilterException\"},\
        {\"shape\":\"InternalServerException\"}\
      ],\
      \"documentation\":\"<p>Gets a list of targeted sentiment detection jobs that you have submitted.</p>\"\
    },\
    \"ListTopicsDetectionJobs\":{\
      \"name\":\"ListTopicsDetectionJobs\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"ListTopicsDetectionJobsRequest\"},\
      \"output\":{\"shape\":\"ListTopicsDetectionJobsResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"TooManyRequestsException\"},\
        {\"shape\":\"InvalidFilterException\"},\
        {\"shape\":\"InternalServerException\"}\
      ],\
      \"documentation\":\"<p>Gets a list of the topic detection jobs that you have submitted.</p>\"\
    },\
    \"PutResourcePolicy\":{\
      \"name\":\"PutResourcePolicy\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"PutResourcePolicyRequest\"},\
      \"output\":{\"shape\":\"PutResourcePolicyResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InternalServerException\"}\
      ],\
      \"documentation\":\"<p>Attaches a resource-based policy to a custom model. You can use this policy to authorize an entity in another AWS account to import the custom model, which replicates it in Amazon Comprehend in their account.</p>\"\
    },\
    \"StartDocumentClassificationJob\":{\
      \"name\":\"StartDocumentClassificationJob\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"StartDocumentClassificationJobRequest\"},\
      \"output\":{\"shape\":\"StartDocumentClassificationJobResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"TooManyRequestsException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ResourceUnavailableException\"},\
        {\"shape\":\"KmsKeyValidationException\"},\
        {\"shape\":\"TooManyTagsException\"},\
        {\"shape\":\"InternalServerException\"}\
      ],\
      \"documentation\":\"<p>Starts an asynchronous document classification job. Use the operation to track the progress of the job.</p>\"\
    },\
    \"StartDominantLanguageDetectionJob\":{\
      \"name\":\"StartDominantLanguageDetectionJob\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"StartDominantLanguageDetectionJobRequest\"},\
      \"output\":{\"shape\":\"StartDominantLanguageDetectionJobResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"TooManyRequestsException\"},\
        {\"shape\":\"KmsKeyValidationException\"},\
        {\"shape\":\"TooManyTagsException\"},\
        {\"shape\":\"InternalServerException\"}\
      ],\
      \"documentation\":\"<p>Starts an asynchronous dominant language detection job for a collection of documents. Use the operation to track the status of a job.</p>\"\
    },\
    \"StartEntitiesDetectionJob\":{\
      \"name\":\"StartEntitiesDetectionJob\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"StartEntitiesDetectionJobRequest\"},\
      \"output\":{\"shape\":\"StartEntitiesDetectionJobResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"TooManyRequestsException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ResourceUnavailableException\"},\
        {\"shape\":\"KmsKeyValidationException\"},\
        {\"shape\":\"TooManyTagsException\"},\
        {\"shape\":\"InternalServerException\"}\
      ],\
      \"documentation\":\"<p>Starts an asynchronous entity detection job for a collection of documents. Use the operation to track the status of a job.</p> <p>This API can be used for either standard entity detection or custom entity recognition. In order to be used for custom entity recognition, the optional <code>EntityRecognizerArn</code> must be used in order to provide access to the recognizer being used to detect the custom entity.</p>\"\
    },\
    \"StartEventsDetectionJob\":{\
      \"name\":\"StartEventsDetectionJob\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"StartEventsDetectionJobRequest\"},\
      \"output\":{\"shape\":\"StartEventsDetectionJobResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"TooManyRequestsException\"},\
        {\"shape\":\"KmsKeyValidationException\"},\
        {\"shape\":\"TooManyTagsException\"},\
        {\"shape\":\"InternalServerException\"}\
      ],\
      \"documentation\":\"<p>Starts an asynchronous event detection job for a collection of documents.</p>\"\
    },\
    \"StartKeyPhrasesDetectionJob\":{\
      \"name\":\"StartKeyPhrasesDetectionJob\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"StartKeyPhrasesDetectionJobRequest\"},\
      \"output\":{\"shape\":\"StartKeyPhrasesDetectionJobResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"TooManyRequestsException\"},\
        {\"shape\":\"KmsKeyValidationException\"},\
        {\"shape\":\"TooManyTagsException\"},\
        {\"shape\":\"InternalServerException\"}\
      ],\
      \"documentation\":\"<p>Starts an asynchronous key phrase detection job for a collection of documents. Use the operation to track the status of a job.</p>\"\
    },\
    \"StartPiiEntitiesDetectionJob\":{\
      \"name\":\"StartPiiEntitiesDetectionJob\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"StartPiiEntitiesDetectionJobRequest\"},\
      \"output\":{\"shape\":\"StartPiiEntitiesDetectionJobResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"TooManyRequestsException\"},\
        {\"shape\":\"KmsKeyValidationException\"},\
        {\"shape\":\"TooManyTagsException\"},\
        {\"shape\":\"InternalServerException\"}\
      ],\
      \"documentation\":\"<p>Starts an asynchronous PII entity detection job for a collection of documents.</p>\"\
    },\
    \"StartSentimentDetectionJob\":{\
      \"name\":\"StartSentimentDetectionJob\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"StartSentimentDetectionJobRequest\"},\
      \"output\":{\"shape\":\"StartSentimentDetectionJobResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"TooManyRequestsException\"},\
        {\"shape\":\"KmsKeyValidationException\"},\
        {\"shape\":\"TooManyTagsException\"},\
        {\"shape\":\"InternalServerException\"}\
      ],\
      \"documentation\":\"<p>Starts an asynchronous sentiment detection job for a collection of documents. Use the operation to track the status of a job.</p>\"\
    },\
    \"StartTargetedSentimentDetectionJob\":{\
      \"name\":\"StartTargetedSentimentDetectionJob\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"StartTargetedSentimentDetectionJobRequest\"},\
      \"output\":{\"shape\":\"StartTargetedSentimentDetectionJobResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"TooManyRequestsException\"},\
        {\"shape\":\"KmsKeyValidationException\"},\
        {\"shape\":\"TooManyTagsException\"},\
        {\"shape\":\"InternalServerException\"}\
      ],\
      \"documentation\":\"<p>Starts an asynchronous targeted sentiment detection job for a collection of documents. Use the operation to track the status of a job.</p>\"\
    },\
    \"StartTopicsDetectionJob\":{\
      \"name\":\"StartTopicsDetectionJob\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"StartTopicsDetectionJobRequest\"},\
      \"output\":{\"shape\":\"StartTopicsDetectionJobResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"TooManyRequestsException\"},\
        {\"shape\":\"KmsKeyValidationException\"},\
        {\"shape\":\"TooManyTagsException\"},\
        {\"shape\":\"InternalServerException\"}\
      ],\
      \"documentation\":\"<p>Starts an asynchronous topic detection job. Use the <code>DescribeTopicDetectionJob</code> operation to track the status of a job.</p>\"\
    },\
    \"StopDominantLanguageDetectionJob\":{\
      \"name\":\"StopDominantLanguageDetectionJob\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"StopDominantLanguageDetectionJobRequest\"},\
      \"output\":{\"shape\":\"StopDominantLanguageDetectionJobResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"JobNotFoundException\"},\
        {\"shape\":\"InternalServerException\"}\
      ],\
      \"documentation\":\"<p>Stops a dominant language detection job in progress.</p> <p>If the job state is <code>IN_PROGRESS</code> the job is marked for termination and put into the <code>STOP_REQUESTED</code> state. If the job completes before it can be stopped, it is put into the <code>COMPLETED</code> state; otherwise the job is stopped and put into the <code>STOPPED</code> state.</p> <p>If the job is in the <code>COMPLETED</code> or <code>FAILED</code> state when you call the <code>StopDominantLanguageDetectionJob</code> operation, the operation returns a 400 Internal Request Exception. </p> <p>When a job is stopped, any documents already processed are written to the output location.</p>\"\
    },\
    \"StopEntitiesDetectionJob\":{\
      \"name\":\"StopEntitiesDetectionJob\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"StopEntitiesDetectionJobRequest\"},\
      \"output\":{\"shape\":\"StopEntitiesDetectionJobResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"JobNotFoundException\"},\
        {\"shape\":\"InternalServerException\"}\
      ],\
      \"documentation\":\"<p>Stops an entities detection job in progress.</p> <p>If the job state is <code>IN_PROGRESS</code> the job is marked for termination and put into the <code>STOP_REQUESTED</code> state. If the job completes before it can be stopped, it is put into the <code>COMPLETED</code> state; otherwise the job is stopped and put into the <code>STOPPED</code> state.</p> <p>If the job is in the <code>COMPLETED</code> or <code>FAILED</code> state when you call the <code>StopDominantLanguageDetectionJob</code> operation, the operation returns a 400 Internal Request Exception. </p> <p>When a job is stopped, any documents already processed are written to the output location.</p>\"\
    },\
    \"StopEventsDetectionJob\":{\
      \"name\":\"StopEventsDetectionJob\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"StopEventsDetectionJobRequest\"},\
      \"output\":{\"shape\":\"StopEventsDetectionJobResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"JobNotFoundException\"},\
        {\"shape\":\"InternalServerException\"}\
      ],\
      \"documentation\":\"<p>Stops an events detection job in progress.</p>\"\
    },\
    \"StopKeyPhrasesDetectionJob\":{\
      \"name\":\"StopKeyPhrasesDetectionJob\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"StopKeyPhrasesDetectionJobRequest\"},\
      \"output\":{\"shape\":\"StopKeyPhrasesDetectionJobResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"JobNotFoundException\"},\
        {\"shape\":\"InternalServerException\"}\
      ],\
      \"documentation\":\"<p>Stops a key phrases detection job in progress.</p> <p>If the job state is <code>IN_PROGRESS</code> the job is marked for termination and put into the <code>STOP_REQUESTED</code> state. If the job completes before it can be stopped, it is put into the <code>COMPLETED</code> state; otherwise the job is stopped and put into the <code>STOPPED</code> state.</p> <p>If the job is in the <code>COMPLETED</code> or <code>FAILED</code> state when you call the <code>StopDominantLanguageDetectionJob</code> operation, the operation returns a 400 Internal Request Exception. </p> <p>When a job is stopped, any documents already processed are written to the output location.</p>\"\
    },\
    \"StopPiiEntitiesDetectionJob\":{\
      \"name\":\"StopPiiEntitiesDetectionJob\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"StopPiiEntitiesDetectionJobRequest\"},\
      \"output\":{\"shape\":\"StopPiiEntitiesDetectionJobResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"JobNotFoundException\"},\
        {\"shape\":\"InternalServerException\"}\
      ],\
      \"documentation\":\"<p>Stops a PII entities detection job in progress.</p>\"\
    },\
    \"StopSentimentDetectionJob\":{\
      \"name\":\"StopSentimentDetectionJob\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"StopSentimentDetectionJobRequest\"},\
      \"output\":{\"shape\":\"StopSentimentDetectionJobResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"JobNotFoundException\"},\
        {\"shape\":\"InternalServerException\"}\
      ],\
      \"documentation\":\"<p>Stops a sentiment detection job in progress.</p> <p>If the job state is <code>IN_PROGRESS</code>, the job is marked for termination and put into the <code>STOP_REQUESTED</code> state. If the job completes before it can be stopped, it is put into the <code>COMPLETED</code> state; otherwise the job is be stopped and put into the <code>STOPPED</code> state.</p> <p>If the job is in the <code>COMPLETED</code> or <code>FAILED</code> state when you call the <code>StopDominantLanguageDetectionJob</code> operation, the operation returns a 400 Internal Request Exception. </p> <p>When a job is stopped, any documents already processed are written to the output location.</p>\"\
    },\
    \"StopTargetedSentimentDetectionJob\":{\
      \"name\":\"StopTargetedSentimentDetectionJob\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"StopTargetedSentimentDetectionJobRequest\"},\
      \"output\":{\"shape\":\"StopTargetedSentimentDetectionJobResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"JobNotFoundException\"},\
        {\"shape\":\"InternalServerException\"}\
      ],\
      \"documentation\":\"<p>Stops a targeted sentiment detection job in progress.</p> <p>If the job state is <code>IN_PROGRESS</code>, the job is marked for termination and put into the <code>STOP_REQUESTED</code> state. If the job completes before it can be stopped, it is put into the <code>COMPLETED</code> state; otherwise the job is be stopped and put into the <code>STOPPED</code> state.</p> <p>If the job is in the <code>COMPLETED</code> or <code>FAILED</code> state when you call the <code>StopDominantLanguageDetectionJob</code> operation, the operation returns a 400 Internal Request Exception. </p> <p>When a job is stopped, any documents already processed are written to the output location.</p>\"\
    },\
    \"StopTrainingDocumentClassifier\":{\
      \"name\":\"StopTrainingDocumentClassifier\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"StopTrainingDocumentClassifierRequest\"},\
      \"output\":{\"shape\":\"StopTrainingDocumentClassifierResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"TooManyRequestsException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InternalServerException\"}\
      ],\
      \"documentation\":\"<p>Stops a document classifier training job while in progress.</p> <p>If the training job state is <code>TRAINING</code>, the job is marked for termination and put into the <code>STOP_REQUESTED</code> state. If the training job completes before it can be stopped, it is put into the <code>TRAINED</code>; otherwise the training job is stopped and put into the <code>STOPPED</code> state and the service sends back an HTTP 200 response with an empty HTTP body. </p>\"\
    },\
    \"StopTrainingEntityRecognizer\":{\
      \"name\":\"StopTrainingEntityRecognizer\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"StopTrainingEntityRecognizerRequest\"},\
      \"output\":{\"shape\":\"StopTrainingEntityRecognizerResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"TooManyRequestsException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InternalServerException\"}\
      ],\
      \"documentation\":\"<p>Stops an entity recognizer training job while in progress.</p> <p>If the training job state is <code>TRAINING</code>, the job is marked for termination and put into the <code>STOP_REQUESTED</code> state. If the training job completes before it can be stopped, it is put into the <code>TRAINED</code>; otherwise the training job is stopped and putted into the <code>STOPPED</code> state and the service sends back an HTTP 200 response with an empty HTTP body.</p>\"\
    },\
    \"TagResource\":{\
      \"name\":\"TagResource\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"TagResourceRequest\"},\
      \"output\":{\"shape\":\"TagResourceResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"ConcurrentModificationException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"TooManyTagsException\"},\
        {\"shape\":\"InternalServerException\"}\
      ],\
      \"documentation\":\"<p>Associates a specific tag with an Amazon Comprehend resource. A tag is a key-value pair that adds as a metadata to a resource used by Amazon Comprehend. For example, a tag with \\\"Sales\\\" as the key might be added to a resource to indicate its use by the sales department. </p>\"\
    },\
    \"UntagResource\":{\
      \"name\":\"UntagResource\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"UntagResourceRequest\"},\
      \"output\":{\"shape\":\"UntagResourceResponse\"},\
      \"errors\":[\
        {\"shape\":\"TooManyTagKeysException\"},\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"ConcurrentModificationException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InternalServerException\"}\
      ],\
      \"documentation\":\"<p>Removes a specific tag associated with an Amazon Comprehend resource. </p>\"\
    },\
    \"UpdateEndpoint\":{\
      \"name\":\"UpdateEndpoint\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"UpdateEndpointRequest\"},\
      \"output\":{\"shape\":\"UpdateEndpointResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidRequestException\"},\
        {\"shape\":\"TooManyRequestsException\"},\
        {\"shape\":\"ResourceInUseException\"},\
        {\"shape\":\"ResourceLimitExceededException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ResourceUnavailableException\"},\
        {\"shape\":\"InternalServerException\"}\
      ],\
      \"documentation\":\"<p>Updates information about the specified endpoint. For information about endpoints, see <a href=\\\"https://docs.aws.amazon.com/comprehend/latest/dg/manage-endpoints.html\\\">Managing endpoints</a>.</p>\"\
    }\
  },\
  \"shapes\":{\
    \"AnyLengthString\":{\"type\":\"string\"},\
    \"AttributeNamesList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"AttributeNamesListItem\"}\
    },\
    \"AttributeNamesListItem\":{\
      \"type\":\"string\",\
      \"max\":63,\
      \"min\":1,\
      \"pattern\":\"^[a-zA-Z0-9](-*[a-zA-Z0-9])*\"\
    },\
    \"AugmentedManifestsDocumentTypeFormat\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"PLAIN_TEXT_DOCUMENT\",\
        \"SEMI_STRUCTURED_DOCUMENT\"\
      ]\
    },\
    \"AugmentedManifestsListItem\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"S3Uri\",\
        \"AttributeNames\"\
      ],\
      \"members\":{\
        \"S3Uri\":{\
          \"shape\":\"S3Uri\",\
          \"documentation\":\"<p>The Amazon S3 location of the augmented manifest file.</p>\"\
        },\
        \"Split\":{\
          \"shape\":\"Split\",\
          \"documentation\":\"<p>The purpose of the data you've provided in the augmented manifest. You can either train or test this data. If you don't specify, the default is train.</p> <p>TRAIN - all of the documents in the manifest will be used for training. If no test documents are provided, Amazon Comprehend will automatically reserve a portion of the training documents for testing.</p> <p> TEST - all of the documents in the manifest will be used for testing.</p>\"\
        },\
        \"AttributeNames\":{\
          \"shape\":\"AttributeNamesList\",\
          \"documentation\":\"<p>The JSON attribute that contains the annotations for your training documents. The number of attribute names that you specify depends on whether your augmented manifest file is the output of a single labeling job or a chained labeling job.</p> <p>If your file is the output of a single labeling job, specify the LabelAttributeName key that was used when the job was created in Ground Truth.</p> <p>If your file is the output of a chained labeling job, specify the LabelAttributeName key for one or more jobs in the chain. Each LabelAttributeName key provides the annotations from an individual job.</p>\"\
        },\
        \"AnnotationDataS3Uri\":{\
          \"shape\":\"S3Uri\",\
          \"documentation\":\"<p>The S3 prefix to the annotation files that are referred in the augmented manifest file.</p>\"\
        },\
        \"SourceDocumentsS3Uri\":{\
          \"shape\":\"S3Uri\",\
          \"documentation\":\"<p>The S3 prefix to the source files (PDFs) that are referred to in the augmented manifest file.</p>\"\
        },\
        \"DocumentType\":{\
          \"shape\":\"AugmentedManifestsDocumentTypeFormat\",\
          \"documentation\":\"<p>The type of augmented manifest. PlainTextDocument or SemiStructuredDocument. If you don't specify, the default is PlainTextDocument. </p> <ul> <li> <p> <code>PLAIN_TEXT_DOCUMENT</code> A document type that represents any unicode text that is encoded in UTF-8.</p> </li> <li> <p> <code>SEMI_STRUCTURED_DOCUMENT</code> A document type with positional and structural context, like a PDF. For training with Amazon Comprehend, only PDFs are supported. For inference, Amazon Comprehend support PDFs, DOCX and TXT.</p> </li> </ul>\"\
        }\
      },\
      \"documentation\":\"<p>An augmented manifest file that provides training data for your custom model. An augmented manifest file is a labeled dataset that is produced by Amazon SageMaker Ground Truth.</p>\"\
    },\
    \"BatchDetectDominantLanguageItemResult\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Index\":{\
          \"shape\":\"Integer\",\
          \"documentation\":\"<p>The zero-based index of the document in the input list.</p>\"\
        },\
        \"Languages\":{\
          \"shape\":\"ListOfDominantLanguages\",\
          \"documentation\":\"<p>One or more <a>DominantLanguage</a> objects describing the dominant languages in the document.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The result of calling the operation. The operation returns one object for each document that is successfully processed by the operation.</p>\"\
    },\
    \"BatchDetectDominantLanguageRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"TextList\"],\
      \"members\":{\
        \"TextList\":{\
          \"shape\":\"CustomerInputStringList\",\
          \"documentation\":\"<p>A list containing the UTF-8 encoded text of the input documents. The list can contain a maximum of 25 documents. Each document should contain at least 20 characters. The maximum size of each document is 5 KB.</p>\"\
        }\
      }\
    },\
    \"BatchDetectDominantLanguageResponse\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"ResultList\",\
        \"ErrorList\"\
      ],\
      \"members\":{\
        \"ResultList\":{\
          \"shape\":\"ListOfDetectDominantLanguageResult\",\
          \"documentation\":\"<p>A list of objects containing the results of the operation. The results are sorted in ascending order by the <code>Index</code> field and match the order of the documents in the input list. If all of the documents contain an error, the <code>ResultList</code> is empty.</p>\"\
        },\
        \"ErrorList\":{\
          \"shape\":\"BatchItemErrorList\",\
          \"documentation\":\"<p>A list containing one object for each document that contained an error. The results are sorted in ascending order by the <code>Index</code> field and match the order of the documents in the input list. If there are no errors in the batch, the <code>ErrorList</code> is empty.</p>\"\
        }\
      },\
      \"sensitive\":true\
    },\
    \"BatchDetectEntitiesItemResult\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Index\":{\
          \"shape\":\"Integer\",\
          \"documentation\":\"<p>The zero-based index of the document in the input list.</p>\"\
        },\
        \"Entities\":{\
          \"shape\":\"ListOfEntities\",\
          \"documentation\":\"<p>One or more <a>Entity</a> objects, one for each entity detected in the document.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The result of calling the operation. The operation returns one object for each document that is successfully processed by the operation.</p>\"\
    },\
    \"BatchDetectEntitiesRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"TextList\",\
        \"LanguageCode\"\
      ],\
      \"members\":{\
        \"TextList\":{\
          \"shape\":\"CustomerInputStringList\",\
          \"documentation\":\"<p>A list containing the UTF-8 encoded text of the input documents. The list can contain a maximum of 25 documents. The maximum size of each document is 5 KB.</p>\"\
        },\
        \"LanguageCode\":{\
          \"shape\":\"LanguageCode\",\
          \"documentation\":\"<p>The language of the input documents. You can specify any of the primary languages supported by Amazon Comprehend. All documents must be in the same language.</p>\"\
        }\
      }\
    },\
    \"BatchDetectEntitiesResponse\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"ResultList\",\
        \"ErrorList\"\
      ],\
      \"members\":{\
        \"ResultList\":{\
          \"shape\":\"ListOfDetectEntitiesResult\",\
          \"documentation\":\"<p>A list of objects containing the results of the operation. The results are sorted in ascending order by the <code>Index</code> field and match the order of the documents in the input list. If all of the documents contain an error, the <code>ResultList</code> is empty.</p>\"\
        },\
        \"ErrorList\":{\
          \"shape\":\"BatchItemErrorList\",\
          \"documentation\":\"<p>A list containing one object for each document that contained an error. The results are sorted in ascending order by the <code>Index</code> field and match the order of the documents in the input list. If there are no errors in the batch, the <code>ErrorList</code> is empty.</p>\"\
        }\
      },\
      \"sensitive\":true\
    },\
    \"BatchDetectKeyPhrasesItemResult\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Index\":{\
          \"shape\":\"Integer\",\
          \"documentation\":\"<p>The zero-based index of the document in the input list.</p>\"\
        },\
        \"KeyPhrases\":{\
          \"shape\":\"ListOfKeyPhrases\",\
          \"documentation\":\"<p>One or more <a>KeyPhrase</a> objects, one for each key phrase detected in the document.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The result of calling the operation. The operation returns one object for each document that is successfully processed by the operation.</p>\"\
    },\
    \"BatchDetectKeyPhrasesRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"TextList\",\
        \"LanguageCode\"\
      ],\
      \"members\":{\
        \"TextList\":{\
          \"shape\":\"CustomerInputStringList\",\
          \"documentation\":\"<p>A list containing the UTF-8 encoded text of the input documents. The list can contain a maximum of 25 documents. The maximum size of each document is 5 KB.</p>\"\
        },\
        \"LanguageCode\":{\
          \"shape\":\"LanguageCode\",\
          \"documentation\":\"<p>The language of the input documents. You can specify any of the primary languages supported by Amazon Comprehend. All documents must be in the same language.</p>\"\
        }\
      }\
    },\
    \"BatchDetectKeyPhrasesResponse\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"ResultList\",\
        \"ErrorList\"\
      ],\
      \"members\":{\
        \"ResultList\":{\
          \"shape\":\"ListOfDetectKeyPhrasesResult\",\
          \"documentation\":\"<p>A list of objects containing the results of the operation. The results are sorted in ascending order by the <code>Index</code> field and match the order of the documents in the input list. If all of the documents contain an error, the <code>ResultList</code> is empty.</p>\"\
        },\
        \"ErrorList\":{\
          \"shape\":\"BatchItemErrorList\",\
          \"documentation\":\"<p>A list containing one object for each document that contained an error. The results are sorted in ascending order by the <code>Index</code> field and match the order of the documents in the input list. If there are no errors in the batch, the <code>ErrorList</code> is empty.</p>\"\
        }\
      },\
      \"sensitive\":true\
    },\
    \"BatchDetectSentimentItemResult\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Index\":{\
          \"shape\":\"Integer\",\
          \"documentation\":\"<p>The zero-based index of the document in the input list.</p>\"\
        },\
        \"Sentiment\":{\
          \"shape\":\"SentimentType\",\
          \"documentation\":\"<p>The sentiment detected in the document.</p>\"\
        },\
        \"SentimentScore\":{\
          \"shape\":\"SentimentScore\",\
          \"documentation\":\"<p>The level of confidence that Amazon Comprehend has in the accuracy of its sentiment detection.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The result of calling the operation. The operation returns one object for each document that is successfully processed by the operation.</p>\"\
    },\
    \"BatchDetectSentimentRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"TextList\",\
        \"LanguageCode\"\
      ],\
      \"members\":{\
        \"TextList\":{\
          \"shape\":\"CustomerInputStringList\",\
          \"documentation\":\"<p>A list containing the UTF-8 encoded text of the input documents. The list can contain a maximum of 25 documents. The maximum size of each document is 5 KB. </p> <note> <p>Amazon Comprehend performs real-time sentiment analysis on the first 500 characters of the input text and ignores any additional text in the input.</p> </note>\"\
        },\
        \"LanguageCode\":{\
          \"shape\":\"LanguageCode\",\
          \"documentation\":\"<p>The language of the input documents. You can specify any of the primary languages supported by Amazon Comprehend. All documents must be in the same language.</p>\"\
        }\
      }\
    },\
    \"BatchDetectSentimentResponse\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"ResultList\",\
        \"ErrorList\"\
      ],\
      \"members\":{\
        \"ResultList\":{\
          \"shape\":\"ListOfDetectSentimentResult\",\
          \"documentation\":\"<p>A list of objects containing the results of the operation. The results are sorted in ascending order by the <code>Index</code> field and match the order of the documents in the input list. If all of the documents contain an error, the <code>ResultList</code> is empty.</p>\"\
        },\
        \"ErrorList\":{\
          \"shape\":\"BatchItemErrorList\",\
          \"documentation\":\"<p>A list containing one object for each document that contained an error. The results are sorted in ascending order by the <code>Index</code> field and match the order of the documents in the input list. If there are no errors in the batch, the <code>ErrorList</code> is empty.</p>\"\
        }\
      },\
      \"sensitive\":true\
    },\
    \"BatchDetectSyntaxItemResult\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Index\":{\
          \"shape\":\"Integer\",\
          \"documentation\":\"<p>The zero-based index of the document in the input list.</p>\"\
        },\
        \"SyntaxTokens\":{\
          \"shape\":\"ListOfSyntaxTokens\",\
          \"documentation\":\"<p>The syntax tokens for the words in the document, one token for each word.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The result of calling the operation. The operation returns one object that is successfully processed by the operation.</p>\"\
    },\
    \"BatchDetectSyntaxRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"TextList\",\
        \"LanguageCode\"\
      ],\
      \"members\":{\
        \"TextList\":{\
          \"shape\":\"CustomerInputStringList\",\
          \"documentation\":\"<p>A list containing the UTF-8 encoded text of the input documents. The list can contain a maximum of 25 documents. The maximum size for each document is 5 KB.</p>\"\
        },\
        \"LanguageCode\":{\
          \"shape\":\"SyntaxLanguageCode\",\
          \"documentation\":\"<p>The language of the input documents. You can specify any of the following languages supported by Amazon Comprehend: German (\\\"de\\\"), English (\\\"en\\\"), Spanish (\\\"es\\\"), French (\\\"fr\\\"), Italian (\\\"it\\\"), or Portuguese (\\\"pt\\\"). All documents must be in the same language.</p>\"\
        }\
      }\
    },\
    \"BatchDetectSyntaxResponse\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"ResultList\",\
        \"ErrorList\"\
      ],\
      \"members\":{\
        \"ResultList\":{\
          \"shape\":\"ListOfDetectSyntaxResult\",\
          \"documentation\":\"<p>A list of objects containing the results of the operation. The results are sorted in ascending order by the <code>Index</code> field and match the order of the documents in the input list. If all of the documents contain an error, the <code>ResultList</code> is empty.</p>\"\
        },\
        \"ErrorList\":{\
          \"shape\":\"BatchItemErrorList\",\
          \"documentation\":\"<p>A list containing one object for each document that contained an error. The results are sorted in ascending order by the <code>Index</code> field and match the order of the documents in the input list. If there are no errors in the batch, the <code>ErrorList</code> is empty.</p>\"\
        }\
      },\
      \"sensitive\":true\
    },\
    \"BatchDetectTargetedSentimentItemResult\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Index\":{\
          \"shape\":\"Integer\",\
          \"documentation\":\"<p>The zero-based index of this result in the input list.</p>\"\
        },\
        \"Entities\":{\
          \"shape\":\"ListOfTargetedSentimentEntities\",\
          \"documentation\":\"<p>An array of targeted sentiment entities.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Analysis results for one of the documents in the batch.</p>\"\
    },\
    \"BatchDetectTargetedSentimentRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"TextList\",\
        \"LanguageCode\"\
      ],\
      \"members\":{\
        \"TextList\":{\
          \"shape\":\"CustomerInputStringList\",\
          \"documentation\":\"<p>A list containing the UTF-8 encoded text of the input documents. The list can contain a maximum of 25 documents. The maximum size of each document is 5 KB.</p>\"\
        },\
        \"LanguageCode\":{\
          \"shape\":\"LanguageCode\",\
          \"documentation\":\"<p>The language of the input documents. Currently, English is the only supported language.</p>\"\
        }\
      }\
    },\
    \"BatchDetectTargetedSentimentResponse\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"ResultList\",\
        \"ErrorList\"\
      ],\
      \"members\":{\
        \"ResultList\":{\
          \"shape\":\"ListOfDetectTargetedSentimentResult\",\
          \"documentation\":\"<p>A list of objects containing the results of the operation. The results are sorted in ascending order by the <code>Index</code> field and match the order of the documents in the input list. If all of the documents contain an error, the <code>ResultList</code> is empty.</p>\"\
        },\
        \"ErrorList\":{\
          \"shape\":\"BatchItemErrorList\",\
          \"documentation\":\"<p>List of errors that the operation can return.</p>\"\
        }\
      },\
      \"sensitive\":true\
    },\
    \"BatchItemError\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Index\":{\
          \"shape\":\"Integer\",\
          \"documentation\":\"<p>The zero-based index of the document in the input list.</p>\"\
        },\
        \"ErrorCode\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The numeric error code of the error.</p>\"\
        },\
        \"ErrorMessage\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>A text description of the error.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Describes an error that occurred while processing a document in a batch. The operation returns on <code>BatchItemError</code> object for each document that contained an error.</p>\"\
    },\
    \"BatchItemErrorList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"BatchItemError\"}\
    },\
    \"BatchSizeLimitExceededException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Message\":{\"shape\":\"String\"}\
      },\
      \"documentation\":\"<p>The number of documents in the request exceeds the limit of 25. Try your request again with fewer documents.</p>\",\
      \"exception\":true\
    },\
    \"Block\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Id\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>Unique identifier for the block.</p>\"\
        },\
        \"BlockType\":{\
          \"shape\":\"BlockType\",\
          \"documentation\":\"<p>The block represents a line of text or one word of text.</p> <ul> <li> <p>WORD - A word that's detected on a document page. A word is one or more ISO basic Latin script characters that aren't separated by spaces.</p> </li> <li> <p>LINE - A string of tab-delimited, contiguous words that are detected on a document page</p> </li> </ul>\"\
        },\
        \"Text\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The word or line of text extracted from the block.</p>\"\
        },\
        \"Page\":{\
          \"shape\":\"Integer\",\
          \"documentation\":\"<p>Page number where the block appears.</p>\"\
        },\
        \"Geometry\":{\
          \"shape\":\"Geometry\",\
          \"documentation\":\"<p>Co-ordinates of the rectangle or polygon that contains the text.</p>\"\
        },\
        \"Relationships\":{\
          \"shape\":\"ListOfRelationships\",\
          \"documentation\":\"<p>A list of child blocks of the current block. For example, a LINE object has child blocks for each WORD block that's part of the line of text. </p>\"\
        }\
      },\
      \"documentation\":\"<p>Information about each word or line of text in the input document.</p> <p>For additional information, see <a href=\\\"https://docs.aws.amazon.com/textract/latest/dg/API_Block.html\\\">Block</a> in the Amazon Textract API reference.</p>\"\
    },\
    \"BlockReference\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"BlockId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>Unique identifier for the block.</p>\"\
        },\
        \"BeginOffset\":{\
          \"shape\":\"Integer\",\
          \"documentation\":\"<p>Offset of the start of the block within its parent block.</p>\"\
        },\
        \"EndOffset\":{\
          \"shape\":\"Integer\",\
          \"documentation\":\"<p>Offset of the end of the block within its parent block.</p>\"\
        },\
        \"ChildBlocks\":{\
          \"shape\":\"ListOfChildBlocks\",\
          \"documentation\":\"<p>List of child blocks within this block.</p>\"\
        }\
      },\
      \"documentation\":\"<p>A reference to a block. </p>\"\
    },\
    \"BlockType\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"LINE\",\
        \"WORD\"\
      ]\
    },\
    \"BoundingBox\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Height\":{\
          \"shape\":\"Float\",\
          \"documentation\":\"<p>The height of the bounding box as a ratio of the overall document page height.</p>\"\
        },\
        \"Left\":{\
          \"shape\":\"Float\",\
          \"documentation\":\"<p>The left coordinate of the bounding box as a ratio of overall document page width.</p>\"\
        },\
        \"Top\":{\
          \"shape\":\"Float\",\
          \"documentation\":\"<p>The top coordinate of the bounding box as a ratio of overall document page height.</p>\"\
        },\
        \"Width\":{\
          \"shape\":\"Float\",\
          \"documentation\":\"<p>The width of the bounding box as a ratio of the overall document page width.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The bounding box around the detected page or around an element on a document page. The left (x-coordinate) and top (y-coordinate) are coordinates that represent the top and left sides of the bounding box. Note that the upper-left corner of the image is the origin (0,0). </p> <p>For additional information, see <a href=\\\"https://docs.aws.amazon.com/textract/latest/dg/API_BoundingBox.html\\\">BoundingBox</a> in the Amazon Textract API reference.</p>\"\
    },\
    \"ChildBlock\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"ChildBlockId\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>Unique identifier for the child block.</p>\"\
        },\
        \"BeginOffset\":{\
          \"shape\":\"Integer\",\
          \"documentation\":\"<p>Offset of the start of the child block within its parent block.</p>\"\
        },\
        \"EndOffset\":{\
          \"shape\":\"Integer\",\
          \"documentation\":\"<p>Offset of the end of the child block within its parent block.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Nested block contained within a block.</p>\"\
    },\
    \"ClassifierEvaluationMetrics\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Accuracy\":{\
          \"shape\":\"Double\",\
          \"documentation\":\"<p>The fraction of the labels that were correct recognized. It is computed by dividing the number of labels in the test documents that were correctly recognized by the total number of labels in the test documents.</p>\"\
        },\
        \"Precision\":{\
          \"shape\":\"Double\",\
          \"documentation\":\"<p>A measure of the usefulness of the classifier results in the test data. High precision means that the classifier returned substantially more relevant results than irrelevant ones.</p>\"\
        },\
        \"Recall\":{\
          \"shape\":\"Double\",\
          \"documentation\":\"<p>A measure of how complete the classifier results are for the test data. High recall means that the classifier returned most of the relevant results. </p>\"\
        },\
        \"F1Score\":{\
          \"shape\":\"Double\",\
          \"documentation\":\"<p>A measure of how accurate the classifier results are for the test data. It is derived from the <code>Precision</code> and <code>Recall</code> values. The <code>F1Score</code> is the harmonic average of the two scores. The highest score is 1, and the worst score is 0. </p>\"\
        },\
        \"MicroPrecision\":{\
          \"shape\":\"Double\",\
          \"documentation\":\"<p>A measure of the usefulness of the recognizer results in the test data. High precision means that the recognizer returned substantially more relevant results than irrelevant ones. Unlike the Precision metric which comes from averaging the precision of all available labels, this is based on the overall score of all precision scores added together.</p>\"\
        },\
        \"MicroRecall\":{\
          \"shape\":\"Double\",\
          \"documentation\":\"<p>A measure of how complete the classifier results are for the test data. High recall means that the classifier returned most of the relevant results. Specifically, this indicates how many of the correct categories in the text that the model can predict. It is a percentage of correct categories in the text that can found. Instead of averaging the recall scores of all labels (as with Recall), micro Recall is based on the overall score of all recall scores added together.</p>\"\
        },\
        \"MicroF1Score\":{\
          \"shape\":\"Double\",\
          \"documentation\":\"<p>A measure of how accurate the classifier results are for the test data. It is a combination of the <code>Micro Precision</code> and <code>Micro Recall</code> values. The <code>Micro F1Score</code> is the harmonic mean of the two scores. The highest score is 1, and the worst score is 0.</p>\"\
        },\
        \"HammingLoss\":{\
          \"shape\":\"Double\",\
          \"documentation\":\"<p>Indicates the fraction of labels that are incorrectly predicted. Also seen as the fraction of wrong labels compared to the total number of labels. Scores closer to zero are better.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Describes the result metrics for the test data associated with an documentation classifier.</p>\"\
    },\
    \"ClassifierMetadata\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"NumberOfLabels\":{\
          \"shape\":\"Integer\",\
          \"documentation\":\"<p>The number of labels in the input data. </p>\"\
        },\
        \"NumberOfTrainedDocuments\":{\
          \"shape\":\"Integer\",\
          \"documentation\":\"<p>The number of documents in the input data that were used to train the classifier. Typically this is 80 to 90 percent of the input documents.</p>\"\
        },\
        \"NumberOfTestDocuments\":{\
          \"shape\":\"Integer\",\
          \"documentation\":\"<p>The number of documents in the input data that were used to test the classifier. Typically this is 10 to 20 percent of the input documents, up to 10,000 documents.</p>\"\
        },\
        \"EvaluationMetrics\":{\
          \"shape\":\"ClassifierEvaluationMetrics\",\
          \"documentation\":\"<p> Describes the result metrics for the test data associated with an documentation classifier.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Provides information about a document classifier.</p>\",\
      \"sensitive\":true\
    },\
    \"ClassifyDocumentRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"EndpointArn\"],\
      \"members\":{\
        \"Text\":{\
          \"shape\":\"CustomerInputString\",\
          \"documentation\":\"<p>The document text to be analyzed. If you enter text using this parameter, do not use the <code>Bytes</code> parameter.</p>\"\
        },\
        \"EndpointArn\":{\
          \"shape\":\"DocumentClassifierEndpointArn\",\
          \"documentation\":\"<p>The Amazon Resource Number (ARN) of the endpoint. For information about endpoints, see <a href=\\\"https://docs.aws.amazon.com/comprehend/latest/dg/manage-endpoints.html\\\">Managing endpoints</a>.</p>\"\
        },\
        \"Bytes\":{\
          \"shape\":\"SemiStructuredDocumentBlob\",\
          \"documentation\":\"<p>Use the <code>Bytes</code> parameter to input a text, PDF, Word or image file. You can also use the <code>Bytes</code> parameter to input an Amazon Textract <code>DetectDocumentText</code> or <code>AnalyzeDocument</code> output file.</p> <p>Provide the input document as a sequence of base64-encoded bytes. If your code uses an Amazon Web Services SDK to classify documents, the SDK may encode the document file bytes for you. </p> <p>The maximum length of this field depends on the input document type. For details, see <a href=\\\"https://docs.aws.amazon.com/comprehend/latest/dg/idp-inputs-sync.html\\\"> Inputs for real-time custom analysis</a> in the Comprehend Developer Guide. </p> <p>If you use the <code>Bytes</code> parameter, do not use the <code>Text</code> parameter.</p>\"\
        },\
        \"DocumentReaderConfig\":{\
          \"shape\":\"DocumentReaderConfig\",\
          \"documentation\":\"<p>Provides configuration parameters to override the default actions for extracting text from PDF documents and image files.</p>\"\
        }\
      }\
    },\
    \"ClassifyDocumentResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Classes\":{\
          \"shape\":\"ListOfClasses\",\
          \"documentation\":\"<p>The classes used by the document being analyzed. These are used for multi-class trained models. Individual classes are mutually exclusive and each document is expected to have only a single class assigned to it. For example, an animal can be a dog or a cat, but not both at the same time. </p>\"\
        },\
        \"Labels\":{\
          \"shape\":\"ListOfLabels\",\
          \"documentation\":\"<p>The labels used the document being analyzed. These are used for multi-label trained models. Individual labels represent different categories that are related in some manner and are not mutually exclusive. For example, a movie can be just an action movie, or it can be an action movie, a science fiction movie, and a comedy, all at the same time. </p>\"\
        },\
        \"DocumentMetadata\":{\
          \"shape\":\"DocumentMetadata\",\
          \"documentation\":\"<p>Extraction information about the document. This field is present in the response only if your request includes the <code>Byte</code> parameter. </p>\"\
        },\
        \"DocumentType\":{\
          \"shape\":\"ListOfDocumentType\",\
          \"documentation\":\"<p>The document type for each page in the input document. This field is present in the response only if your request includes the <code>Byte</code> parameter. </p>\"\
        },\
        \"Errors\":{\
          \"shape\":\"ListOfErrors\",\
          \"documentation\":\"<p>Page-level errors that the system detected while processing the input document. The field is empty if the system encountered no errors.</p>\"\
        }\
      },\
      \"sensitive\":true\
    },\
    \"ClientRequestTokenString\":{\
      \"type\":\"string\",\
      \"max\":64,\
      \"min\":1,\
      \"pattern\":\"^[a-zA-Z0-9-]+$\"\
    },\
    \"ComprehendArn\":{\
      \"type\":\"string\",\
      \"max\":256,\
      \"pattern\":\"arn:aws(-[^:]+)?:comprehend:[a-zA-Z0-9-]*:[0-9]{12}:[a-zA-Z0-9-]{1,64}/[a-zA-Z0-9](-*[a-zA-Z0-9])*(/version/[a-zA-Z0-9](-*[a-zA-Z0-9])*)?\"\
    },\
    \"ComprehendArnName\":{\
      \"type\":\"string\",\
      \"max\":63,\
      \"pattern\":\"^[a-zA-Z0-9](-*[a-zA-Z0-9])*$\"\
    },\
    \"ComprehendEndpointArn\":{\
      \"type\":\"string\",\
      \"max\":256,\
      \"pattern\":\"arn:aws(-[^:]+)?:comprehend:[a-zA-Z0-9-]*:[0-9]{12}:(document-classifier-endpoint|entity-recognizer-endpoint)/[a-zA-Z0-9](-*[a-zA-Z0-9])*\"\
    },\
    \"ComprehendEndpointName\":{\
      \"type\":\"string\",\
      \"max\":40,\
      \"pattern\":\"^[a-zA-Z0-9](-*[a-zA-Z0-9])*$\"\
    },\
    \"ComprehendModelArn\":{\
      \"type\":\"string\",\
      \"max\":256,\
      \"pattern\":\"arn:aws(-[^:]+)?:comprehend:[a-zA-Z0-9-]*:[0-9]{12}:(document-classifier|entity-recognizer)/[a-zA-Z0-9](-*[a-zA-Z0-9])*(/version/[a-zA-Z0-9](-*[a-zA-Z0-9])*)?\"\
    },\
    \"ConcurrentModificationException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Message\":{\"shape\":\"String\"}\
      },\
      \"documentation\":\"<p>Concurrent modification of the tags associated with an Amazon Comprehend resource is not supported. </p>\",\
      \"exception\":true\
    },\
    \"ContainsPiiEntitiesRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"Text\",\
        \"LanguageCode\"\
      ],\
      \"members\":{\
        \"Text\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>A UTF-8 text string. The maximum string size is 100 KB.</p>\"\
        },\
        \"LanguageCode\":{\
          \"shape\":\"LanguageCode\",\
          \"documentation\":\"<p>The language of the input documents. Currently, English is the only valid language.</p>\"\
        }\
      }\
    },\
    \"ContainsPiiEntitiesResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Labels\":{\
          \"shape\":\"ListOfEntityLabels\",\
          \"documentation\":\"<p>The labels used in the document being analyzed. Individual labels represent personally identifiable information (PII) entity types.</p>\"\
        }\
      }\
    },\
    \"CreateDocumentClassifierRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"DocumentClassifierName\",\
        \"DataAccessRoleArn\",\
        \"InputDataConfig\",\
        \"LanguageCode\"\
      ],\
      \"members\":{\
        \"DocumentClassifierName\":{\
          \"shape\":\"ComprehendArnName\",\
          \"documentation\":\"<p>The name of the document classifier.</p>\"\
        },\
        \"VersionName\":{\
          \"shape\":\"VersionName\",\
          \"documentation\":\"<p>The version name given to the newly created classifier. Version names can have a maximum of 256 characters. Alphanumeric characters, hyphens (-) and underscores (_) are allowed. The version name must be unique among all models with the same classifier name in the account/AWS Region.</p>\"\
        },\
        \"DataAccessRoleArn\":{\
          \"shape\":\"IamRoleArn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the AWS Identity and Management (IAM) role that grants Amazon Comprehend read access to your input data.</p>\"\
        },\
        \"Tags\":{\
          \"shape\":\"TagList\",\
          \"documentation\":\"<p>Tags to be associated with the document classifier being created. A tag is a key-value pair that adds as a metadata to a resource used by Amazon Comprehend. For example, a tag with \\\"Sales\\\" as the key might be added to a resource to indicate its use by the sales department. </p>\"\
        },\
        \"InputDataConfig\":{\
          \"shape\":\"DocumentClassifierInputDataConfig\",\
          \"documentation\":\"<p>Specifies the format and location of the input data for the job.</p>\"\
        },\
        \"OutputDataConfig\":{\
          \"shape\":\"DocumentClassifierOutputDataConfig\",\
          \"documentation\":\"<p>Enables the addition of output results configuration parameters for custom classifier jobs.</p>\"\
        },\
        \"ClientRequestToken\":{\
          \"shape\":\"ClientRequestTokenString\",\
          \"documentation\":\"<p>A unique identifier for the request. If you don't set the client request token, Amazon Comprehend generates one.</p>\",\
          \"idempotencyToken\":true\
        },\
        \"LanguageCode\":{\
          \"shape\":\"LanguageCode\",\
          \"documentation\":\"<p>The language of the input documents. You can specify any of the following languages supported by Amazon Comprehend: German (\\\"de\\\"), English (\\\"en\\\"), Spanish (\\\"es\\\"), French (\\\"fr\\\"), Italian (\\\"it\\\"), or Portuguese (\\\"pt\\\"). All documents must be in the same language.</p>\"\
        },\
        \"VolumeKmsKeyId\":{\
          \"shape\":\"KmsKeyId\",\
          \"documentation\":\"<p>ID for the AWS Key Management Service (KMS) key that Amazon Comprehend uses to encrypt data on the storage volume attached to the ML compute instance(s) that process the analysis job. The VolumeKmsKeyId can be either of the following formats:</p> <ul> <li> <p>KMS Key ID: <code>\\\"1234abcd-12ab-34cd-56ef-1234567890ab\\\"</code> </p> </li> <li> <p>Amazon Resource Name (ARN) of a KMS Key: <code>\\\"arn:aws:kms:us-west-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab\\\"</code> </p> </li> </ul>\"\
        },\
        \"VpcConfig\":{\
          \"shape\":\"VpcConfig\",\
          \"documentation\":\"<p>Configuration parameters for an optional private Virtual Private Cloud (VPC) containing the resources you are using for your custom classifier. For more information, see <a href=\\\"https://docs.aws.amazon.com/vpc/latest/userguide/what-is-amazon-vpc.html\\\">Amazon VPC</a>. </p>\"\
        },\
        \"Mode\":{\
          \"shape\":\"DocumentClassifierMode\",\
          \"documentation\":\"<p>Indicates the mode in which the classifier will be trained. The classifier can be trained in multi-class mode, which identifies one and only one class for each document, or multi-label mode, which identifies one or more labels for each document. In multi-label mode, multiple labels for an individual document are separated by a delimiter. The default delimiter between labels is a pipe (|).</p>\"\
        },\
        \"ModelKmsKeyId\":{\
          \"shape\":\"KmsKeyId\",\
          \"documentation\":\"<p>ID for the AWS Key Management Service (KMS) key that Amazon Comprehend uses to encrypt trained custom models. The ModelKmsKeyId can be either of the following formats:</p> <ul> <li> <p>KMS Key ID: <code>\\\"1234abcd-12ab-34cd-56ef-1234567890ab\\\"</code> </p> </li> <li> <p>Amazon Resource Name (ARN) of a KMS Key: <code>\\\"arn:aws:kms:us-west-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab\\\"</code> </p> </li> </ul>\"\
        },\
        \"ModelPolicy\":{\
          \"shape\":\"Policy\",\
          \"documentation\":\"<p>The resource-based policy to attach to your custom document classifier model. You can use this policy to allow another AWS account to import your custom model.</p> <p>Provide your policy as a JSON body that you enter as a UTF-8 encoded string without line breaks. To provide valid JSON, enclose the attribute names and values in double quotes. If the JSON body is also enclosed in double quotes, then you must escape the double quotes that are inside the policy:</p> <p> <code>\\\"{\\\\\\\"attribute\\\\\\\": \\\\\\\"value\\\\\\\", \\\\\\\"attribute\\\\\\\": [\\\\\\\"value\\\\\\\"]}\\\"</code> </p> <p>To avoid escaping quotes, you can use single quotes to enclose the policy and double quotes to enclose the JSON names and values:</p> <p> <code>'{\\\"attribute\\\": \\\"value\\\", \\\"attribute\\\": [\\\"value\\\"]}'</code> </p>\"\
        }\
      }\
    },\
    \"CreateDocumentClassifierResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"DocumentClassifierArn\":{\
          \"shape\":\"DocumentClassifierArn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) that identifies the document classifier.</p>\"\
        }\
      }\
    },\
    \"CreateEndpointRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"EndpointName\",\
        \"ModelArn\",\
        \"DesiredInferenceUnits\"\
      ],\
      \"members\":{\
        \"EndpointName\":{\
          \"shape\":\"ComprehendEndpointName\",\
          \"documentation\":\"<p>This is the descriptive suffix that becomes part of the <code>EndpointArn</code> used for all subsequent requests to this resource. </p>\"\
        },\
        \"ModelArn\":{\
          \"shape\":\"ComprehendModelArn\",\
          \"documentation\":\"<p>The Amazon Resource Number (ARN) of the model to which the endpoint will be attached.</p>\"\
        },\
        \"DesiredInferenceUnits\":{\
          \"shape\":\"InferenceUnitsInteger\",\
          \"documentation\":\"<p> The desired number of inference units to be used by the model using this endpoint. Each inference unit represents of a throughput of 100 characters per second.</p>\"\
        },\
        \"ClientRequestToken\":{\
          \"shape\":\"ClientRequestTokenString\",\
          \"documentation\":\"<p>An idempotency token provided by the customer. If this token matches a previous endpoint creation request, Amazon Comprehend will not return a <code>ResourceInUseException</code>. </p>\",\
          \"idempotencyToken\":true\
        },\
        \"Tags\":{\
          \"shape\":\"TagList\",\
          \"documentation\":\"<p>Tags associated with the endpoint being created. A tag is a key-value pair that adds metadata to the endpoint. For example, a tag with \\\"Sales\\\" as the key might be added to an endpoint to indicate its use by the sales department. </p>\"\
        },\
        \"DataAccessRoleArn\":{\
          \"shape\":\"IamRoleArn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the AWS identity and Access Management (IAM) role that grants Amazon Comprehend read access to trained custom models encrypted with a customer managed key (ModelKmsKeyId).</p>\"\
        }\
      }\
    },\
    \"CreateEndpointResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"EndpointArn\":{\
          \"shape\":\"ComprehendEndpointArn\",\
          \"documentation\":\"<p>The Amazon Resource Number (ARN) of the endpoint being created.</p>\"\
        }\
      }\
    },\
    \"CreateEntityRecognizerRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"RecognizerName\",\
        \"DataAccessRoleArn\",\
        \"InputDataConfig\",\
        \"LanguageCode\"\
      ],\
      \"members\":{\
        \"RecognizerName\":{\
          \"shape\":\"ComprehendArnName\",\
          \"documentation\":\"<p>The name given to the newly created recognizer. Recognizer names can be a maximum of 256 characters. Alphanumeric characters, hyphens (-) and underscores (_) are allowed. The name must be unique in the account/region.</p>\"\
        },\
        \"VersionName\":{\
          \"shape\":\"VersionName\",\
          \"documentation\":\"<p>The version name given to the newly created recognizer. Version names can be a maximum of 256 characters. Alphanumeric characters, hyphens (-) and underscores (_) are allowed. The version name must be unique among all models with the same recognizer name in the account/ AWS Region.</p>\"\
        },\
        \"DataAccessRoleArn\":{\
          \"shape\":\"IamRoleArn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the AWS Identity and Management (IAM) role that grants Amazon Comprehend read access to your input data.</p>\"\
        },\
        \"Tags\":{\
          \"shape\":\"TagList\",\
          \"documentation\":\"<p>Tags to be associated with the entity recognizer being created. A tag is a key-value pair that adds as a metadata to a resource used by Amazon Comprehend. For example, a tag with \\\"Sales\\\" as the key might be added to a resource to indicate its use by the sales department. </p>\"\
        },\
        \"InputDataConfig\":{\
          \"shape\":\"EntityRecognizerInputDataConfig\",\
          \"documentation\":\"<p>Specifies the format and location of the input data. The S3 bucket containing the input data must be located in the same region as the entity recognizer being created. </p>\"\
        },\
        \"ClientRequestToken\":{\
          \"shape\":\"ClientRequestTokenString\",\
          \"documentation\":\"<p> A unique identifier for the request. If you don't set the client request token, Amazon Comprehend generates one.</p>\",\
          \"idempotencyToken\":true\
        },\
        \"LanguageCode\":{\
          \"shape\":\"LanguageCode\",\
          \"documentation\":\"<p> You can specify any of the following languages: English (\\\"en\\\"), Spanish (\\\"es\\\"), French (\\\"fr\\\"), Italian (\\\"it\\\"), German (\\\"de\\\"), or Portuguese (\\\"pt\\\"). If you plan to use this entity recognizer with PDF, Word, or image input files, you must specify English as the language. All training documents must be in the same language.</p>\"\
        },\
        \"VolumeKmsKeyId\":{\
          \"shape\":\"KmsKeyId\",\
          \"documentation\":\"<p>ID for the AWS Key Management Service (KMS) key that Amazon Comprehend uses to encrypt data on the storage volume attached to the ML compute instance(s) that process the analysis job. The VolumeKmsKeyId can be either of the following formats:</p> <ul> <li> <p>KMS Key ID: <code>\\\"1234abcd-12ab-34cd-56ef-1234567890ab\\\"</code> </p> </li> <li> <p>Amazon Resource Name (ARN) of a KMS Key: <code>\\\"arn:aws:kms:us-west-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab\\\"</code> </p> </li> </ul>\"\
        },\
        \"VpcConfig\":{\
          \"shape\":\"VpcConfig\",\
          \"documentation\":\"<p>Configuration parameters for an optional private Virtual Private Cloud (VPC) containing the resources you are using for your custom entity recognizer. For more information, see <a href=\\\"https://docs.aws.amazon.com/vpc/latest/userguide/what-is-amazon-vpc.html\\\">Amazon VPC</a>. </p>\"\
        },\
        \"ModelKmsKeyId\":{\
          \"shape\":\"KmsKeyId\",\
          \"documentation\":\"<p>ID for the AWS Key Management Service (KMS) key that Amazon Comprehend uses to encrypt trained custom models. The ModelKmsKeyId can be either of the following formats</p> <ul> <li> <p>KMS Key ID: <code>\\\"1234abcd-12ab-34cd-56ef-1234567890ab\\\"</code> </p> </li> <li> <p>Amazon Resource Name (ARN) of a KMS Key: <code>\\\"arn:aws:kms:us-west-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab\\\"</code> </p> </li> </ul>\"\
        },\
        \"ModelPolicy\":{\
          \"shape\":\"Policy\",\
          \"documentation\":\"<p>The JSON resource-based policy to attach to your custom entity recognizer model. You can use this policy to allow another AWS account to import your custom model.</p> <p>Provide your JSON as a UTF-8 encoded string without line breaks. To provide valid JSON for your policy, enclose the attribute names and values in double quotes. If the JSON body is also enclosed in double quotes, then you must escape the double quotes that are inside the policy:</p> <p> <code>\\\"{\\\\\\\"attribute\\\\\\\": \\\\\\\"value\\\\\\\", \\\\\\\"attribute\\\\\\\": [\\\\\\\"value\\\\\\\"]}\\\"</code> </p> <p>To avoid escaping quotes, you can use single quotes to enclose the policy and double quotes to enclose the JSON names and values:</p> <p> <code>'{\\\"attribute\\\": \\\"value\\\", \\\"attribute\\\": [\\\"value\\\"]}'</code> </p>\"\
        }\
      }\
    },\
    \"CreateEntityRecognizerResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"EntityRecognizerArn\":{\
          \"shape\":\"EntityRecognizerArn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) that identifies the entity recognizer.</p>\"\
        }\
      }\
    },\
    \"CustomerInputString\":{\
      \"type\":\"string\",\
      \"min\":1,\
      \"sensitive\":true\
    },\
    \"CustomerInputStringList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"CustomerInputString\"},\
      \"min\":1,\
      \"sensitive\":true\
    },\
    \"DeleteDocumentClassifierRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"DocumentClassifierArn\"],\
      \"members\":{\
        \"DocumentClassifierArn\":{\
          \"shape\":\"DocumentClassifierArn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) that identifies the document classifier. </p>\"\
        }\
      }\
    },\
    \"DeleteDocumentClassifierResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
      }\
    },\
    \"DeleteEndpointRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"EndpointArn\"],\
      \"members\":{\
        \"EndpointArn\":{\
          \"shape\":\"ComprehendEndpointArn\",\
          \"documentation\":\"<p>The Amazon Resource Number (ARN) of the endpoint being deleted.</p>\"\
        }\
      }\
    },\
    \"DeleteEndpointResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
      }\
    },\
    \"DeleteEntityRecognizerRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"EntityRecognizerArn\"],\
      \"members\":{\
        \"EntityRecognizerArn\":{\
          \"shape\":\"EntityRecognizerArn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) that identifies the entity recognizer.</p>\"\
        }\
      }\
    },\
    \"DeleteEntityRecognizerResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
      }\
    },\
    \"DeleteResourcePolicyRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"ResourceArn\"],\
      \"members\":{\
        \"ResourceArn\":{\
          \"shape\":\"ComprehendModelArn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the custom model version that has the policy to delete.</p>\"\
        },\
        \"PolicyRevisionId\":{\
          \"shape\":\"PolicyRevisionId\",\
          \"documentation\":\"<p>The revision ID of the policy to delete.</p>\"\
        }\
      }\
    },\
    \"DeleteResourcePolicyResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
      }\
    },\
    \"DescribeDocumentClassificationJobRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"JobId\"],\
      \"members\":{\
        \"JobId\":{\
          \"shape\":\"JobId\",\
          \"documentation\":\"<p>The identifier that Amazon Comprehend generated for the job. The operation returns this identifier in its response.</p>\"\
        }\
      }\
    },\
    \"DescribeDocumentClassificationJobResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"DocumentClassificationJobProperties\":{\
          \"shape\":\"DocumentClassificationJobProperties\",\
          \"documentation\":\"<p>An object that describes the properties associated with the document classification job.</p>\"\
        }\
      }\
    },\
    \"DescribeDocumentClassifierRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"DocumentClassifierArn\"],\
      \"members\":{\
        \"DocumentClassifierArn\":{\
          \"shape\":\"DocumentClassifierArn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) that identifies the document classifier. The operation returns this identifier in its response.</p>\"\
        }\
      }\
    },\
    \"DescribeDocumentClassifierResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"DocumentClassifierProperties\":{\
          \"shape\":\"DocumentClassifierProperties\",\
          \"documentation\":\"<p>An object that contains the properties associated with a document classifier.</p>\"\
        }\
      }\
    },\
    \"DescribeDominantLanguageDetectionJobRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"JobId\"],\
      \"members\":{\
        \"JobId\":{\
          \"shape\":\"JobId\",\
          \"documentation\":\"<p>The identifier that Amazon Comprehend generated for the job. The operation returns this identifier in its response.</p>\"\
        }\
      }\
    },\
    \"DescribeDominantLanguageDetectionJobResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"DominantLanguageDetectionJobProperties\":{\
          \"shape\":\"DominantLanguageDetectionJobProperties\",\
          \"documentation\":\"<p>An object that contains the properties associated with a dominant language detection job.</p>\"\
        }\
      }\
    },\
    \"DescribeEndpointRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"EndpointArn\"],\
      \"members\":{\
        \"EndpointArn\":{\
          \"shape\":\"ComprehendEndpointArn\",\
          \"documentation\":\"<p>The Amazon Resource Number (ARN) of the endpoint being described.</p>\"\
        }\
      }\
    },\
    \"DescribeEndpointResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"EndpointProperties\":{\
          \"shape\":\"EndpointProperties\",\
          \"documentation\":\"<p>Describes information associated with the specific endpoint.</p>\"\
        }\
      }\
    },\
    \"DescribeEntitiesDetectionJobRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"JobId\"],\
      \"members\":{\
        \"JobId\":{\
          \"shape\":\"JobId\",\
          \"documentation\":\"<p>The identifier that Amazon Comprehend generated for the job. The operation returns this identifier in its response.</p>\"\
        }\
      }\
    },\
    \"DescribeEntitiesDetectionJobResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"EntitiesDetectionJobProperties\":{\
          \"shape\":\"EntitiesDetectionJobProperties\",\
          \"documentation\":\"<p>An object that contains the properties associated with an entities detection job.</p>\"\
        }\
      }\
    },\
    \"DescribeEntityRecognizerRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"EntityRecognizerArn\"],\
      \"members\":{\
        \"EntityRecognizerArn\":{\
          \"shape\":\"EntityRecognizerArn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) that identifies the entity recognizer.</p>\"\
        }\
      }\
    },\
    \"DescribeEntityRecognizerResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"EntityRecognizerProperties\":{\
          \"shape\":\"EntityRecognizerProperties\",\
          \"documentation\":\"<p>Describes information associated with an entity recognizer.</p>\"\
        }\
      }\
    },\
    \"DescribeEventsDetectionJobRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"JobId\"],\
      \"members\":{\
        \"JobId\":{\
          \"shape\":\"JobId\",\
          \"documentation\":\"<p>The identifier of the events detection job.</p>\"\
        }\
      }\
    },\
    \"DescribeEventsDetectionJobResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"EventsDetectionJobProperties\":{\
          \"shape\":\"EventsDetectionJobProperties\",\
          \"documentation\":\"<p>An object that contains the properties associated with an event detection job.</p>\"\
        }\
      }\
    },\
    \"DescribeKeyPhrasesDetectionJobRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"JobId\"],\
      \"members\":{\
        \"JobId\":{\
          \"shape\":\"JobId\",\
          \"documentation\":\"<p>The identifier that Amazon Comprehend generated for the job. The operation returns this identifier in its response.</p>\"\
        }\
      }\
    },\
    \"DescribeKeyPhrasesDetectionJobResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"KeyPhrasesDetectionJobProperties\":{\
          \"shape\":\"KeyPhrasesDetectionJobProperties\",\
          \"documentation\":\"<p>An object that contains the properties associated with a key phrases detection job. </p>\"\
        }\
      }\
    },\
    \"DescribePiiEntitiesDetectionJobRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"JobId\"],\
      \"members\":{\
        \"JobId\":{\
          \"shape\":\"JobId\",\
          \"documentation\":\"<p>The identifier that Amazon Comprehend generated for the job. The operation returns this identifier in its response.</p>\"\
        }\
      }\
    },\
    \"DescribePiiEntitiesDetectionJobResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"PiiEntitiesDetectionJobProperties\":{\"shape\":\"PiiEntitiesDetectionJobProperties\"}\
      }\
    },\
    \"DescribeResourcePolicyRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"ResourceArn\"],\
      \"members\":{\
        \"ResourceArn\":{\
          \"shape\":\"ComprehendModelArn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the custom model version that has the resource policy.</p>\"\
        }\
      }\
    },\
    \"DescribeResourcePolicyResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"ResourcePolicy\":{\
          \"shape\":\"Policy\",\
          \"documentation\":\"<p>The JSON body of the resource-based policy.</p>\"\
        },\
        \"CreationTime\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The time at which the policy was created.</p>\"\
        },\
        \"LastModifiedTime\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The time at which the policy was last modified.</p>\"\
        },\
        \"PolicyRevisionId\":{\
          \"shape\":\"PolicyRevisionId\",\
          \"documentation\":\"<p>The revision ID of the policy. Each time you modify a policy, Amazon Comprehend assigns a new revision ID, and it deletes the prior version of the policy.</p>\"\
        }\
      }\
    },\
    \"DescribeSentimentDetectionJobRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"JobId\"],\
      \"members\":{\
        \"JobId\":{\
          \"shape\":\"JobId\",\
          \"documentation\":\"<p>The identifier that Amazon Comprehend generated for the job. The operation returns this identifier in its response.</p>\"\
        }\
      }\
    },\
    \"DescribeSentimentDetectionJobResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"SentimentDetectionJobProperties\":{\
          \"shape\":\"SentimentDetectionJobProperties\",\
          \"documentation\":\"<p>An object that contains the properties associated with a sentiment detection job.</p>\"\
        }\
      }\
    },\
    \"DescribeTargetedSentimentDetectionJobRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"JobId\"],\
      \"members\":{\
        \"JobId\":{\
          \"shape\":\"JobId\",\
          \"documentation\":\"<p>The identifier that Amazon Comprehend generated for the job. The operation returns this identifier in its response.</p>\"\
        }\
      }\
    },\
    \"DescribeTargetedSentimentDetectionJobResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"TargetedSentimentDetectionJobProperties\":{\
          \"shape\":\"TargetedSentimentDetectionJobProperties\",\
          \"documentation\":\"<p>An object that contains the properties associated with a targeted sentiment detection job.</p>\"\
        }\
      }\
    },\
    \"DescribeTopicsDetectionJobRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"JobId\"],\
      \"members\":{\
        \"JobId\":{\
          \"shape\":\"JobId\",\
          \"documentation\":\"<p>The identifier assigned by the user to the detection job.</p>\"\
        }\
      }\
    },\
    \"DescribeTopicsDetectionJobResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"TopicsDetectionJobProperties\":{\
          \"shape\":\"TopicsDetectionJobProperties\",\
          \"documentation\":\"<p>The list of properties for the requested job.</p>\"\
        }\
      }\
    },\
    \"DetectDominantLanguageRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"Text\"],\
      \"members\":{\
        \"Text\":{\
          \"shape\":\"CustomerInputString\",\
          \"documentation\":\"<p>A UTF-8 text string. The string must contain at least 20 characters. The maximum string size is 100 KB.</p>\"\
        }\
      }\
    },\
    \"DetectDominantLanguageResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Languages\":{\
          \"shape\":\"ListOfDominantLanguages\",\
          \"documentation\":\"<p>The languages that Amazon Comprehend detected in the input text. For each language, the response returns the RFC 5646 language code and the level of confidence that Amazon Comprehend has in the accuracy of its inference. For more information about RFC 5646, see <a href=\\\"https://tools.ietf.org/html/rfc5646\\\">Tags for Identifying Languages</a> on the <i>IETF Tools</i> web site.</p>\"\
        }\
      },\
      \"sensitive\":true\
    },\
    \"DetectEntitiesRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Text\":{\
          \"shape\":\"CustomerInputString\",\
          \"documentation\":\"<p>A UTF-8 text string. The maximum string size is 100 KB. If you enter text using this parameter, do not use the <code>Bytes</code> parameter.</p>\"\
        },\
        \"LanguageCode\":{\
          \"shape\":\"LanguageCode\",\
          \"documentation\":\"<p>The language of the input documents. You can specify any of the primary languages supported by Amazon Comprehend. If your request includes the endpoint for a custom entity recognition model, Amazon Comprehend uses the language of your custom model, and it ignores any language code that you specify here.</p> <p>All input documents must be in the same language.</p>\"\
        },\
        \"EndpointArn\":{\
          \"shape\":\"EntityRecognizerEndpointArn\",\
          \"documentation\":\"<p>The Amazon Resource Name of an endpoint that is associated with a custom entity recognition model. Provide an endpoint if you want to detect entities by using your own custom model instead of the default model that is used by Amazon Comprehend.</p> <p>If you specify an endpoint, Amazon Comprehend uses the language of your custom model, and it ignores any language code that you provide in your request.</p> <p>For information about endpoints, see <a href=\\\"https://docs.aws.amazon.com/comprehend/latest/dg/manage-endpoints.html\\\">Managing endpoints</a>.</p>\"\
        },\
        \"Bytes\":{\
          \"shape\":\"SemiStructuredDocumentBlob\",\
          \"documentation\":\"<p>This field applies only when you use a custom entity recognition model that was trained with PDF annotations. For other cases, enter your text input in the <code>Text</code> field.</p> <p> Use the <code>Bytes</code> parameter to input a text, PDF, Word or image file. Using a plain-text file in the <code>Bytes</code> parameter is equivelent to using the <code>Text</code> parameter (the <code>Entities</code> field in the response is identical).</p> <p>You can also use the <code>Bytes</code> parameter to input an Amazon Textract <code>DetectDocumentText</code> or <code>AnalyzeDocument</code> output file.</p> <p>Provide the input document as a sequence of base64-encoded bytes. If your code uses an Amazon Web Services SDK to detect entities, the SDK may encode the document file bytes for you. </p> <p>The maximum length of this field depends on the input document type. For details, see <a href=\\\"https://docs.aws.amazon.com/comprehend/latest/dg/idp-inputs-sync.html\\\"> Inputs for real-time custom analysis</a> in the Comprehend Developer Guide. </p> <p>If you use the <code>Bytes</code> parameter, do not use the <code>Text</code> parameter.</p>\"\
        },\
        \"DocumentReaderConfig\":{\
          \"shape\":\"DocumentReaderConfig\",\
          \"documentation\":\"<p>Provides configuration parameters to override the default actions for extracting text from PDF documents and image files.</p>\"\
        }\
      }\
    },\
    \"DetectEntitiesResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Entities\":{\
          \"shape\":\"ListOfEntities\",\
          \"documentation\":\"<p>A collection of entities identified in the input text. For each entity, the response provides the entity text, entity type, where the entity text begins and ends, and the level of confidence that Amazon Comprehend has in the detection. </p> <p>If your request uses a custom entity recognition model, Amazon Comprehend detects the entities that the model is trained to recognize. Otherwise, it detects the default entity types. For a list of default entity types, see <a href=\\\"https://docs.aws.amazon.com/comprehend/latest/dg/how-entities.html\\\">Entities</a> in the Comprehend Developer Guide. </p>\"\
        },\
        \"DocumentMetadata\":{\
          \"shape\":\"DocumentMetadata\",\
          \"documentation\":\"<p>Information about the document, discovered during text extraction. This field is present in the response only if your request used the <code>Byte</code> parameter. </p>\"\
        },\
        \"DocumentType\":{\
          \"shape\":\"ListOfDocumentType\",\
          \"documentation\":\"<p>The document type for each page in the input document. This field is present in the response only if your request used the <code>Byte</code> parameter. </p>\"\
        },\
        \"Blocks\":{\
          \"shape\":\"ListOfBlocks\",\
          \"documentation\":\"<p>Information about each block of text in the input document. Blocks are nested. A page block contains a block for each line of text, which contains a block for each word. </p> <p>The <code>Block</code> content for a Word input document does not include a <code>Geometry</code> field.</p> <p>The <code>Block</code> field is not present in the response for plain-text inputs.</p>\"\
        },\
        \"Errors\":{\
          \"shape\":\"ListOfErrors\",\
          \"documentation\":\"<p>Page-level errors that the system detected while processing the input document. The field is empty if the system encountered no errors.</p>\"\
        }\
      },\
      \"sensitive\":true\
    },\
    \"DetectKeyPhrasesRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"Text\",\
        \"LanguageCode\"\
      ],\
      \"members\":{\
        \"Text\":{\
          \"shape\":\"CustomerInputString\",\
          \"documentation\":\"<p>A UTF-8 text string. The string must contain less than 100 KB of UTF-8 encoded characters.</p>\"\
        },\
        \"LanguageCode\":{\
          \"shape\":\"LanguageCode\",\
          \"documentation\":\"<p>The language of the input documents. You can specify any of the primary languages supported by Amazon Comprehend. All documents must be in the same language.</p>\"\
        }\
      }\
    },\
    \"DetectKeyPhrasesResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"KeyPhrases\":{\
          \"shape\":\"ListOfKeyPhrases\",\
          \"documentation\":\"<p>A collection of key phrases that Amazon Comprehend identified in the input text. For each key phrase, the response provides the text of the key phrase, where the key phrase begins and ends, and the level of confidence that Amazon Comprehend has in the accuracy of the detection. </p>\"\
        }\
      },\
      \"sensitive\":true\
    },\
    \"DetectPiiEntitiesRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"Text\",\
        \"LanguageCode\"\
      ],\
      \"members\":{\
        \"Text\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>A UTF-8 text string. The maximum string size is 100 KB.</p>\"\
        },\
        \"LanguageCode\":{\
          \"shape\":\"LanguageCode\",\
          \"documentation\":\"<p>The language of the input documents. Currently, English is the only valid language.</p>\"\
        }\
      }\
    },\
    \"DetectPiiEntitiesResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Entities\":{\
          \"shape\":\"ListOfPiiEntities\",\
          \"documentation\":\"<p>A collection of PII entities identified in the input text. For each entity, the response provides the entity type, where the entity text begins and ends, and the level of confidence that Amazon Comprehend has in the detection.</p>\"\
        }\
      }\
    },\
    \"DetectSentimentRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"Text\",\
        \"LanguageCode\"\
      ],\
      \"members\":{\
        \"Text\":{\
          \"shape\":\"CustomerInputString\",\
          \"documentation\":\"<p>A UTF-8 text string. The maximum string size is 5 KB.</p> <note> <p>Amazon Comprehend performs real-time sentiment analysis on the first 500 characters of the input text and ignores any additional text in the input.</p> </note>\"\
        },\
        \"LanguageCode\":{\
          \"shape\":\"LanguageCode\",\
          \"documentation\":\"<p>The language of the input documents. You can specify any of the primary languages supported by Amazon Comprehend. All documents must be in the same language.</p>\"\
        }\
      }\
    },\
    \"DetectSentimentResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Sentiment\":{\
          \"shape\":\"SentimentType\",\
          \"documentation\":\"<p>The inferred sentiment that Amazon Comprehend has the highest level of confidence in.</p>\"\
        },\
        \"SentimentScore\":{\
          \"shape\":\"SentimentScore\",\
          \"documentation\":\"<p>An object that lists the sentiments, and their corresponding confidence levels.</p>\"\
        }\
      },\
      \"sensitive\":true\
    },\
    \"DetectSyntaxRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"Text\",\
        \"LanguageCode\"\
      ],\
      \"members\":{\
        \"Text\":{\
          \"shape\":\"CustomerInputString\",\
          \"documentation\":\"<p>A UTF-8 string. The maximum string size is 5 KB.</p>\"\
        },\
        \"LanguageCode\":{\
          \"shape\":\"SyntaxLanguageCode\",\
          \"documentation\":\"<p>The language code of the input documents. You can specify any of the following languages supported by Amazon Comprehend: German (\\\"de\\\"), English (\\\"en\\\"), Spanish (\\\"es\\\"), French (\\\"fr\\\"), Italian (\\\"it\\\"), or Portuguese (\\\"pt\\\").</p>\"\
        }\
      }\
    },\
    \"DetectSyntaxResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"SyntaxTokens\":{\
          \"shape\":\"ListOfSyntaxTokens\",\
          \"documentation\":\"<p>A collection of syntax tokens describing the text. For each token, the response provides the text, the token type, where the text begins and ends, and the level of confidence that Amazon Comprehend has that the token is correct. For a list of token types, see <a href=\\\"https://docs.aws.amazon.com/comprehend/latest/dg/how-syntax.html\\\">Syntax</a> in the Comprehend Developer Guide. </p>\"\
        }\
      },\
      \"sensitive\":true\
    },\
    \"DetectTargetedSentimentRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"Text\",\
        \"LanguageCode\"\
      ],\
      \"members\":{\
        \"Text\":{\
          \"shape\":\"CustomerInputString\",\
          \"documentation\":\"<p>A UTF-8 text string. The maximum string length is 5 KB.</p>\"\
        },\
        \"LanguageCode\":{\
          \"shape\":\"LanguageCode\",\
          \"documentation\":\"<p>The language of the input documents. Currently, English is the only supported language.</p>\"\
        }\
      }\
    },\
    \"DetectTargetedSentimentResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Entities\":{\
          \"shape\":\"ListOfTargetedSentimentEntities\",\
          \"documentation\":\"<p>Targeted sentiment analysis for each of the entities identified in the input text.</p>\"\
        }\
      },\
      \"sensitive\":true\
    },\
    \"DocumentClass\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Name\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The name of the class.</p>\"\
        },\
        \"Score\":{\
          \"shape\":\"Float\",\
          \"documentation\":\"<p>The confidence score that Amazon Comprehend has this class correctly attributed.</p>\"\
        },\
        \"Page\":{\
          \"shape\":\"Integer\",\
          \"documentation\":\"<p>Page number in the input document. This field is present in the response only if your request includes the <code>Byte</code> parameter. </p>\"\
        }\
      },\
      \"documentation\":\"<p>Specifies the class that categorizes the document being analyzed</p>\"\
    },\
    \"DocumentClassificationJobFilter\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"JobName\":{\
          \"shape\":\"JobName\",\
          \"documentation\":\"<p>Filters on the name of the job.</p>\"\
        },\
        \"JobStatus\":{\
          \"shape\":\"JobStatus\",\
          \"documentation\":\"<p>Filters the list based on job status. Returns only jobs with the specified status.</p>\"\
        },\
        \"SubmitTimeBefore\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>Filters the list of jobs based on the time that the job was submitted for processing. Returns only jobs submitted before the specified time. Jobs are returned in ascending order, oldest to newest.</p>\"\
        },\
        \"SubmitTimeAfter\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>Filters the list of jobs based on the time that the job was submitted for processing. Returns only jobs submitted after the specified time. Jobs are returned in descending order, newest to oldest.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Provides information for filtering a list of document classification jobs. For more information, see the operation. You can provide only one filter parameter in each request.</p>\"\
    },\
    \"DocumentClassificationJobProperties\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"JobId\":{\
          \"shape\":\"JobId\",\
          \"documentation\":\"<p>The identifier assigned to the document classification job.</p>\"\
        },\
        \"JobArn\":{\
          \"shape\":\"ComprehendArn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the document classification job. It is a unique, fully qualified identifier for the job. It includes the AWS account, Region, and the job ID. The format of the ARN is as follows:</p> <p> <code>arn:&lt;partition&gt;:comprehend:&lt;region&gt;:&lt;account-id&gt;:document-classification-job/&lt;job-id&gt;</code> </p> <p>The following is an example job ARN:</p> <p> <code>arn:aws:comprehend:us-west-2:111122223333:document-classification-job/1234abcd12ab34cd56ef1234567890ab</code> </p>\"\
        },\
        \"JobName\":{\
          \"shape\":\"JobName\",\
          \"documentation\":\"<p>The name that you assigned to the document classification job.</p>\"\
        },\
        \"JobStatus\":{\
          \"shape\":\"JobStatus\",\
          \"documentation\":\"<p>The current status of the document classification job. If the status is <code>FAILED</code>, the <code>Message</code> field shows the reason for the failure.</p>\"\
        },\
        \"Message\":{\
          \"shape\":\"AnyLengthString\",\
          \"documentation\":\"<p>A description of the status of the job.</p>\"\
        },\
        \"SubmitTime\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The time that the document classification job was submitted for processing.</p>\"\
        },\
        \"EndTime\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The time that the document classification job completed.</p>\"\
        },\
        \"DocumentClassifierArn\":{\
          \"shape\":\"DocumentClassifierArn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) that identifies the document classifier. </p>\"\
        },\
        \"InputDataConfig\":{\
          \"shape\":\"InputDataConfig\",\
          \"documentation\":\"<p>The input data configuration that you supplied when you created the document classification job.</p>\"\
        },\
        \"OutputDataConfig\":{\
          \"shape\":\"OutputDataConfig\",\
          \"documentation\":\"<p>The output data configuration that you supplied when you created the document classification job.</p>\"\
        },\
        \"DataAccessRoleArn\":{\
          \"shape\":\"IamRoleArn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the AWS identity and Access Management (IAM) role that grants Amazon Comprehend read access to your input data.</p>\"\
        },\
        \"VolumeKmsKeyId\":{\
          \"shape\":\"KmsKeyId\",\
          \"documentation\":\"<p>ID for the AWS Key Management Service (KMS) key that Amazon Comprehend uses to encrypt data on the storage volume attached to the ML compute instance(s) that process the analysis job. The VolumeKmsKeyId can be either of the following formats:</p> <ul> <li> <p>KMS Key ID: <code>\\\"1234abcd-12ab-34cd-56ef-1234567890ab\\\"</code> </p> </li> <li> <p>Amazon Resource Name (ARN) of a KMS Key: <code>\\\"arn:aws:kms:us-west-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab\\\"</code> </p> </li> </ul>\"\
        },\
        \"VpcConfig\":{\
          \"shape\":\"VpcConfig\",\
          \"documentation\":\"<p> Configuration parameters for a private Virtual Private Cloud (VPC) containing the resources you are using for your document classification job. For more information, see <a href=\\\"https://docs.aws.amazon.com/vppc/latest/userguide/what-is-amazon-vpc.html\\\">Amazon VPC</a>. </p>\"\
        }\
      },\
      \"documentation\":\"<p>Provides information about a document classification job.</p>\"\
    },\
    \"DocumentClassificationJobPropertiesList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"DocumentClassificationJobProperties\"}\
    },\
    \"DocumentClassifierArn\":{\
      \"type\":\"string\",\
      \"max\":256,\
      \"pattern\":\"arn:aws(-[^:]+)?:comprehend:[a-zA-Z0-9-]*:[0-9]{12}:document-classifier/[a-zA-Z0-9](-*[a-zA-Z0-9])*(/version/[a-zA-Z0-9](-*[a-zA-Z0-9])*)?\"\
    },\
    \"DocumentClassifierAugmentedManifestsList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"AugmentedManifestsListItem\"}\
    },\
    \"DocumentClassifierDataFormat\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"COMPREHEND_CSV\",\
        \"AUGMENTED_MANIFEST\"\
      ]\
    },\
    \"DocumentClassifierEndpointArn\":{\
      \"type\":\"string\",\
      \"max\":256,\
      \"pattern\":\"arn:aws(-[^:]+)?:comprehend:[a-zA-Z0-9-]*:[0-9]{12}:document-classifier-endpoint/[a-zA-Z0-9](-*[a-zA-Z0-9])*\"\
    },\
    \"DocumentClassifierFilter\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Status\":{\
          \"shape\":\"ModelStatus\",\
          \"documentation\":\"<p>Filters the list of classifiers based on status.</p>\"\
        },\
        \"DocumentClassifierName\":{\
          \"shape\":\"ComprehendArnName\",\
          \"documentation\":\"<p>The name that you assigned to the document classifier</p>\"\
        },\
        \"SubmitTimeBefore\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>Filters the list of classifiers based on the time that the classifier was submitted for processing. Returns only classifiers submitted before the specified time. Classifiers are returned in ascending order, oldest to newest.</p>\"\
        },\
        \"SubmitTimeAfter\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>Filters the list of classifiers based on the time that the classifier was submitted for processing. Returns only classifiers submitted after the specified time. Classifiers are returned in descending order, newest to oldest.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Provides information for filtering a list of document classifiers. You can only specify one filtering parameter in a request. For more information, see the operation.</p>\"\
    },\
    \"DocumentClassifierInputDataConfig\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"DataFormat\":{\
          \"shape\":\"DocumentClassifierDataFormat\",\
          \"documentation\":\"<p>The format of your training data:</p> <ul> <li> <p> <code>COMPREHEND_CSV</code>: A two-column CSV file, where labels are provided in the first column, and documents are provided in the second. If you use this value, you must provide the <code>S3Uri</code> parameter in your request.</p> </li> <li> <p> <code>AUGMENTED_MANIFEST</code>: A labeled dataset that is produced by Amazon SageMaker Ground Truth. This file is in JSON lines format. Each line is a complete JSON object that contains a training document and its associated labels. </p> <p>If you use this value, you must provide the <code>AugmentedManifests</code> parameter in your request.</p> </li> </ul> <p>If you don't specify a value, Amazon Comprehend uses <code>COMPREHEND_CSV</code> as the default.</p>\"\
        },\
        \"S3Uri\":{\
          \"shape\":\"S3Uri\",\
          \"documentation\":\"<p>The Amazon S3 URI for the input data. The S3 bucket must be in the same region as the API endpoint that you are calling. The URI can point to a single input file or it can provide the prefix for a collection of input files.</p> <p>For example, if you use the URI <code>S3://bucketName/prefix</code>, if the prefix is a single file, Amazon Comprehend uses that file as input. If more than one file begins with the prefix, Amazon Comprehend uses all of them as input.</p> <p>This parameter is required if you set <code>DataFormat</code> to <code>COMPREHEND_CSV</code>.</p>\"\
        },\
        \"TestS3Uri\":{\
          \"shape\":\"S3Uri\",\
          \"documentation\":\"<p>This specifies the Amazon S3 location where the test annotations for an entity recognizer are located. The URI must be in the same AWS Region as the API endpoint that you are calling. </p>\"\
        },\
        \"LabelDelimiter\":{\
          \"shape\":\"LabelDelimiter\",\
          \"documentation\":\"<p>Indicates the delimiter used to separate each label for training a multi-label classifier. The default delimiter between labels is a pipe (|). You can use a different character as a delimiter (if it's an allowed character) by specifying it under Delimiter for labels. If the training documents use a delimiter other than the default or the delimiter you specify, the labels on that line will be combined to make a single unique label, such as LABELLABELLABEL.</p>\"\
        },\
        \"AugmentedManifests\":{\
          \"shape\":\"DocumentClassifierAugmentedManifestsList\",\
          \"documentation\":\"<p>A list of augmented manifest files that provide training data for your custom model. An augmented manifest file is a labeled dataset that is produced by Amazon SageMaker Ground Truth.</p> <p>This parameter is required if you set <code>DataFormat</code> to <code>AUGMENTED_MANIFEST</code>.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The input properties for training a document classifier. </p> <p>For more information on how the input file is formatted, see <a href=\\\"https://docs.aws.amazon.com/comprehend/latest/dg/prep-classifier-data.html\\\">Preparing training data</a> in the Comprehend Developer Guide. </p>\"\
    },\
    \"DocumentClassifierMode\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"MULTI_CLASS\",\
        \"MULTI_LABEL\"\
      ]\
    },\
    \"DocumentClassifierOutputDataConfig\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"S3Uri\":{\
          \"shape\":\"S3Uri\",\
          \"documentation\":\"<p>When you use the <code>OutputDataConfig</code> object while creating a custom classifier, you specify the Amazon S3 location where you want to write the confusion matrix. The URI must be in the same region as the API endpoint that you are calling. The location is used as the prefix for the actual location of this output file.</p> <p>When the custom classifier job is finished, the service creates the output file in a directory specific to the job. The <code>S3Uri</code> field contains the location of the output file, called <code>output.tar.gz</code>. It is a compressed archive that contains the confusion matrix.</p>\"\
        },\
        \"KmsKeyId\":{\
          \"shape\":\"KmsKeyId\",\
          \"documentation\":\"<p>ID for the AWS Key Management Service (KMS) key that Amazon Comprehend uses to encrypt the output results from an analysis job. The KmsKeyId can be one of the following formats:</p> <ul> <li> <p>KMS Key ID: <code>\\\"1234abcd-12ab-34cd-56ef-1234567890ab\\\"</code> </p> </li> <li> <p>Amazon Resource Name (ARN) of a KMS Key: <code>\\\"arn:aws:kms:us-west-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab\\\"</code> </p> </li> <li> <p>KMS Key Alias: <code>\\\"alias/ExampleAlias\\\"</code> </p> </li> <li> <p>ARN of a KMS Key Alias: <code>\\\"arn:aws:kms:us-west-2:111122223333:alias/ExampleAlias\\\"</code> </p> </li> </ul>\"\
        }\
      },\
      \"documentation\":\"<p>Provides output results configuration parameters for custom classifier jobs. </p>\"\
    },\
    \"DocumentClassifierProperties\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"DocumentClassifierArn\":{\
          \"shape\":\"DocumentClassifierArn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) that identifies the document classifier.</p>\"\
        },\
        \"LanguageCode\":{\
          \"shape\":\"LanguageCode\",\
          \"documentation\":\"<p>The language code for the language of the documents that the classifier was trained on.</p>\"\
        },\
        \"Status\":{\
          \"shape\":\"ModelStatus\",\
          \"documentation\":\"<p>The status of the document classifier. If the status is <code>TRAINED</code> the classifier is ready to use. If the status is <code>FAILED</code> you can see additional information about why the classifier wasn't trained in the <code>Message</code> field.</p>\"\
        },\
        \"Message\":{\
          \"shape\":\"AnyLengthString\",\
          \"documentation\":\"<p>Additional information about the status of the classifier.</p>\"\
        },\
        \"SubmitTime\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The time that the document classifier was submitted for training.</p>\"\
        },\
        \"EndTime\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The time that training the document classifier completed.</p>\"\
        },\
        \"TrainingStartTime\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>Indicates the time when the training starts on documentation classifiers. You are billed for the time interval between this time and the value of TrainingEndTime. </p>\"\
        },\
        \"TrainingEndTime\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The time that training of the document classifier was completed. Indicates the time when the training completes on documentation classifiers. You are billed for the time interval between this time and the value of TrainingStartTime.</p>\"\
        },\
        \"InputDataConfig\":{\
          \"shape\":\"DocumentClassifierInputDataConfig\",\
          \"documentation\":\"<p>The input data configuration that you supplied when you created the document classifier for training.</p>\"\
        },\
        \"OutputDataConfig\":{\
          \"shape\":\"DocumentClassifierOutputDataConfig\",\
          \"documentation\":\"<p> Provides output results configuration parameters for custom classifier jobs.</p>\"\
        },\
        \"ClassifierMetadata\":{\
          \"shape\":\"ClassifierMetadata\",\
          \"documentation\":\"<p>Information about the document classifier, including the number of documents used for training the classifier, the number of documents used for test the classifier, and an accuracy rating.</p>\"\
        },\
        \"DataAccessRoleArn\":{\
          \"shape\":\"IamRoleArn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the AWS Identity and Management (IAM) role that grants Amazon Comprehend read access to your input data.</p>\"\
        },\
        \"VolumeKmsKeyId\":{\
          \"shape\":\"KmsKeyId\",\
          \"documentation\":\"<p>ID for the AWS Key Management Service (KMS) key that Amazon Comprehend uses to encrypt data on the storage volume attached to the ML compute instance(s) that process the analysis job. The VolumeKmsKeyId can be either of the following formats:</p> <ul> <li> <p>KMS Key ID: <code>\\\"1234abcd-12ab-34cd-56ef-1234567890ab\\\"</code> </p> </li> <li> <p>Amazon Resource Name (ARN) of a KMS Key: <code>\\\"arn:aws:kms:us-west-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab\\\"</code> </p> </li> </ul>\"\
        },\
        \"VpcConfig\":{\
          \"shape\":\"VpcConfig\",\
          \"documentation\":\"<p> Configuration parameters for a private Virtual Private Cloud (VPC) containing the resources you are using for your custom classifier. For more information, see <a href=\\\"https://docs.aws.amazon.com/vppc/latest/userguide/what-is-amazon-vpc.html\\\">Amazon VPC</a>. </p>\"\
        },\
        \"Mode\":{\
          \"shape\":\"DocumentClassifierMode\",\
          \"documentation\":\"<p>Indicates the mode in which the specific classifier was trained. This also indicates the format of input documents and the format of the confusion matrix. Each classifier can only be trained in one mode and this cannot be changed once the classifier is trained.</p>\"\
        },\
        \"ModelKmsKeyId\":{\
          \"shape\":\"KmsKeyId\",\
          \"documentation\":\"<p>ID for the AWS Key Management Service (KMS) key that Amazon Comprehend uses to encrypt trained custom models. The ModelKmsKeyId can be either of the following formats:</p> <ul> <li> <p>KMS Key ID: <code>\\\"1234abcd-12ab-34cd-56ef-1234567890ab\\\"</code> </p> </li> <li> <p>Amazon Resource Name (ARN) of a KMS Key: <code>\\\"arn:aws:kms:us-west-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab\\\"</code> </p> </li> </ul>\"\
        },\
        \"VersionName\":{\
          \"shape\":\"VersionName\",\
          \"documentation\":\"<p>The version name that you assigned to the document classifier.</p>\"\
        },\
        \"SourceModelArn\":{\
          \"shape\":\"DocumentClassifierArn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the source model. This model was imported from a different AWS account to create the document classifier model in your AWS account.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Provides information about a document classifier.</p>\"\
    },\
    \"DocumentClassifierPropertiesList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"DocumentClassifierProperties\"}\
    },\
    \"DocumentClassifierSummariesList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"DocumentClassifierSummary\"}\
    },\
    \"DocumentClassifierSummary\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"DocumentClassifierName\":{\
          \"shape\":\"ComprehendArnName\",\
          \"documentation\":\"<p>The name that you assigned the document classifier.</p>\"\
        },\
        \"NumberOfVersions\":{\
          \"shape\":\"Integer\",\
          \"documentation\":\"<p>The number of versions you created.</p>\"\
        },\
        \"LatestVersionCreatedAt\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The time that the latest document classifier version was submitted for processing.</p>\"\
        },\
        \"LatestVersionName\":{\
          \"shape\":\"VersionName\",\
          \"documentation\":\"<p>The version name you assigned to the latest document classifier version.</p>\"\
        },\
        \"LatestVersionStatus\":{\
          \"shape\":\"ModelStatus\",\
          \"documentation\":\"<p>Provides the status of the latest document classifier version.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Describes information about a document classifier and its versions.</p>\"\
    },\
    \"DocumentLabel\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Name\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The name of the label.</p>\"\
        },\
        \"Score\":{\
          \"shape\":\"Float\",\
          \"documentation\":\"<p>The confidence score that Amazon Comprehend has this label correctly attributed.</p>\"\
        },\
        \"Page\":{\
          \"shape\":\"Integer\",\
          \"documentation\":\"<p>Page number where the label occurs. This field is present in the response only if your request includes the <code>Byte</code> parameter. </p>\"\
        }\
      },\
      \"documentation\":\"<p>Specifies one of the label or labels that categorize the document being analyzed.</p>\"\
    },\
    \"DocumentMetadata\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Pages\":{\
          \"shape\":\"Integer\",\
          \"documentation\":\"<p>Number of pages in the document.</p>\"\
        },\
        \"ExtractedCharacters\":{\
          \"shape\":\"ListOfExtractedCharacters\",\
          \"documentation\":\"<p>List of pages in the document, with the number of characters extracted from each page.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Information about the document, discovered during text extraction.</p>\"\
    },\
    \"DocumentReadAction\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"TEXTRACT_DETECT_DOCUMENT_TEXT\",\
        \"TEXTRACT_ANALYZE_DOCUMENT\"\
      ]\
    },\
    \"DocumentReadFeatureTypes\":{\
      \"type\":\"string\",\
      \"documentation\":\"<p>Specifies the type of Amazon Textract features to apply. If you chose <code>TEXTRACT_ANALYZE_DOCUMENT</code> as the read action, you must specify one or both of the following values:</p> <ul> <li> <p> <code>TABLES</code> - Returns additional information about any tables that are detected in the input document. </p> </li> <li> <p> <code>FORMS</code> - Returns additional information about any forms that are detected in the input document. </p> </li> </ul>\",\
      \"enum\":[\
        \"TABLES\",\
        \"FORMS\"\
      ]\
    },\
    \"DocumentReadMode\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"SERVICE_DEFAULT\",\
        \"FORCE_DOCUMENT_READ_ACTION\"\
      ]\
    },\
    \"DocumentReaderConfig\":{\
      \"type\":\"structure\",\
      \"required\":[\"DocumentReadAction\"],\
      \"members\":{\
        \"DocumentReadAction\":{\
          \"shape\":\"DocumentReadAction\",\
          \"documentation\":\"<p>This field defines the Amazon Textract API operation that Amazon Comprehend uses to extract text from PDF files and image files. Enter one of the following values:</p> <ul> <li> <p> <code>TEXTRACT_DETECT_DOCUMENT_TEXT</code> - The Amazon Comprehend service uses the <code>DetectDocumentText</code> API operation. </p> </li> <li> <p> <code>TEXTRACT_ANALYZE_DOCUMENT</code> - The Amazon Comprehend service uses the <code>AnalyzeDocument</code> API operation. </p> </li> </ul>\"\
        },\
        \"DocumentReadMode\":{\
          \"shape\":\"DocumentReadMode\",\
          \"documentation\":\"<p>Determines the text extraction actions for PDF files. Enter one of the following values:</p> <ul> <li> <p> <code>SERVICE_DEFAULT</code> - use the Amazon Comprehend service defaults for PDF files.</p> </li> <li> <p> <code>FORCE_DOCUMENT_READ_ACTION</code> - Amazon Comprehend uses the Textract API specified by DocumentReadAction for all PDF files, including digital PDF files. </p> </li> </ul>\"\
        },\
        \"FeatureTypes\":{\
          \"shape\":\"ListOfDocumentReadFeatureTypes\",\
          \"documentation\":\"<p>Specifies the type of Amazon Textract features to apply. If you chose <code>TEXTRACT_ANALYZE_DOCUMENT</code> as the read action, you must specify one or both of the following values:</p> <ul> <li> <p> <code>TABLES</code> - Returns information about any tables that are detected in the input document. </p> </li> <li> <p> <code>FORMS</code> - Returns information and the data from any forms that are detected in the input document. </p> </li> </ul>\"\
        }\
      },\
      \"documentation\":\"<p>Provides configuration parameters to override the default actions for extracting text from PDF documents and image files. </p> <p> By default, Amazon Comprehend performs the following actions to extract text from files, based on the input file type: </p> <ul> <li> <p> <b>Word files</b> - Amazon Comprehend parser extracts the text. </p> </li> <li> <p> <b>Digital PDF files</b> - Amazon Comprehend parser extracts the text. </p> </li> <li> <p> <b>Image files and scanned PDF files</b> - Amazon Comprehend uses the Amazon Textract <code>DetectDocumentText</code> API to extract the text. </p> </li> </ul> <p> <code>DocumentReaderConfig</code> does not apply to plain text files or Word files.</p> <p> For image files and PDF documents, you can override these default actions using the fields listed below. For more information, see <a href=\\\"https://docs.aws.amazon.com/comprehend/latest/dg/detecting-cer.html#detecting-cer-pdf\\\"> Setting text extraction options</a>. </p>\"\
    },\
    \"DocumentType\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"NATIVE_PDF\",\
        \"SCANNED_PDF\",\
        \"MS_WORD\",\
        \"IMAGE\",\
        \"PLAIN_TEXT\",\
        \"TEXTRACT_DETECT_DOCUMENT_TEXT_JSON\",\
        \"TEXTRACT_ANALYZE_DOCUMENT_JSON\"\
      ]\
    },\
    \"DocumentTypeListItem\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Page\":{\
          \"shape\":\"Integer\",\
          \"documentation\":\"<p>Page number.</p>\"\
        },\
        \"Type\":{\
          \"shape\":\"DocumentType\",\
          \"documentation\":\"<p>Document type.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Document type for each page in the document.</p>\"\
    },\
    \"DominantLanguage\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"LanguageCode\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The RFC 5646 language code for the dominant language. For more information about RFC 5646, see <a href=\\\"https://tools.ietf.org/html/rfc5646\\\">Tags for Identifying Languages</a> on the <i>IETF Tools</i> web site.</p>\"\
        },\
        \"Score\":{\
          \"shape\":\"Float\",\
          \"documentation\":\"<p>The level of confidence that Amazon Comprehend has in the accuracy of the detection.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Returns the code for the dominant language in the input text and the level of confidence that Amazon Comprehend has in the accuracy of the detection.</p>\"\
    },\
    \"DominantLanguageDetectionJobFilter\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"JobName\":{\
          \"shape\":\"JobName\",\
          \"documentation\":\"<p>Filters on the name of the job.</p>\"\
        },\
        \"JobStatus\":{\
          \"shape\":\"JobStatus\",\
          \"documentation\":\"<p>Filters the list of jobs based on job status. Returns only jobs with the specified status.</p>\"\
        },\
        \"SubmitTimeBefore\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>Filters the list of jobs based on the time that the job was submitted for processing. Returns only jobs submitted before the specified time. Jobs are returned in ascending order, oldest to newest.</p>\"\
        },\
        \"SubmitTimeAfter\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>Filters the list of jobs based on the time that the job was submitted for processing. Returns only jobs submitted after the specified time. Jobs are returned in descending order, newest to oldest.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Provides information for filtering a list of dominant language detection jobs. For more information, see the operation.</p>\"\
    },\
    \"DominantLanguageDetectionJobProperties\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"JobId\":{\
          \"shape\":\"JobId\",\
          \"documentation\":\"<p>The identifier assigned to the dominant language detection job.</p>\"\
        },\
        \"JobArn\":{\
          \"shape\":\"ComprehendArn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the dominant language detection job. It is a unique, fully qualified identifier for the job. It includes the AWS account, Region, and the job ID. The format of the ARN is as follows:</p> <p> <code>arn:&lt;partition&gt;:comprehend:&lt;region&gt;:&lt;account-id&gt;:dominant-language-detection-job/&lt;job-id&gt;</code> </p> <p>The following is an example job ARN:</p> <p> <code>arn:aws:comprehend:us-west-2:111122223333:dominant-language-detection-job/1234abcd12ab34cd56ef1234567890ab</code> </p>\"\
        },\
        \"JobName\":{\
          \"shape\":\"JobName\",\
          \"documentation\":\"<p>The name that you assigned to the dominant language detection job.</p>\"\
        },\
        \"JobStatus\":{\
          \"shape\":\"JobStatus\",\
          \"documentation\":\"<p>The current status of the dominant language detection job. If the status is <code>FAILED</code>, the <code>Message</code> field shows the reason for the failure.</p>\"\
        },\
        \"Message\":{\
          \"shape\":\"AnyLengthString\",\
          \"documentation\":\"<p>A description for the status of a job.</p>\"\
        },\
        \"SubmitTime\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The time that the dominant language detection job was submitted for processing.</p>\"\
        },\
        \"EndTime\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The time that the dominant language detection job completed.</p>\"\
        },\
        \"InputDataConfig\":{\
          \"shape\":\"InputDataConfig\",\
          \"documentation\":\"<p>The input data configuration that you supplied when you created the dominant language detection job.</p>\"\
        },\
        \"OutputDataConfig\":{\
          \"shape\":\"OutputDataConfig\",\
          \"documentation\":\"<p>The output data configuration that you supplied when you created the dominant language detection job.</p>\"\
        },\
        \"DataAccessRoleArn\":{\
          \"shape\":\"IamRoleArn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) that gives Amazon Comprehend read access to your input data.</p>\"\
        },\
        \"VolumeKmsKeyId\":{\
          \"shape\":\"KmsKeyId\",\
          \"documentation\":\"<p>ID for the AWS Key Management Service (KMS) key that Amazon Comprehend uses to encrypt data on the storage volume attached to the ML compute instance(s) that process the analysis job. The VolumeKmsKeyId can be either of the following formats:</p> <ul> <li> <p>KMS Key ID: <code>\\\"1234abcd-12ab-34cd-56ef-1234567890ab\\\"</code> </p> </li> <li> <p>Amazon Resource Name (ARN) of a KMS Key: <code>\\\"arn:aws:kms:us-west-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab\\\"</code> </p> </li> </ul>\"\
        },\
        \"VpcConfig\":{\
          \"shape\":\"VpcConfig\",\
          \"documentation\":\"<p> Configuration parameters for a private Virtual Private Cloud (VPC) containing the resources you are using for your dominant language detection job. For more information, see <a href=\\\"https://docs.aws.amazon.com/vpc/latest/userguide/what-is-amazon-vpc.html\\\">Amazon VPC</a>. </p>\"\
        }\
      },\
      \"documentation\":\"<p>Provides information about a dominant language detection job.</p>\"\
    },\
    \"DominantLanguageDetectionJobPropertiesList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"DominantLanguageDetectionJobProperties\"}\
    },\
    \"Double\":{\"type\":\"double\"},\
    \"EndpointFilter\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"ModelArn\":{\
          \"shape\":\"ComprehendModelArn\",\
          \"documentation\":\"<p>The Amazon Resource Number (ARN) of the model to which the endpoint is attached.</p>\"\
        },\
        \"Status\":{\
          \"shape\":\"EndpointStatus\",\
          \"documentation\":\"<p>Specifies the status of the endpoint being returned. Possible values are: Creating, Ready, Updating, Deleting, Failed.</p>\"\
        },\
        \"CreationTimeBefore\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>Specifies a date before which the returned endpoint or endpoints were created.</p>\"\
        },\
        \"CreationTimeAfter\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>Specifies a date after which the returned endpoint or endpoints were created.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The filter used to determine which endpoints are returned. You can filter jobs on their name, model, status, or the date and time that they were created. You can only set one filter at a time. </p>\"\
    },\
    \"EndpointProperties\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"EndpointArn\":{\
          \"shape\":\"ComprehendEndpointArn\",\
          \"documentation\":\"<p>The Amazon Resource Number (ARN) of the endpoint.</p>\"\
        },\
        \"Status\":{\
          \"shape\":\"EndpointStatus\",\
          \"documentation\":\"<p>Specifies the status of the endpoint. Because the endpoint updates and creation are asynchronous, so customers will need to wait for the endpoint to be <code>Ready</code> status before making inference requests.</p>\"\
        },\
        \"Message\":{\
          \"shape\":\"AnyLengthString\",\
          \"documentation\":\"<p>Specifies a reason for failure in cases of <code>Failed</code> status.</p>\"\
        },\
        \"ModelArn\":{\
          \"shape\":\"ComprehendModelArn\",\
          \"documentation\":\"<p>The Amazon Resource Number (ARN) of the model to which the endpoint is attached.</p>\"\
        },\
        \"DesiredModelArn\":{\
          \"shape\":\"ComprehendModelArn\",\
          \"documentation\":\"<p>ARN of the new model to use for updating an existing endpoint. This ARN is going to be different from the model ARN when the update is in progress</p>\"\
        },\
        \"DesiredInferenceUnits\":{\
          \"shape\":\"InferenceUnitsInteger\",\
          \"documentation\":\"<p>The desired number of inference units to be used by the model using this endpoint. Each inference unit represents of a throughput of 100 characters per second.</p>\"\
        },\
        \"CurrentInferenceUnits\":{\
          \"shape\":\"InferenceUnitsInteger\",\
          \"documentation\":\"<p>The number of inference units currently used by the model using this endpoint.</p>\"\
        },\
        \"CreationTime\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The creation date and time of the endpoint.</p>\"\
        },\
        \"LastModifiedTime\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The date and time that the endpoint was last modified.</p>\"\
        },\
        \"DataAccessRoleArn\":{\
          \"shape\":\"IamRoleArn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the AWS identity and Access Management (IAM) role that grants Amazon Comprehend read access to trained custom models encrypted with a customer managed key (ModelKmsKeyId).</p>\"\
        },\
        \"DesiredDataAccessRoleArn\":{\
          \"shape\":\"IamRoleArn\",\
          \"documentation\":\"<p>Data access role ARN to use in case the new model is encrypted with a customer KMS key.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Specifies information about the specified endpoint. For information about endpoints, see <a href=\\\"https://docs.aws.amazon.com/comprehend/latest/dg/manage-endpoints.html\\\">Managing endpoints</a>.</p>\"\
    },\
    \"EndpointPropertiesList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"EndpointProperties\"}\
    },\
    \"EndpointStatus\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"CREATING\",\
        \"DELETING\",\
        \"FAILED\",\
        \"IN_SERVICE\",\
        \"UPDATING\"\
      ]\
    },\
    \"EntitiesDetectionJobFilter\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"JobName\":{\
          \"shape\":\"JobName\",\
          \"documentation\":\"<p>Filters on the name of the job.</p>\"\
        },\
        \"JobStatus\":{\
          \"shape\":\"JobStatus\",\
          \"documentation\":\"<p>Filters the list of jobs based on job status. Returns only jobs with the specified status.</p>\"\
        },\
        \"SubmitTimeBefore\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>Filters the list of jobs based on the time that the job was submitted for processing. Returns only jobs submitted before the specified time. Jobs are returned in ascending order, oldest to newest.</p>\"\
        },\
        \"SubmitTimeAfter\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>Filters the list of jobs based on the time that the job was submitted for processing. Returns only jobs submitted after the specified time. Jobs are returned in descending order, newest to oldest.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Provides information for filtering a list of dominant language detection jobs. For more information, see the operation.</p>\"\
    },\
    \"EntitiesDetectionJobProperties\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"JobId\":{\
          \"shape\":\"JobId\",\
          \"documentation\":\"<p>The identifier assigned to the entities detection job.</p>\"\
        },\
        \"JobArn\":{\
          \"shape\":\"ComprehendArn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the entities detection job. It is a unique, fully qualified identifier for the job. It includes the AWS account, Region, and the job ID. The format of the ARN is as follows:</p> <p> <code>arn:&lt;partition&gt;:comprehend:&lt;region&gt;:&lt;account-id&gt;:entities-detection-job/&lt;job-id&gt;</code> </p> <p>The following is an example job ARN:</p> <p> <code>arn:aws:comprehend:us-west-2:111122223333:entities-detection-job/1234abcd12ab34cd56ef1234567890ab</code> </p>\"\
        },\
        \"JobName\":{\
          \"shape\":\"JobName\",\
          \"documentation\":\"<p>The name that you assigned the entities detection job.</p>\"\
        },\
        \"JobStatus\":{\
          \"shape\":\"JobStatus\",\
          \"documentation\":\"<p>The current status of the entities detection job. If the status is <code>FAILED</code>, the <code>Message</code> field shows the reason for the failure.</p>\"\
        },\
        \"Message\":{\
          \"shape\":\"AnyLengthString\",\
          \"documentation\":\"<p>A description of the status of a job.</p>\"\
        },\
        \"SubmitTime\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The time that the entities detection job was submitted for processing.</p>\"\
        },\
        \"EndTime\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The time that the entities detection job completed</p>\"\
        },\
        \"EntityRecognizerArn\":{\
          \"shape\":\"EntityRecognizerArn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) that identifies the entity recognizer.</p>\"\
        },\
        \"InputDataConfig\":{\
          \"shape\":\"InputDataConfig\",\
          \"documentation\":\"<p>The input data configuration that you supplied when you created the entities detection job.</p>\"\
        },\
        \"OutputDataConfig\":{\
          \"shape\":\"OutputDataConfig\",\
          \"documentation\":\"<p>The output data configuration that you supplied when you created the entities detection job. </p>\"\
        },\
        \"LanguageCode\":{\
          \"shape\":\"LanguageCode\",\
          \"documentation\":\"<p>The language code of the input documents.</p>\"\
        },\
        \"DataAccessRoleArn\":{\
          \"shape\":\"IamRoleArn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) that gives Amazon Comprehend read access to your input data.</p>\"\
        },\
        \"VolumeKmsKeyId\":{\
          \"shape\":\"KmsKeyId\",\
          \"documentation\":\"<p>ID for the AWS Key Management Service (KMS) key that Amazon Comprehend uses to encrypt data on the storage volume attached to the ML compute instance(s) that process the analysis job. The VolumeKmsKeyId can be either of the following formats:</p> <ul> <li> <p>KMS Key ID: <code>\\\"1234abcd-12ab-34cd-56ef-1234567890ab\\\"</code> </p> </li> <li> <p>Amazon Resource Name (ARN) of a KMS Key: <code>\\\"arn:aws:kms:us-west-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab\\\"</code> </p> </li> </ul>\"\
        },\
        \"VpcConfig\":{\
          \"shape\":\"VpcConfig\",\
          \"documentation\":\"<p> Configuration parameters for a private Virtual Private Cloud (VPC) containing the resources you are using for your entity detection job. For more information, see <a href=\\\"https://docs.aws.amazon.com/vpc/latest/userguide/what-is-amazon-vpc.html\\\">Amazon VPC</a>. </p>\"\
        }\
      },\
      \"documentation\":\"<p>Provides information about an entities detection job.</p>\"\
    },\
    \"EntitiesDetectionJobPropertiesList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"EntitiesDetectionJobProperties\"}\
    },\
    \"Entity\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Score\":{\
          \"shape\":\"Float\",\
          \"documentation\":\"<p>The level of confidence that Amazon Comprehend has in the accuracy of the detection.</p>\"\
        },\
        \"Type\":{\
          \"shape\":\"EntityType\",\
          \"documentation\":\"<p>The entity type. For entity detection using the built-in model, this field contains one of the standard entity types listed below.</p> <p>For custom entity detection, this field contains one of the entity types that you specified when you trained your custom model.</p>\"\
        },\
        \"Text\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The text of the entity.</p>\"\
        },\
        \"BeginOffset\":{\
          \"shape\":\"Integer\",\
          \"documentation\":\"<p>The zero-based offset from the beginning of the source text to the first character in the entity.</p> <p>This field is empty for non-text input.</p>\"\
        },\
        \"EndOffset\":{\
          \"shape\":\"Integer\",\
          \"documentation\":\"<p>The zero-based offset from the beginning of the source text to the last character in the entity.</p> <p>This field is empty for non-text input.</p>\"\
        },\
        \"BlockReferences\":{\
          \"shape\":\"ListOfBlockReferences\",\
          \"documentation\":\"<p>A reference to each block for this entity. This field is empty for plain-text input.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Provides information about an entity. </p> <p> </p>\"\
    },\
    \"EntityLabel\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Name\":{\
          \"shape\":\"PiiEntityType\",\
          \"documentation\":\"<p>The name of the label.</p>\"\
        },\
        \"Score\":{\
          \"shape\":\"Float\",\
          \"documentation\":\"<p>The level of confidence that Amazon Comprehend has in the accuracy of the detection.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Specifies one of the label or labels that categorize the personally identifiable information (PII) entity being analyzed.</p>\"\
    },\
    \"EntityRecognizerAnnotations\":{\
      \"type\":\"structure\",\
      \"required\":[\"S3Uri\"],\
      \"members\":{\
        \"S3Uri\":{\
          \"shape\":\"S3Uri\",\
          \"documentation\":\"<p> Specifies the Amazon S3 location where the annotations for an entity recognizer are located. The URI must be in the same region as the API endpoint that you are calling.</p>\"\
        },\
        \"TestS3Uri\":{\
          \"shape\":\"S3Uri\",\
          \"documentation\":\"<p> Specifies the Amazon S3 location where the test annotations for an entity recognizer are located. The URI must be in the same region as the API endpoint that you are calling.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Describes the annotations associated with a entity recognizer.</p>\"\
    },\
    \"EntityRecognizerArn\":{\
      \"type\":\"string\",\
      \"max\":256,\
      \"pattern\":\"arn:aws(-[^:]+)?:comprehend:[a-zA-Z0-9-]*:[0-9]{12}:entity-recognizer/[a-zA-Z0-9](-*[a-zA-Z0-9])*(/version/[a-zA-Z0-9](-*[a-zA-Z0-9])*)?\"\
    },\
    \"EntityRecognizerAugmentedManifestsList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"AugmentedManifestsListItem\"}\
    },\
    \"EntityRecognizerDataFormat\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"COMPREHEND_CSV\",\
        \"AUGMENTED_MANIFEST\"\
      ]\
    },\
    \"EntityRecognizerDocuments\":{\
      \"type\":\"structure\",\
      \"required\":[\"S3Uri\"],\
      \"members\":{\
        \"S3Uri\":{\
          \"shape\":\"S3Uri\",\
          \"documentation\":\"<p> Specifies the Amazon S3 location where the training documents for an entity recognizer are located. The URI must be in the same region as the API endpoint that you are calling.</p>\"\
        },\
        \"TestS3Uri\":{\
          \"shape\":\"S3Uri\",\
          \"documentation\":\"<p> Specifies the Amazon S3 location where the test documents for an entity recognizer are located. The URI must be in the same AWS Region as the API endpoint that you are calling.</p>\"\
        },\
        \"InputFormat\":{\
          \"shape\":\"InputFormat\",\
          \"documentation\":\"<p> Specifies how the text in an input file should be processed. This is optional, and the default is ONE_DOC_PER_LINE. ONE_DOC_PER_FILE - Each file is considered a separate document. Use this option when you are processing large documents, such as newspaper articles or scientific papers. ONE_DOC_PER_LINE - Each line in a file is considered a separate document. Use this option when you are processing many short documents, such as text messages.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Describes the training documents submitted with an entity recognizer.</p>\"\
    },\
    \"EntityRecognizerEndpointArn\":{\
      \"type\":\"string\",\
      \"max\":256,\
      \"pattern\":\"arn:aws(-[^:]+)?:comprehend:[a-zA-Z0-9-]*:[0-9]{12}:entity-recognizer-endpoint/[a-zA-Z0-9](-*[a-zA-Z0-9])*\"\
    },\
    \"EntityRecognizerEntityList\":{\
      \"type\":\"structure\",\
      \"required\":[\"S3Uri\"],\
      \"members\":{\
        \"S3Uri\":{\
          \"shape\":\"S3Uri\",\
          \"documentation\":\"<p>Specifies the Amazon S3 location where the entity list is located. The URI must be in the same region as the API endpoint that you are calling.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Describes the entity recognizer submitted with an entity recognizer.</p>\"\
    },\
    \"EntityRecognizerEvaluationMetrics\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Precision\":{\
          \"shape\":\"Double\",\
          \"documentation\":\"<p>A measure of the usefulness of the recognizer results in the test data. High precision means that the recognizer returned substantially more relevant results than irrelevant ones. </p>\"\
        },\
        \"Recall\":{\
          \"shape\":\"Double\",\
          \"documentation\":\"<p>A measure of how complete the recognizer results are for the test data. High recall means that the recognizer returned most of the relevant results.</p>\"\
        },\
        \"F1Score\":{\
          \"shape\":\"Double\",\
          \"documentation\":\"<p>A measure of how accurate the recognizer results are for the test data. It is derived from the <code>Precision</code> and <code>Recall</code> values. The <code>F1Score</code> is the harmonic average of the two scores. For plain text entity recognizer models, the range is 0 to 100, where 100 is the best score. For PDF/Word entity recognizer models, the range is 0 to 1, where 1 is the best score. </p>\"\
        }\
      },\
      \"documentation\":\"<p>Detailed information about the accuracy of an entity recognizer. </p>\"\
    },\
    \"EntityRecognizerFilter\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Status\":{\
          \"shape\":\"ModelStatus\",\
          \"documentation\":\"<p>The status of an entity recognizer.</p>\"\
        },\
        \"RecognizerName\":{\
          \"shape\":\"ComprehendArnName\",\
          \"documentation\":\"<p>The name that you assigned the entity recognizer.</p>\"\
        },\
        \"SubmitTimeBefore\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>Filters the list of entities based on the time that the list was submitted for processing. Returns only jobs submitted before the specified time. Jobs are returned in descending order, newest to oldest.</p>\"\
        },\
        \"SubmitTimeAfter\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>Filters the list of entities based on the time that the list was submitted for processing. Returns only jobs submitted after the specified time. Jobs are returned in ascending order, oldest to newest.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Provides information for filtering a list of entity recognizers. You can only specify one filtering parameter in a request. For more information, see the operation./&gt;</p>\"\
    },\
    \"EntityRecognizerInputDataConfig\":{\
      \"type\":\"structure\",\
      \"required\":[\"EntityTypes\"],\
      \"members\":{\
        \"DataFormat\":{\
          \"shape\":\"EntityRecognizerDataFormat\",\
          \"documentation\":\"<p>The format of your training data:</p> <ul> <li> <p> <code>COMPREHEND_CSV</code>: A CSV file that supplements your training documents. The CSV file contains information about the custom entities that your trained model will detect. The required format of the file depends on whether you are providing annotations or an entity list.</p> <p>If you use this value, you must provide your CSV file by using either the <code>Annotations</code> or <code>EntityList</code> parameters. You must provide your training documents by using the <code>Documents</code> parameter.</p> </li> <li> <p> <code>AUGMENTED_MANIFEST</code>: A labeled dataset that is produced by Amazon SageMaker Ground Truth. This file is in JSON lines format. Each line is a complete JSON object that contains a training document and its labels. Each label annotates a named entity in the training document. </p> <p>If you use this value, you must provide the <code>AugmentedManifests</code> parameter in your request.</p> </li> </ul> <p>If you don't specify a value, Amazon Comprehend uses <code>COMPREHEND_CSV</code> as the default.</p>\"\
        },\
        \"EntityTypes\":{\
          \"shape\":\"EntityTypesList\",\
          \"documentation\":\"<p>The entity types in the labeled training data that Amazon Comprehend uses to train the custom entity recognizer. Any entity types that you don't specify are ignored.</p> <p>A maximum of 25 entity types can be used at one time to train an entity recognizer. Entity types must not contain the following invalid characters: \\\\n (line break), \\\\\\\\n (escaped line break), \\\\r (carriage return), \\\\\\\\r (escaped carriage return), \\\\t (tab), \\\\\\\\t (escaped tab), space, and , (comma). </p>\"\
        },\
        \"Documents\":{\
          \"shape\":\"EntityRecognizerDocuments\",\
          \"documentation\":\"<p>The S3 location of the folder that contains the training documents for your custom entity recognizer.</p> <p>This parameter is required if you set <code>DataFormat</code> to <code>COMPREHEND_CSV</code>.</p>\"\
        },\
        \"Annotations\":{\
          \"shape\":\"EntityRecognizerAnnotations\",\
          \"documentation\":\"<p>The S3 location of the CSV file that annotates your training documents.</p>\"\
        },\
        \"EntityList\":{\
          \"shape\":\"EntityRecognizerEntityList\",\
          \"documentation\":\"<p>The S3 location of the CSV file that has the entity list for your custom entity recognizer.</p>\"\
        },\
        \"AugmentedManifests\":{\
          \"shape\":\"EntityRecognizerAugmentedManifestsList\",\
          \"documentation\":\"<p>A list of augmented manifest files that provide training data for your custom model. An augmented manifest file is a labeled dataset that is produced by Amazon SageMaker Ground Truth.</p> <p>This parameter is required if you set <code>DataFormat</code> to <code>AUGMENTED_MANIFEST</code>.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Specifies the format and location of the input data.</p>\"\
    },\
    \"EntityRecognizerMetadata\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"NumberOfTrainedDocuments\":{\
          \"shape\":\"Integer\",\
          \"documentation\":\"<p> The number of documents in the input data that were used to train the entity recognizer. Typically this is 80 to 90 percent of the input documents.</p>\"\
        },\
        \"NumberOfTestDocuments\":{\
          \"shape\":\"Integer\",\
          \"documentation\":\"<p> The number of documents in the input data that were used to test the entity recognizer. Typically this is 10 to 20 percent of the input documents.</p>\"\
        },\
        \"EvaluationMetrics\":{\
          \"shape\":\"EntityRecognizerEvaluationMetrics\",\
          \"documentation\":\"<p>Detailed information about the accuracy of an entity recognizer.</p>\"\
        },\
        \"EntityTypes\":{\
          \"shape\":\"EntityRecognizerMetadataEntityTypesList\",\
          \"documentation\":\"<p>Entity types from the metadata of an entity recognizer.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Detailed information about an entity recognizer.</p>\",\
      \"sensitive\":true\
    },\
    \"EntityRecognizerMetadataEntityTypesList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"EntityRecognizerMetadataEntityTypesListItem\"}\
    },\
    \"EntityRecognizerMetadataEntityTypesListItem\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Type\":{\
          \"shape\":\"AnyLengthString\",\
          \"documentation\":\"<p>Type of entity from the list of entity types in the metadata of an entity recognizer. </p>\"\
        },\
        \"EvaluationMetrics\":{\
          \"shape\":\"EntityTypesEvaluationMetrics\",\
          \"documentation\":\"<p>Detailed information about the accuracy of the entity recognizer for a specific item on the list of entity types. </p>\"\
        },\
        \"NumberOfTrainMentions\":{\
          \"shape\":\"Integer\",\
          \"documentation\":\"<p>Indicates the number of times the given entity type was seen in the training data. </p>\"\
        }\
      },\
      \"documentation\":\"<p>Individual item from the list of entity types in the metadata of an entity recognizer.</p>\"\
    },\
    \"EntityRecognizerProperties\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"EntityRecognizerArn\":{\
          \"shape\":\"EntityRecognizerArn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) that identifies the entity recognizer.</p>\"\
        },\
        \"LanguageCode\":{\
          \"shape\":\"LanguageCode\",\
          \"documentation\":\"<p> The language of the input documents. All documents must be in the same language. Only English (\\\"en\\\") is currently supported.</p>\"\
        },\
        \"Status\":{\
          \"shape\":\"ModelStatus\",\
          \"documentation\":\"<p>Provides the status of the entity recognizer.</p>\"\
        },\
        \"Message\":{\
          \"shape\":\"AnyLengthString\",\
          \"documentation\":\"<p> A description of the status of the recognizer.</p>\"\
        },\
        \"SubmitTime\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The time that the recognizer was submitted for processing.</p>\"\
        },\
        \"EndTime\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The time that the recognizer creation completed.</p>\"\
        },\
        \"TrainingStartTime\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The time that training of the entity recognizer started.</p>\"\
        },\
        \"TrainingEndTime\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The time that training of the entity recognizer was completed.</p>\"\
        },\
        \"InputDataConfig\":{\
          \"shape\":\"EntityRecognizerInputDataConfig\",\
          \"documentation\":\"<p>The input data properties of an entity recognizer.</p>\"\
        },\
        \"RecognizerMetadata\":{\
          \"shape\":\"EntityRecognizerMetadata\",\
          \"documentation\":\"<p> Provides information about an entity recognizer.</p>\"\
        },\
        \"DataAccessRoleArn\":{\
          \"shape\":\"IamRoleArn\",\
          \"documentation\":\"<p> The Amazon Resource Name (ARN) of the AWS Identity and Management (IAM) role that grants Amazon Comprehend read access to your input data.</p>\"\
        },\
        \"VolumeKmsKeyId\":{\
          \"shape\":\"KmsKeyId\",\
          \"documentation\":\"<p>ID for the AWS Key Management Service (KMS) key that Amazon Comprehend uses to encrypt data on the storage volume attached to the ML compute instance(s) that process the analysis job. The VolumeKmsKeyId can be either of the following formats:</p> <ul> <li> <p>KMS Key ID: <code>\\\"1234abcd-12ab-34cd-56ef-1234567890ab\\\"</code> </p> </li> <li> <p>Amazon Resource Name (ARN) of a KMS Key: <code>\\\"arn:aws:kms:us-west-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab\\\"</code> </p> </li> </ul>\"\
        },\
        \"VpcConfig\":{\
          \"shape\":\"VpcConfig\",\
          \"documentation\":\"<p> Configuration parameters for a private Virtual Private Cloud (VPC) containing the resources you are using for your custom entity recognizer. For more information, see <a href=\\\"https://docs.aws.amazon.com/vpc/latest/userguide/what-is-amazon-vpc.html\\\">Amazon VPC</a>. </p>\"\
        },\
        \"ModelKmsKeyId\":{\
          \"shape\":\"KmsKeyId\",\
          \"documentation\":\"<p>ID for the AWS Key Management Service (KMS) key that Amazon Comprehend uses to encrypt trained custom models. The ModelKmsKeyId can be either of the following formats: </p> <ul> <li> <p>KMS Key ID: <code>\\\"1234abcd-12ab-34cd-56ef-1234567890ab\\\"</code> </p> </li> <li> <p>Amazon Resource Name (ARN) of a KMS Key: <code>\\\"arn:aws:kms:us-west-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab\\\"</code> </p> </li> </ul>\"\
        },\
        \"VersionName\":{\
          \"shape\":\"VersionName\",\
          \"documentation\":\"<p>The version name you assigned to the entity recognizer.</p>\"\
        },\
        \"SourceModelArn\":{\
          \"shape\":\"EntityRecognizerArn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the source model. This model was imported from a different AWS account to create the entity recognizer model in your AWS account.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Describes information about an entity recognizer.</p>\"\
    },\
    \"EntityRecognizerPropertiesList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"EntityRecognizerProperties\"}\
    },\
    \"EntityRecognizerSummariesList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"EntityRecognizerSummary\"}\
    },\
    \"EntityRecognizerSummary\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"RecognizerName\":{\
          \"shape\":\"ComprehendArnName\",\
          \"documentation\":\"<p> The name that you assigned the entity recognizer.</p>\"\
        },\
        \"NumberOfVersions\":{\
          \"shape\":\"Integer\",\
          \"documentation\":\"<p> The number of versions you created.</p>\"\
        },\
        \"LatestVersionCreatedAt\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p> The time that the latest entity recognizer version was submitted for processing.</p>\"\
        },\
        \"LatestVersionName\":{\
          \"shape\":\"VersionName\",\
          \"documentation\":\"<p> The version name you assigned to the latest entity recognizer version.</p>\"\
        },\
        \"LatestVersionStatus\":{\
          \"shape\":\"ModelStatus\",\
          \"documentation\":\"<p> Provides the status of the latest entity recognizer version.</p>\"\
        }\
      },\
      \"documentation\":\"<p> Describes the information about an entity recognizer and its versions.</p>\"\
    },\
    \"EntityType\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"PERSON\",\
        \"LOCATION\",\
        \"ORGANIZATION\",\
        \"COMMERCIAL_ITEM\",\
        \"EVENT\",\
        \"DATE\",\
        \"QUANTITY\",\
        \"TITLE\",\
        \"OTHER\"\
      ]\
    },\
    \"EntityTypeName\":{\
      \"type\":\"string\",\
      \"max\":64,\
      \"pattern\":\"^(?![^\\\\n\\\\r\\\\t,]*\\\\\\\\n|\\\\\\\\r|\\\\\\\\t)[^\\\\n\\\\r\\\\t,]+$\"\
    },\
    \"EntityTypesEvaluationMetrics\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Precision\":{\
          \"shape\":\"Double\",\
          \"documentation\":\"<p>A measure of the usefulness of the recognizer results for a specific entity type in the test data. High precision means that the recognizer returned substantially more relevant results than irrelevant ones. </p>\"\
        },\
        \"Recall\":{\
          \"shape\":\"Double\",\
          \"documentation\":\"<p>A measure of how complete the recognizer results are for a specific entity type in the test data. High recall means that the recognizer returned most of the relevant results.</p>\"\
        },\
        \"F1Score\":{\
          \"shape\":\"Double\",\
          \"documentation\":\"<p>A measure of how accurate the recognizer results are for a specific entity type in the test data. It is derived from the <code>Precision</code> and <code>Recall</code> values. The <code>F1Score</code> is the harmonic average of the two scores. The highest score is 1, and the worst score is 0. </p>\"\
        }\
      },\
      \"documentation\":\"<p>Detailed information about the accuracy of an entity recognizer for a specific entity type. </p>\"\
    },\
    \"EntityTypesList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"EntityTypesListItem\"}\
    },\
    \"EntityTypesListItem\":{\
      \"type\":\"structure\",\
      \"required\":[\"Type\"],\
      \"members\":{\
        \"Type\":{\
          \"shape\":\"EntityTypeName\",\
          \"documentation\":\"<p>An entity type within a labeled training dataset that Amazon Comprehend uses to train a custom entity recognizer.</p> <p>Entity types must not contain the following invalid characters: \\\\n (line break), \\\\\\\\n (escaped line break, \\\\r (carriage return), \\\\\\\\r (escaped carriage return), \\\\t (tab), \\\\\\\\t (escaped tab), space, and , (comma).</p>\"\
        }\
      },\
      \"documentation\":\"<p>An entity type within a labeled training dataset that Amazon Comprehend uses to train a custom entity recognizer.</p>\"\
    },\
    \"ErrorsListItem\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Page\":{\
          \"shape\":\"Integer\",\
          \"documentation\":\"<p>Page number where the error occurred.</p>\"\
        },\
        \"ErrorCode\":{\
          \"shape\":\"PageBasedErrorCode\",\
          \"documentation\":\"<p>Error code for the cause of the error.</p>\"\
        },\
        \"ErrorMessage\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>Text message explaining the reason for the error.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Text extraction encountered one or more page-level errors in the input document.</p> <p>The <code>ErrorCode</code> contains one of the following values:</p> <ul> <li> <p>TEXTRACT_BAD_PAGE - Amazon Textract cannot read the page. For more information about page limits in Amazon Textract, see <a href=\\\"https://docs.aws.amazon.com/textract/latest/dg/limits-document.html\\\"> Page Quotas in Amazon Textract</a>.</p> </li> <li> <p>TEXTRACT_PROVISIONED_THROUGHPUT_EXCEEDED - The number of requests exceeded your throughput limit. For more information about throughput quotas in Amazon Textract, see <a href=\\\"https://docs.aws.amazon.com/textract/latest/dg/limits-quotas-explained.html\\\"> Default quotas in Amazon Textract</a>.</p> </li> <li> <p>PAGE_CHARACTERS_EXCEEDED - Too many text characters on the page (10,000 characters maximum).</p> </li> <li> <p>PAGE_SIZE_EXCEEDED - The maximum page size is 10 MB.</p> </li> <li> <p>INTERNAL_SERVER_ERROR - The request encountered a service issue. Try the API request again.</p> </li> </ul>\"\
    },\
    \"EventTypeString\":{\
      \"type\":\"string\",\
      \"max\":40,\
      \"min\":1,\
      \"pattern\":\"[A-Z_]*\"\
    },\
    \"EventsDetectionJobFilter\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"JobName\":{\
          \"shape\":\"JobName\",\
          \"documentation\":\"<p>Filters on the name of the events detection job.</p>\"\
        },\
        \"JobStatus\":{\
          \"shape\":\"JobStatus\",\
          \"documentation\":\"<p>Filters the list of jobs based on job status. Returns only jobs with the specified status.</p>\"\
        },\
        \"SubmitTimeBefore\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>Filters the list of jobs based on the time that the job was submitted for processing. Returns only jobs submitted before the specified time. Jobs are returned in ascending order, oldest to newest.</p>\"\
        },\
        \"SubmitTimeAfter\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>Filters the list of jobs based on the time that the job was submitted for processing. Returns only jobs submitted after the specified time. Jobs are returned in descending order, newest to oldest.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Provides information for filtering a list of event detection jobs.</p>\"\
    },\
    \"EventsDetectionJobProperties\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"JobId\":{\
          \"shape\":\"JobId\",\
          \"documentation\":\"<p>The identifier assigned to the events detection job.</p>\"\
        },\
        \"JobArn\":{\
          \"shape\":\"ComprehendArn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the events detection job. It is a unique, fully qualified identifier for the job. It includes the AWS account, Region, and the job ID. The format of the ARN is as follows:</p> <p> <code>arn:&lt;partition&gt;:comprehend:&lt;region&gt;:&lt;account-id&gt;:events-detection-job/&lt;job-id&gt;</code> </p> <p>The following is an example job ARN:</p> <p> <code>arn:aws:comprehend:us-west-2:111122223333:events-detection-job/1234abcd12ab34cd56ef1234567890ab</code> </p>\"\
        },\
        \"JobName\":{\
          \"shape\":\"JobName\",\
          \"documentation\":\"<p>The name you assigned the events detection job.</p>\"\
        },\
        \"JobStatus\":{\
          \"shape\":\"JobStatus\",\
          \"documentation\":\"<p>The current status of the events detection job.</p>\"\
        },\
        \"Message\":{\
          \"shape\":\"AnyLengthString\",\
          \"documentation\":\"<p>A description of the status of the events detection job.</p>\"\
        },\
        \"SubmitTime\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The time that the events detection job was submitted for processing.</p>\"\
        },\
        \"EndTime\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The time that the events detection job completed.</p>\"\
        },\
        \"InputDataConfig\":{\
          \"shape\":\"InputDataConfig\",\
          \"documentation\":\"<p>The input data configuration that you supplied when you created the events detection job.</p>\"\
        },\
        \"OutputDataConfig\":{\
          \"shape\":\"OutputDataConfig\",\
          \"documentation\":\"<p>The output data configuration that you supplied when you created the events detection job.</p>\"\
        },\
        \"LanguageCode\":{\
          \"shape\":\"LanguageCode\",\
          \"documentation\":\"<p>The language code of the input documents.</p>\"\
        },\
        \"DataAccessRoleArn\":{\
          \"shape\":\"IamRoleArn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the AWS Identify and Access Management (IAM) role that grants Amazon Comprehend read access to your input data.</p>\"\
        },\
        \"TargetEventTypes\":{\
          \"shape\":\"TargetEventTypes\",\
          \"documentation\":\"<p>The types of events that are detected by the job.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Provides information about an events detection job.</p>\"\
    },\
    \"EventsDetectionJobPropertiesList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"EventsDetectionJobProperties\"}\
    },\
    \"ExtractedCharactersListItem\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Page\":{\
          \"shape\":\"Integer\",\
          \"documentation\":\"<p>Page number.</p>\"\
        },\
        \"Count\":{\
          \"shape\":\"Integer\",\
          \"documentation\":\"<p>Number of characters extracted from each page.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Array of the number of characters extracted from each page.</p>\"\
    },\
    \"Float\":{\"type\":\"float\"},\
    \"Geometry\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"BoundingBox\":{\
          \"shape\":\"BoundingBox\",\
          \"documentation\":\"<p>An axis-aligned coarse representation of the location of the recognized item on the document page.</p>\"\
        },\
        \"Polygon\":{\
          \"shape\":\"Polygon\",\
          \"documentation\":\"<p>Within the bounding box, a fine-grained polygon around the recognized item.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Information about the location of items on a document page.</p> <p>For additional information, see <a href=\\\"https://docs.aws.amazon.com/textract/latest/dg/API_Geometry.html\\\">Geometry</a> in the Amazon Textract API reference.</p>\"\
    },\
    \"IamRoleArn\":{\
      \"type\":\"string\",\
      \"max\":2048,\
      \"min\":20,\
      \"pattern\":\"arn:aws(-[^:]+)?:iam::[0-9]{12}:role/.+\"\
    },\
    \"ImportModelRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"SourceModelArn\"],\
      \"members\":{\
        \"SourceModelArn\":{\
          \"shape\":\"ComprehendModelArn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the custom model to import.</p>\"\
        },\
        \"ModelName\":{\
          \"shape\":\"ComprehendArnName\",\
          \"documentation\":\"<p>The name to assign to the custom model that is created in Amazon Comprehend by this import.</p>\"\
        },\
        \"VersionName\":{\
          \"shape\":\"VersionName\",\
          \"documentation\":\"<p>The version name given to the custom model that is created by this import. Version names can have a maximum of 256 characters. Alphanumeric characters, hyphens (-) and underscores (_) are allowed. The version name must be unique among all models with the same classifier name in the account/AWS Region.</p>\"\
        },\
        \"ModelKmsKeyId\":{\
          \"shape\":\"KmsKeyId\",\
          \"documentation\":\"<p>ID for the AWS Key Management Service (KMS) key that Amazon Comprehend uses to encrypt trained custom models. The ModelKmsKeyId can be either of the following formats:</p> <ul> <li> <p>KMS Key ID: <code>\\\"1234abcd-12ab-34cd-56ef-1234567890ab\\\"</code> </p> </li> <li> <p>Amazon Resource Name (ARN) of a KMS Key: <code>\\\"arn:aws:kms:us-west-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab\\\"</code> </p> </li> </ul>\"\
        },\
        \"DataAccessRoleArn\":{\
          \"shape\":\"IamRoleArn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the AWS Identity and Management (IAM) role that allows Amazon Comprehend to use Amazon Key Management Service (KMS) to encrypt or decrypt the custom model.</p>\"\
        },\
        \"Tags\":{\
          \"shape\":\"TagList\",\
          \"documentation\":\"<p>Tags to be associated with the custom model that is created by this import. A tag is a key-value pair that adds as a metadata to a resource used by Amazon Comprehend. For example, a tag with \\\"Sales\\\" as the key might be added to a resource to indicate its use by the sales department.</p>\"\
        }\
      }\
    },\
    \"ImportModelResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"ModelArn\":{\
          \"shape\":\"ComprehendModelArn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the custom model being imported.</p>\"\
        }\
      }\
    },\
    \"InferenceUnitsInteger\":{\
      \"type\":\"integer\",\
      \"min\":1\
    },\
    \"InputDataConfig\":{\
      \"type\":\"structure\",\
      \"required\":[\"S3Uri\"],\
      \"members\":{\
        \"S3Uri\":{\
          \"shape\":\"S3Uri\",\
          \"documentation\":\"<p>The Amazon S3 URI for the input data. The URI must be in same region as the API endpoint that you are calling. The URI can point to a single input file or it can provide the prefix for a collection of data files. </p> <p>For example, if you use the URI <code>S3://bucketName/prefix</code>, if the prefix is a single file, Amazon Comprehend uses that file as input. If more than one file begins with the prefix, Amazon Comprehend uses all of them as input.</p>\"\
        },\
        \"InputFormat\":{\
          \"shape\":\"InputFormat\",\
          \"documentation\":\"<p>Specifies how the text in an input file should be processed:</p> <ul> <li> <p> <code>ONE_DOC_PER_FILE</code> - Each file is considered a separate document. Use this option when you are processing large documents, such as newspaper articles or scientific papers.</p> </li> <li> <p> <code>ONE_DOC_PER_LINE</code> - Each line in a file is considered a separate document. Use this option when you are processing many short documents, such as text messages.</p> </li> </ul>\"\
        },\
        \"DocumentReaderConfig\":{\
          \"shape\":\"DocumentReaderConfig\",\
          \"documentation\":\"<p>Provides configuration parameters to override the default actions for extracting text from PDF documents and image files.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The input properties for an inference job. The document reader config field applies only to non-text inputs for custom analysis.</p>\"\
    },\
    \"InputFormat\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"ONE_DOC_PER_FILE\",\
        \"ONE_DOC_PER_LINE\"\
      ]\
    },\
    \"Integer\":{\"type\":\"integer\"},\
    \"InternalServerException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Message\":{\"shape\":\"String\"}\
      },\
      \"documentation\":\"<p>An internal server error occurred. Retry your request.</p>\",\
      \"exception\":true,\
      \"fault\":true\
    },\
    \"InvalidFilterException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Message\":{\"shape\":\"String\"}\
      },\
      \"documentation\":\"<p>The filter specified for the operation is invalid. Specify a different filter.</p>\",\
      \"exception\":true\
    },\
    \"InvalidRequestDetail\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Reason\":{\
          \"shape\":\"InvalidRequestDetailReason\",\
          \"documentation\":\"<p>Reason code is <code>INVALID_DOCUMENT</code>.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Provides additional detail about why the request failed:</p> <ul> <li> <p>Document size is too large - Check the size of your file and resubmit the request.</p> </li> <li> <p>Document type is not supported - Check the file type and resubmit the request.</p> </li> <li> <p>Too many pages in the document - Check the number of pages in your file and resubmit the request.</p> </li> <li> <p>Access denied to Amazon Textract - Verify that your account has permission to use Amazon Textract API operations and resubmit the request.</p> </li> </ul>\"\
    },\
    \"InvalidRequestDetailReason\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"DOCUMENT_SIZE_EXCEEDED\",\
        \"UNSUPPORTED_DOC_TYPE\",\
        \"PAGE_LIMIT_EXCEEDED\",\
        \"TEXTRACT_ACCESS_DENIED\"\
      ]\
    },\
    \"InvalidRequestException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Message\":{\"shape\":\"String\"},\
        \"Reason\":{\"shape\":\"InvalidRequestReason\"},\
        \"Detail\":{\"shape\":\"InvalidRequestDetail\"}\
      },\
      \"documentation\":\"<p>The request is invalid.</p>\",\
      \"exception\":true\
    },\
    \"InvalidRequestReason\":{\
      \"type\":\"string\",\
      \"enum\":[\"INVALID_DOCUMENT\"]\
    },\
    \"JobId\":{\
      \"type\":\"string\",\
      \"max\":32,\
      \"min\":1,\
      \"pattern\":\"^([\\\\p{L}\\\\p{Z}\\\\p{N}_.:/=+\\\\-%@]*)$\"\
    },\
    \"JobName\":{\
      \"type\":\"string\",\
      \"max\":256,\
      \"min\":1,\
      \"pattern\":\"^([\\\\p{L}\\\\p{Z}\\\\p{N}_.:/=+\\\\-%@]*)$\"\
    },\
    \"JobNotFoundException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Message\":{\"shape\":\"String\"}\
      },\
      \"documentation\":\"<p>The specified job was not found. Check the job ID and try again.</p>\",\
      \"exception\":true\
    },\
    \"JobStatus\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"SUBMITTED\",\
        \"IN_PROGRESS\",\
        \"COMPLETED\",\
        \"FAILED\",\
        \"STOP_REQUESTED\",\
        \"STOPPED\"\
      ]\
    },\
    \"KeyPhrase\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Score\":{\
          \"shape\":\"Float\",\
          \"documentation\":\"<p>The level of confidence that Amazon Comprehend has in the accuracy of the detection.</p>\"\
        },\
        \"Text\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The text of a key noun phrase.</p>\"\
        },\
        \"BeginOffset\":{\
          \"shape\":\"Integer\",\
          \"documentation\":\"<p>The zero-based offset from the beginning of the source text to the first character in the key phrase.</p>\"\
        },\
        \"EndOffset\":{\
          \"shape\":\"Integer\",\
          \"documentation\":\"<p>The zero-based offset from the beginning of the source text to the last character in the key phrase.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Describes a key noun phrase.</p>\"\
    },\
    \"KeyPhrasesDetectionJobFilter\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"JobName\":{\
          \"shape\":\"JobName\",\
          \"documentation\":\"<p>Filters on the name of the job.</p>\"\
        },\
        \"JobStatus\":{\
          \"shape\":\"JobStatus\",\
          \"documentation\":\"<p>Filters the list of jobs based on job status. Returns only jobs with the specified status.</p>\"\
        },\
        \"SubmitTimeBefore\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>Filters the list of jobs based on the time that the job was submitted for processing. Returns only jobs submitted before the specified time. Jobs are returned in ascending order, oldest to newest.</p>\"\
        },\
        \"SubmitTimeAfter\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>Filters the list of jobs based on the time that the job was submitted for processing. Returns only jobs submitted after the specified time. Jobs are returned in descending order, newest to oldest.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Provides information for filtering a list of dominant language detection jobs. For more information, see the operation.</p>\"\
    },\
    \"KeyPhrasesDetectionJobProperties\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"JobId\":{\
          \"shape\":\"JobId\",\
          \"documentation\":\"<p>The identifier assigned to the key phrases detection job.</p>\"\
        },\
        \"JobArn\":{\
          \"shape\":\"ComprehendArn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the key phrases detection job. It is a unique, fully qualified identifier for the job. It includes the AWS account, Region, and the job ID. The format of the ARN is as follows:</p> <p> <code>arn:&lt;partition&gt;:comprehend:&lt;region&gt;:&lt;account-id&gt;:key-phrases-detection-job/&lt;job-id&gt;</code> </p> <p>The following is an example job ARN:</p> <p> <code>arn:aws:comprehend:us-west-2:111122223333:key-phrases-detection-job/1234abcd12ab34cd56ef1234567890ab</code> </p>\"\
        },\
        \"JobName\":{\
          \"shape\":\"JobName\",\
          \"documentation\":\"<p>The name that you assigned the key phrases detection job.</p>\"\
        },\
        \"JobStatus\":{\
          \"shape\":\"JobStatus\",\
          \"documentation\":\"<p>The current status of the key phrases detection job. If the status is <code>FAILED</code>, the <code>Message</code> field shows the reason for the failure.</p>\"\
        },\
        \"Message\":{\
          \"shape\":\"AnyLengthString\",\
          \"documentation\":\"<p>A description of the status of a job.</p>\"\
        },\
        \"SubmitTime\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The time that the key phrases detection job was submitted for processing.</p>\"\
        },\
        \"EndTime\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The time that the key phrases detection job completed.</p>\"\
        },\
        \"InputDataConfig\":{\
          \"shape\":\"InputDataConfig\",\
          \"documentation\":\"<p>The input data configuration that you supplied when you created the key phrases detection job.</p>\"\
        },\
        \"OutputDataConfig\":{\
          \"shape\":\"OutputDataConfig\",\
          \"documentation\":\"<p>The output data configuration that you supplied when you created the key phrases detection job.</p>\"\
        },\
        \"LanguageCode\":{\
          \"shape\":\"LanguageCode\",\
          \"documentation\":\"<p>The language code of the input documents.</p>\"\
        },\
        \"DataAccessRoleArn\":{\
          \"shape\":\"IamRoleArn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) that gives Amazon Comprehend read access to your input data.</p>\"\
        },\
        \"VolumeKmsKeyId\":{\
          \"shape\":\"KmsKeyId\",\
          \"documentation\":\"<p>ID for the AWS Key Management Service (KMS) key that Amazon Comprehend uses to encrypt data on the storage volume attached to the ML compute instance(s) that process the analysis job. The VolumeKmsKeyId can be either of the following formats:</p> <ul> <li> <p>KMS Key ID: <code>\\\"1234abcd-12ab-34cd-56ef-1234567890ab\\\"</code> </p> </li> <li> <p>Amazon Resource Name (ARN) of a KMS Key: <code>\\\"arn:aws:kms:us-west-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab\\\"</code> </p> </li> </ul>\"\
        },\
        \"VpcConfig\":{\
          \"shape\":\"VpcConfig\",\
          \"documentation\":\"<p> Configuration parameters for a private Virtual Private Cloud (VPC) containing the resources you are using for your key phrases detection job. For more information, see <a href=\\\"https://docs.aws.amazon.com/vpc/latest/userguide/what-is-amazon-vpc.html\\\">Amazon VPC</a>. </p>\"\
        }\
      },\
      \"documentation\":\"<p>Provides information about a key phrases detection job.</p>\"\
    },\
    \"KeyPhrasesDetectionJobPropertiesList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"KeyPhrasesDetectionJobProperties\"}\
    },\
    \"KmsKeyId\":{\
      \"type\":\"string\",\
      \"max\":2048,\
      \"pattern\":\"^\\\\p{ASCII}+$\"\
    },\
    \"KmsKeyValidationException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Message\":{\"shape\":\"String\"}\
      },\
      \"documentation\":\"<p>The KMS customer managed key (CMK) entered cannot be validated. Verify the key and re-enter it.</p>\",\
      \"exception\":true\
    },\
    \"LabelDelimiter\":{\
      \"type\":\"string\",\
      \"max\":1,\
      \"min\":1,\
      \"pattern\":\"^[ ~!@#$%^*\\\\-_+=|\\\\\\\\:;\\\\t>?/]$\"\
    },\
    \"LanguageCode\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"en\",\
        \"es\",\
        \"fr\",\
        \"de\",\
        \"it\",\
        \"pt\",\
        \"ar\",\
        \"hi\",\
        \"ja\",\
        \"ko\",\
        \"zh\",\
        \"zh-TW\"\
      ]\
    },\
    \"ListDocumentClassificationJobsRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Filter\":{\
          \"shape\":\"DocumentClassificationJobFilter\",\
          \"documentation\":\"<p>Filters the jobs that are returned. You can filter jobs on their names, status, or the date and time that they were submitted. You can only set one filter at a time.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>Identifies the next page of results to return.</p>\"\
        },\
        \"MaxResults\":{\
          \"shape\":\"MaxResultsInteger\",\
          \"documentation\":\"<p>The maximum number of results to return in each page. The default is 100.</p>\"\
        }\
      }\
    },\
    \"ListDocumentClassificationJobsResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"DocumentClassificationJobPropertiesList\":{\
          \"shape\":\"DocumentClassificationJobPropertiesList\",\
          \"documentation\":\"<p>A list containing the properties of each job returned.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>Identifies the next page of results to return.</p>\"\
        }\
      }\
    },\
    \"ListDocumentClassifierSummariesRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"NextToken\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>Identifies the next page of results to return.</p>\"\
        },\
        \"MaxResults\":{\
          \"shape\":\"MaxResultsInteger\",\
          \"documentation\":\"<p>The maximum number of results to return on each page. The default is 100.</p>\"\
        }\
      }\
    },\
    \"ListDocumentClassifierSummariesResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"DocumentClassifierSummariesList\":{\
          \"shape\":\"DocumentClassifierSummariesList\",\
          \"documentation\":\"<p>The list of summaries of document classifiers.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>Identifies the next page of results to return.</p>\"\
        }\
      }\
    },\
    \"ListDocumentClassifiersRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Filter\":{\
          \"shape\":\"DocumentClassifierFilter\",\
          \"documentation\":\"<p>Filters the jobs that are returned. You can filter jobs on their name, status, or the date and time that they were submitted. You can only set one filter at a time.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>Identifies the next page of results to return.</p>\"\
        },\
        \"MaxResults\":{\
          \"shape\":\"MaxResultsInteger\",\
          \"documentation\":\"<p>The maximum number of results to return in each page. The default is 100.</p>\"\
        }\
      }\
    },\
    \"ListDocumentClassifiersResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"DocumentClassifierPropertiesList\":{\
          \"shape\":\"DocumentClassifierPropertiesList\",\
          \"documentation\":\"<p>A list containing the properties of each job returned.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>Identifies the next page of results to return.</p>\"\
        }\
      }\
    },\
    \"ListDominantLanguageDetectionJobsRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Filter\":{\
          \"shape\":\"DominantLanguageDetectionJobFilter\",\
          \"documentation\":\"<p>Filters that jobs that are returned. You can filter jobs on their name, status, or the date and time that they were submitted. You can only set one filter at a time.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>Identifies the next page of results to return.</p>\"\
        },\
        \"MaxResults\":{\
          \"shape\":\"MaxResultsInteger\",\
          \"documentation\":\"<p>The maximum number of results to return in each page. The default is 100.</p>\"\
        }\
      }\
    },\
    \"ListDominantLanguageDetectionJobsResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"DominantLanguageDetectionJobPropertiesList\":{\
          \"shape\":\"DominantLanguageDetectionJobPropertiesList\",\
          \"documentation\":\"<p>A list containing the properties of each job that is returned.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>Identifies the next page of results to return.</p>\"\
        }\
      }\
    },\
    \"ListEndpointsRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Filter\":{\
          \"shape\":\"EndpointFilter\",\
          \"documentation\":\"<p>Filters the endpoints that are returned. You can filter endpoints on their name, model, status, or the date and time that they were created. You can only set one filter at a time. </p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>Identifies the next page of results to return.</p>\"\
        },\
        \"MaxResults\":{\
          \"shape\":\"MaxResultsInteger\",\
          \"documentation\":\"<p>The maximum number of results to return in each page. The default is 100.</p>\"\
        }\
      }\
    },\
    \"ListEndpointsResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"EndpointPropertiesList\":{\
          \"shape\":\"EndpointPropertiesList\",\
          \"documentation\":\"<p>Displays a list of endpoint properties being retrieved by the service in response to the request.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>Identifies the next page of results to return.</p>\"\
        }\
      }\
    },\
    \"ListEntitiesDetectionJobsRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Filter\":{\
          \"shape\":\"EntitiesDetectionJobFilter\",\
          \"documentation\":\"<p>Filters the jobs that are returned. You can filter jobs on their name, status, or the date and time that they were submitted. You can only set one filter at a time.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>Identifies the next page of results to return.</p>\"\
        },\
        \"MaxResults\":{\
          \"shape\":\"MaxResultsInteger\",\
          \"documentation\":\"<p>The maximum number of results to return in each page. The default is 100.</p>\"\
        }\
      }\
    },\
    \"ListEntitiesDetectionJobsResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"EntitiesDetectionJobPropertiesList\":{\
          \"shape\":\"EntitiesDetectionJobPropertiesList\",\
          \"documentation\":\"<p>A list containing the properties of each job that is returned.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>Identifies the next page of results to return.</p>\"\
        }\
      }\
    },\
    \"ListEntityRecognizerSummariesRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"NextToken\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>Identifies the next page of results to return.</p>\"\
        },\
        \"MaxResults\":{\
          \"shape\":\"MaxResultsInteger\",\
          \"documentation\":\"<p>The maximum number of results to return on each page. The default is 100.</p>\"\
        }\
      }\
    },\
    \"ListEntityRecognizerSummariesResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"EntityRecognizerSummariesList\":{\
          \"shape\":\"EntityRecognizerSummariesList\",\
          \"documentation\":\"<p>The list entity recognizer summaries.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The list entity recognizer summaries.</p>\"\
        }\
      }\
    },\
    \"ListEntityRecognizersRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Filter\":{\
          \"shape\":\"EntityRecognizerFilter\",\
          \"documentation\":\"<p>Filters the list of entities returned. You can filter on <code>Status</code>, <code>SubmitTimeBefore</code>, or <code>SubmitTimeAfter</code>. You can only set one filter at a time.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>Identifies the next page of results to return.</p>\"\
        },\
        \"MaxResults\":{\
          \"shape\":\"MaxResultsInteger\",\
          \"documentation\":\"<p> The maximum number of results to return on each page. The default is 100.</p>\"\
        }\
      }\
    },\
    \"ListEntityRecognizersResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"EntityRecognizerPropertiesList\":{\
          \"shape\":\"EntityRecognizerPropertiesList\",\
          \"documentation\":\"<p>The list of properties of an entity recognizer.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>Identifies the next page of results to return.</p>\"\
        }\
      }\
    },\
    \"ListEventsDetectionJobsRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Filter\":{\
          \"shape\":\"EventsDetectionJobFilter\",\
          \"documentation\":\"<p>Filters the jobs that are returned. You can filter jobs on their name, status, or the date and time that they were submitted. You can only set one filter at a time.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>Identifies the next page of results to return.</p>\"\
        },\
        \"MaxResults\":{\
          \"shape\":\"MaxResultsInteger\",\
          \"documentation\":\"<p>The maximum number of results to return in each page.</p>\"\
        }\
      }\
    },\
    \"ListEventsDetectionJobsResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"EventsDetectionJobPropertiesList\":{\
          \"shape\":\"EventsDetectionJobPropertiesList\",\
          \"documentation\":\"<p>A list containing the properties of each job that is returned.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>Identifies the next page of results to return.</p>\"\
        }\
      }\
    },\
    \"ListKeyPhrasesDetectionJobsRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Filter\":{\
          \"shape\":\"KeyPhrasesDetectionJobFilter\",\
          \"documentation\":\"<p>Filters the jobs that are returned. You can filter jobs on their name, status, or the date and time that they were submitted. You can only set one filter at a time.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>Identifies the next page of results to return.</p>\"\
        },\
        \"MaxResults\":{\
          \"shape\":\"MaxResultsInteger\",\
          \"documentation\":\"<p>The maximum number of results to return in each page. The default is 100.</p>\"\
        }\
      }\
    },\
    \"ListKeyPhrasesDetectionJobsResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"KeyPhrasesDetectionJobPropertiesList\":{\
          \"shape\":\"KeyPhrasesDetectionJobPropertiesList\",\
          \"documentation\":\"<p>A list containing the properties of each job that is returned.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>Identifies the next page of results to return.</p>\"\
        }\
      }\
    },\
    \"ListOfBlockReferences\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"BlockReference\"}\
    },\
    \"ListOfBlocks\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"Block\"}\
    },\
    \"ListOfChildBlocks\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"ChildBlock\"}\
    },\
    \"ListOfClasses\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"DocumentClass\"}\
    },\
    \"ListOfDescriptiveMentionIndices\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"Integer\"}\
    },\
    \"ListOfDetectDominantLanguageResult\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"BatchDetectDominantLanguageItemResult\"}\
    },\
    \"ListOfDetectEntitiesResult\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"BatchDetectEntitiesItemResult\"}\
    },\
    \"ListOfDetectKeyPhrasesResult\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"BatchDetectKeyPhrasesItemResult\"}\
    },\
    \"ListOfDetectSentimentResult\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"BatchDetectSentimentItemResult\"}\
    },\
    \"ListOfDetectSyntaxResult\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"BatchDetectSyntaxItemResult\"}\
    },\
    \"ListOfDetectTargetedSentimentResult\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"BatchDetectTargetedSentimentItemResult\"}\
    },\
    \"ListOfDocumentReadFeatureTypes\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"DocumentReadFeatureTypes\"},\
      \"max\":2,\
      \"min\":1\
    },\
    \"ListOfDocumentType\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"DocumentTypeListItem\"}\
    },\
    \"ListOfDominantLanguages\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"DominantLanguage\"}\
    },\
    \"ListOfEntities\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"Entity\"}\
    },\
    \"ListOfEntityLabels\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"EntityLabel\"}\
    },\
    \"ListOfErrors\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"ErrorsListItem\"}\
    },\
    \"ListOfExtractedCharacters\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"ExtractedCharactersListItem\"}\
    },\
    \"ListOfKeyPhrases\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"KeyPhrase\"}\
    },\
    \"ListOfLabels\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"DocumentLabel\"}\
    },\
    \"ListOfMentions\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"TargetedSentimentMention\"}\
    },\
    \"ListOfPiiEntities\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"PiiEntity\"}\
    },\
    \"ListOfPiiEntityTypes\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"PiiEntityType\"}\
    },\
    \"ListOfRelationships\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"RelationshipsListItem\"}\
    },\
    \"ListOfSyntaxTokens\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"SyntaxToken\"}\
    },\
    \"ListOfTargetedSentimentEntities\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"TargetedSentimentEntity\"}\
    },\
    \"ListPiiEntitiesDetectionJobsRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Filter\":{\
          \"shape\":\"PiiEntitiesDetectionJobFilter\",\
          \"documentation\":\"<p>Filters the jobs that are returned. You can filter jobs on their name, status, or the date and time that they were submitted. You can only set one filter at a time.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>Identifies the next page of results to return.</p>\"\
        },\
        \"MaxResults\":{\
          \"shape\":\"MaxResultsInteger\",\
          \"documentation\":\"<p>The maximum number of results to return in each page.</p>\"\
        }\
      }\
    },\
    \"ListPiiEntitiesDetectionJobsResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"PiiEntitiesDetectionJobPropertiesList\":{\
          \"shape\":\"PiiEntitiesDetectionJobPropertiesList\",\
          \"documentation\":\"<p>A list containing the properties of each job that is returned.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>Identifies the next page of results to return.</p>\"\
        }\
      }\
    },\
    \"ListSentimentDetectionJobsRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Filter\":{\
          \"shape\":\"SentimentDetectionJobFilter\",\
          \"documentation\":\"<p>Filters the jobs that are returned. You can filter jobs on their name, status, or the date and time that they were submitted. You can only set one filter at a time.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>Identifies the next page of results to return.</p>\"\
        },\
        \"MaxResults\":{\
          \"shape\":\"MaxResultsInteger\",\
          \"documentation\":\"<p>The maximum number of results to return in each page. The default is 100.</p>\"\
        }\
      }\
    },\
    \"ListSentimentDetectionJobsResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"SentimentDetectionJobPropertiesList\":{\
          \"shape\":\"SentimentDetectionJobPropertiesList\",\
          \"documentation\":\"<p>A list containing the properties of each job that is returned.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>Identifies the next page of results to return.</p>\"\
        }\
      }\
    },\
    \"ListTagsForResourceRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"ResourceArn\"],\
      \"members\":{\
        \"ResourceArn\":{\
          \"shape\":\"ComprehendArn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the given Amazon Comprehend resource you are querying. </p>\"\
        }\
      }\
    },\
    \"ListTagsForResourceResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"ResourceArn\":{\
          \"shape\":\"ComprehendArn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the given Amazon Comprehend resource you are querying.</p>\"\
        },\
        \"Tags\":{\
          \"shape\":\"TagList\",\
          \"documentation\":\"<p>Tags associated with the Amazon Comprehend resource being queried. A tag is a key-value pair that adds as a metadata to a resource used by Amazon Comprehend. For example, a tag with \\\"Sales\\\" as the key might be added to a resource to indicate its use by the sales department. </p>\"\
        }\
      }\
    },\
    \"ListTargetedSentimentDetectionJobsRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Filter\":{\
          \"shape\":\"TargetedSentimentDetectionJobFilter\",\
          \"documentation\":\"<p>Filters the jobs that are returned. You can filter jobs on their name, status, or the date and time that they were submitted. You can only set one filter at a time.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>Identifies the next page of results to return.</p>\"\
        },\
        \"MaxResults\":{\
          \"shape\":\"MaxResultsInteger\",\
          \"documentation\":\"<p>The maximum number of results to return in each page. The default is 100.</p>\"\
        }\
      }\
    },\
    \"ListTargetedSentimentDetectionJobsResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"TargetedSentimentDetectionJobPropertiesList\":{\
          \"shape\":\"TargetedSentimentDetectionJobPropertiesList\",\
          \"documentation\":\"<p>A list containing the properties of each job that is returned.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>Identifies the next page of results to return.</p>\"\
        }\
      }\
    },\
    \"ListTopicsDetectionJobsRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Filter\":{\
          \"shape\":\"TopicsDetectionJobFilter\",\
          \"documentation\":\"<p>Filters the jobs that are returned. Jobs can be filtered on their name, status, or the date and time that they were submitted. You can set only one filter at a time.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>Identifies the next page of results to return.</p>\"\
        },\
        \"MaxResults\":{\
          \"shape\":\"MaxResultsInteger\",\
          \"documentation\":\"<p>The maximum number of results to return in each page. The default is 100.</p>\"\
        }\
      }\
    },\
    \"ListTopicsDetectionJobsResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"TopicsDetectionJobPropertiesList\":{\
          \"shape\":\"TopicsDetectionJobPropertiesList\",\
          \"documentation\":\"<p>A list containing the properties of each job that is returned.</p>\"\
        },\
        \"NextToken\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>Identifies the next page of results to return.</p>\"\
        }\
      }\
    },\
    \"MaskCharacter\":{\
      \"type\":\"string\",\
      \"max\":1,\
      \"min\":1,\
      \"pattern\":\"[!@#$%&*]\"\
    },\
    \"MaxResultsInteger\":{\
      \"type\":\"integer\",\
      \"max\":500,\
      \"min\":1\
    },\
    \"MentionSentiment\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Sentiment\":{\
          \"shape\":\"SentimentType\",\
          \"documentation\":\"<p>The sentiment of the mention. </p>\"\
        },\
        \"SentimentScore\":{\"shape\":\"SentimentScore\"}\
      },\
      \"documentation\":\"<p>Contains the sentiment and sentiment score for one mention of an entity.</p> <p>For more information about targeted sentiment, see <a href=\\\"https://docs.aws.amazon.com/comprehend/latest/dg/how-targeted-sentiment.html\\\">Targeted sentiment</a>.</p>\"\
    },\
    \"ModelStatus\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"SUBMITTED\",\
        \"TRAINING\",\
        \"DELETING\",\
        \"STOP_REQUESTED\",\
        \"STOPPED\",\
        \"IN_ERROR\",\
        \"TRAINED\"\
      ]\
    },\
    \"NumberOfTopicsInteger\":{\
      \"type\":\"integer\",\
      \"max\":100,\
      \"min\":1\
    },\
    \"OutputDataConfig\":{\
      \"type\":\"structure\",\
      \"required\":[\"S3Uri\"],\
      \"members\":{\
        \"S3Uri\":{\
          \"shape\":\"S3Uri\",\
          \"documentation\":\"<p>When you use the <code>OutputDataConfig</code> object with asynchronous operations, you specify the Amazon S3 location where you want to write the output data. The URI must be in the same region as the API endpoint that you are calling. The location is used as the prefix for the actual location of the output file.</p> <p>When the topic detection job is finished, the service creates an output file in a directory specific to the job. The <code>S3Uri</code> field contains the location of the output file, called <code>output.tar.gz</code>. It is a compressed archive that contains the ouput of the operation.</p> <p> For a PII entity detection job, the output file is plain text, not a compressed archive. The output file name is the same as the input file, with <code>.out</code> appended at the end. </p>\"\
        },\
        \"KmsKeyId\":{\
          \"shape\":\"KmsKeyId\",\
          \"documentation\":\"<p>ID for the AWS Key Management Service (KMS) key that Amazon Comprehend uses to encrypt the output results from an analysis job. The KmsKeyId can be one of the following formats:</p> <ul> <li> <p>KMS Key ID: <code>\\\"1234abcd-12ab-34cd-56ef-1234567890ab\\\"</code> </p> </li> <li> <p>Amazon Resource Name (ARN) of a KMS Key: <code>\\\"arn:aws:kms:us-west-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab\\\"</code> </p> </li> <li> <p>KMS Key Alias: <code>\\\"alias/ExampleAlias\\\"</code> </p> </li> <li> <p>ARN of a KMS Key Alias: <code>\\\"arn:aws:kms:us-west-2:111122223333:alias/ExampleAlias\\\"</code> </p> </li> </ul>\"\
        }\
      },\
      \"documentation\":\"<p>Provides configuration parameters for the output of inference jobs.</p> <p/>\"\
    },\
    \"PageBasedErrorCode\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"TEXTRACT_BAD_PAGE\",\
        \"TEXTRACT_PROVISIONED_THROUGHPUT_EXCEEDED\",\
        \"PAGE_CHARACTERS_EXCEEDED\",\
        \"PAGE_SIZE_EXCEEDED\",\
        \"INTERNAL_SERVER_ERROR\"\
      ]\
    },\
    \"PartOfSpeechTag\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Tag\":{\
          \"shape\":\"PartOfSpeechTagType\",\
          \"documentation\":\"<p>Identifies the part of speech that the token represents.</p>\"\
        },\
        \"Score\":{\
          \"shape\":\"Float\",\
          \"documentation\":\"<p>The confidence that Amazon Comprehend has that the part of speech was correctly identified.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Identifies the part of speech represented by the token and gives the confidence that Amazon Comprehend has that the part of speech was correctly identified. For more information about the parts of speech that Amazon Comprehend can identify, see <a href=\\\"https://docs.aws.amazon.com/comprehend/latest/dg/how-syntax.html\\\">Syntax</a> in the Comprehend Developer Guide. </p>\"\
    },\
    \"PartOfSpeechTagType\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"ADJ\",\
        \"ADP\",\
        \"ADV\",\
        \"AUX\",\
        \"CONJ\",\
        \"CCONJ\",\
        \"DET\",\
        \"INTJ\",\
        \"NOUN\",\
        \"NUM\",\
        \"O\",\
        \"PART\",\
        \"PRON\",\
        \"PROPN\",\
        \"PUNCT\",\
        \"SCONJ\",\
        \"SYM\",\
        \"VERB\"\
      ]\
    },\
    \"PiiEntitiesDetectionJobFilter\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"JobName\":{\
          \"shape\":\"JobName\",\
          \"documentation\":\"<p>Filters on the name of the job.</p>\"\
        },\
        \"JobStatus\":{\
          \"shape\":\"JobStatus\",\
          \"documentation\":\"<p>Filters the list of jobs based on job status. Returns only jobs with the specified status.</p>\"\
        },\
        \"SubmitTimeBefore\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>Filters the list of jobs based on the time that the job was submitted for processing. Returns only jobs submitted before the specified time. Jobs are returned in ascending order, oldest to newest.</p>\"\
        },\
        \"SubmitTimeAfter\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>Filters the list of jobs based on the time that the job was submitted for processing. Returns only jobs submitted after the specified time. Jobs are returned in descending order, newest to oldest.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Provides information for filtering a list of PII entity detection jobs.</p>\"\
    },\
    \"PiiEntitiesDetectionJobProperties\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"JobId\":{\
          \"shape\":\"JobId\",\
          \"documentation\":\"<p>The identifier assigned to the PII entities detection job.</p>\"\
        },\
        \"JobArn\":{\
          \"shape\":\"ComprehendArn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the PII entities detection job. It is a unique, fully qualified identifier for the job. It includes the AWS account, Region, and the job ID. The format of the ARN is as follows:</p> <p> <code>arn:&lt;partition&gt;:comprehend:&lt;region&gt;:&lt;account-id&gt;:pii-entities-detection-job/&lt;job-id&gt;</code> </p> <p>The following is an example job ARN:</p> <p> <code>arn:aws:comprehend:us-west-2:111122223333:pii-entities-detection-job/1234abcd12ab34cd56ef1234567890ab</code> </p>\"\
        },\
        \"JobName\":{\
          \"shape\":\"JobName\",\
          \"documentation\":\"<p>The name that you assigned the PII entities detection job.</p>\"\
        },\
        \"JobStatus\":{\
          \"shape\":\"JobStatus\",\
          \"documentation\":\"<p>The current status of the PII entities detection job. If the status is <code>FAILED</code>, the <code>Message</code> field shows the reason for the failure.</p>\"\
        },\
        \"Message\":{\
          \"shape\":\"AnyLengthString\",\
          \"documentation\":\"<p>A description of the status of a job.</p>\"\
        },\
        \"SubmitTime\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The time that the PII entities detection job was submitted for processing.</p>\"\
        },\
        \"EndTime\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The time that the PII entities detection job completed.</p>\"\
        },\
        \"InputDataConfig\":{\
          \"shape\":\"InputDataConfig\",\
          \"documentation\":\"<p>The input properties for a PII entities detection job.</p>\"\
        },\
        \"OutputDataConfig\":{\
          \"shape\":\"PiiOutputDataConfig\",\
          \"documentation\":\"<p>The output data configuration that you supplied when you created the PII entities detection job.</p>\"\
        },\
        \"RedactionConfig\":{\
          \"shape\":\"RedactionConfig\",\
          \"documentation\":\"<p>Provides configuration parameters for PII entity redaction.</p> <p>This parameter is required if you set the <code>Mode</code> parameter to <code>ONLY_REDACTION</code>. In that case, you must provide a <code>RedactionConfig</code> definition that includes the <code>PiiEntityTypes</code> parameter.</p>\"\
        },\
        \"LanguageCode\":{\
          \"shape\":\"LanguageCode\",\
          \"documentation\":\"<p>The language code of the input documents</p>\"\
        },\
        \"DataAccessRoleArn\":{\
          \"shape\":\"IamRoleArn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) that gives Amazon Comprehend read access to your input data.</p>\"\
        },\
        \"Mode\":{\
          \"shape\":\"PiiEntitiesDetectionMode\",\
          \"documentation\":\"<p>Specifies whether the output provides the locations (offsets) of PII entities or a file in which PII entities are redacted.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Provides information about a PII entities detection job.</p>\"\
    },\
    \"PiiEntitiesDetectionJobPropertiesList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"PiiEntitiesDetectionJobProperties\"}\
    },\
    \"PiiEntitiesDetectionMaskMode\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"MASK\",\
        \"REPLACE_WITH_PII_ENTITY_TYPE\"\
      ]\
    },\
    \"PiiEntitiesDetectionMode\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"ONLY_REDACTION\",\
        \"ONLY_OFFSETS\"\
      ]\
    },\
    \"PiiEntity\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Score\":{\
          \"shape\":\"Float\",\
          \"documentation\":\"<p>The level of confidence that Amazon Comprehend has in the accuracy of the detection.</p>\"\
        },\
        \"Type\":{\
          \"shape\":\"PiiEntityType\",\
          \"documentation\":\"<p>The entity's type.</p>\"\
        },\
        \"BeginOffset\":{\
          \"shape\":\"Integer\",\
          \"documentation\":\"<p>The zero-based offset from the beginning of the source text to the first character in the entity.</p>\"\
        },\
        \"EndOffset\":{\
          \"shape\":\"Integer\",\
          \"documentation\":\"<p>The zero-based offset from the beginning of the source text to the last character in the entity.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Provides information about a PII entity.</p>\"\
    },\
    \"PiiEntityType\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"BANK_ACCOUNT_NUMBER\",\
        \"BANK_ROUTING\",\
        \"CREDIT_DEBIT_NUMBER\",\
        \"CREDIT_DEBIT_CVV\",\
        \"CREDIT_DEBIT_EXPIRY\",\
        \"PIN\",\
        \"EMAIL\",\
        \"ADDRESS\",\
        \"NAME\",\
        \"PHONE\",\
        \"SSN\",\
        \"DATE_TIME\",\
        \"PASSPORT_NUMBER\",\
        \"DRIVER_ID\",\
        \"URL\",\
        \"AGE\",\
        \"USERNAME\",\
        \"PASSWORD\",\
        \"AWS_ACCESS_KEY\",\
        \"AWS_SECRET_KEY\",\
        \"IP_ADDRESS\",\
        \"MAC_ADDRESS\",\
        \"ALL\",\
        \"LICENSE_PLATE\",\
        \"VEHICLE_IDENTIFICATION_NUMBER\",\
        \"UK_NATIONAL_INSURANCE_NUMBER\",\
        \"CA_SOCIAL_INSURANCE_NUMBER\",\
        \"US_INDIVIDUAL_TAX_IDENTIFICATION_NUMBER\",\
        \"UK_UNIQUE_TAXPAYER_REFERENCE_NUMBER\",\
        \"IN_PERMANENT_ACCOUNT_NUMBER\",\
        \"IN_NREGA\",\
        \"INTERNATIONAL_BANK_ACCOUNT_NUMBER\",\
        \"SWIFT_CODE\",\
        \"UK_NATIONAL_HEALTH_SERVICE_NUMBER\",\
        \"CA_HEALTH_NUMBER\",\
        \"IN_AADHAAR\",\
        \"IN_VOTER_NUMBER\"\
      ]\
    },\
    \"PiiOutputDataConfig\":{\
      \"type\":\"structure\",\
      \"required\":[\"S3Uri\"],\
      \"members\":{\
        \"S3Uri\":{\
          \"shape\":\"S3Uri\",\
          \"documentation\":\"<p>When you use the <code>PiiOutputDataConfig</code> object with asynchronous operations, you specify the Amazon S3 location where you want to write the output data. </p> <p> For a PII entity detection job, the output file is plain text, not a compressed archive. The output file name is the same as the input file, with <code>.out</code> appended at the end. </p>\"\
        },\
        \"KmsKeyId\":{\
          \"shape\":\"KmsKeyId\",\
          \"documentation\":\"<p>ID for the AWS Key Management Service (KMS) key that Amazon Comprehend uses to encrypt the output results from an analysis job.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Provides configuration parameters for the output of PII entity detection jobs.</p>\"\
    },\
    \"Point\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"X\":{\
          \"shape\":\"Float\",\
          \"documentation\":\"<p>The value of the X coordinate for a point on a polygon</p>\"\
        },\
        \"Y\":{\
          \"shape\":\"Float\",\
          \"documentation\":\"<p>The value of the Y coordinate for a point on a polygon</p>\"\
        }\
      },\
      \"documentation\":\"<p>The X and Y coordinates of a point on a document page.</p> <p>For additional information, see <a href=\\\"https://docs.aws.amazon.com/textract/latest/dg/API_Point.html\\\">Point</a> in the Amazon Textract API reference.</p>\"\
    },\
    \"Policy\":{\
      \"type\":\"string\",\
      \"max\":20000,\
      \"min\":1,\
      \"pattern\":\"[\\\\u0009\\\\u000A\\\\u000D\\\\u0020-\\\\u00FF]+\"\
    },\
    \"PolicyRevisionId\":{\
      \"type\":\"string\",\
      \"max\":64,\
      \"pattern\":\"[0-9A-Fa-f]+\"\
    },\
    \"Polygon\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"Point\"}\
    },\
    \"PutResourcePolicyRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"ResourceArn\",\
        \"ResourcePolicy\"\
      ],\
      \"members\":{\
        \"ResourceArn\":{\
          \"shape\":\"ComprehendModelArn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the custom model to attach the policy to.</p>\"\
        },\
        \"ResourcePolicy\":{\
          \"shape\":\"Policy\",\
          \"documentation\":\"<p>The JSON resource-based policy to attach to your custom model. Provide your JSON as a UTF-8 encoded string without line breaks. To provide valid JSON for your policy, enclose the attribute names and values in double quotes. If the JSON body is also enclosed in double quotes, then you must escape the double quotes that are inside the policy:</p> <p> <code>\\\"{\\\\\\\"attribute\\\\\\\": \\\\\\\"value\\\\\\\", \\\\\\\"attribute\\\\\\\": [\\\\\\\"value\\\\\\\"]}\\\"</code> </p> <p>To avoid escaping quotes, you can use single quotes to enclose the policy and double quotes to enclose the JSON names and values:</p> <p> <code>'{\\\"attribute\\\": \\\"value\\\", \\\"attribute\\\": [\\\"value\\\"]}'</code> </p>\"\
        },\
        \"PolicyRevisionId\":{\
          \"shape\":\"PolicyRevisionId\",\
          \"documentation\":\"<p>The revision ID that Amazon Comprehend assigned to the policy that you are updating. If you are creating a new policy that has no prior version, don't use this parameter. Amazon Comprehend creates the revision ID for you.</p>\"\
        }\
      }\
    },\
    \"PutResourcePolicyResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"PolicyRevisionId\":{\
          \"shape\":\"PolicyRevisionId\",\
          \"documentation\":\"<p>The revision ID of the policy. Each time you modify a policy, Amazon Comprehend assigns a new revision ID, and it deletes the prior version of the policy.</p>\"\
        }\
      }\
    },\
    \"RedactionConfig\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"PiiEntityTypes\":{\
          \"shape\":\"ListOfPiiEntityTypes\",\
          \"documentation\":\"<p>An array of the types of PII entities that Amazon Comprehend detects in the input text for your request.</p>\"\
        },\
        \"MaskMode\":{\
          \"shape\":\"PiiEntitiesDetectionMaskMode\",\
          \"documentation\":\"<p>Specifies whether the PII entity is redacted with the mask character or the entity type.</p>\"\
        },\
        \"MaskCharacter\":{\
          \"shape\":\"MaskCharacter\",\
          \"documentation\":\"<p>A character that replaces each character in the redacted PII entity.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Provides configuration parameters for PII entity redaction.</p>\"\
    },\
    \"RelationshipType\":{\
      \"type\":\"string\",\
      \"enum\":[\"CHILD\"]\
    },\
    \"RelationshipsListItem\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Ids\":{\
          \"shape\":\"StringList\",\
          \"documentation\":\"<p>Identifers of the child blocks.</p>\"\
        },\
        \"Type\":{\
          \"shape\":\"RelationshipType\",\
          \"documentation\":\"<p>Only supported relationship is a child relationship.</p>\"\
        }\
      },\
      \"documentation\":\"<p>List of child blocks for the current block.</p>\"\
    },\
    \"ResourceInUseException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Message\":{\"shape\":\"String\"}\
      },\
      \"documentation\":\"<p>The specified resource name is already in use. Use a different name and try your request again.</p>\",\
      \"exception\":true\
    },\
    \"ResourceLimitExceededException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Message\":{\"shape\":\"String\"}\
      },\
      \"documentation\":\"<p>The maximum number of resources per account has been exceeded. Review the resources, and then try your request again.</p>\",\
      \"exception\":true\
    },\
    \"ResourceNotFoundException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Message\":{\"shape\":\"String\"}\
      },\
      \"documentation\":\"<p>The specified resource ARN was not found. Check the ARN and try your request again.</p>\",\
      \"exception\":true\
    },\
    \"ResourceUnavailableException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Message\":{\"shape\":\"String\"}\
      },\
      \"documentation\":\"<p>The specified resource is not available. Check the resource and try your request again.</p>\",\
      \"exception\":true\
    },\
    \"S3Uri\":{\
      \"type\":\"string\",\
      \"max\":1024,\
      \"pattern\":\"s3://[a-z0-9][\\\\.\\\\-a-z0-9]{1,61}[a-z0-9](/.*)?\"\
    },\
    \"SecurityGroupId\":{\
      \"type\":\"string\",\
      \"max\":32,\
      \"min\":1,\
      \"pattern\":\"[-0-9a-zA-Z]+\"\
    },\
    \"SecurityGroupIds\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"SecurityGroupId\"},\
      \"max\":5,\
      \"min\":1\
    },\
    \"SemiStructuredDocumentBlob\":{\
      \"type\":\"blob\",\
      \"min\":1\
    },\
    \"SentimentDetectionJobFilter\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"JobName\":{\
          \"shape\":\"JobName\",\
          \"documentation\":\"<p>Filters on the name of the job.</p>\"\
        },\
        \"JobStatus\":{\
          \"shape\":\"JobStatus\",\
          \"documentation\":\"<p>Filters the list of jobs based on job status. Returns only jobs with the specified status.</p>\"\
        },\
        \"SubmitTimeBefore\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>Filters the list of jobs based on the time that the job was submitted for processing. Returns only jobs submitted before the specified time. Jobs are returned in ascending order, oldest to newest.</p>\"\
        },\
        \"SubmitTimeAfter\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>Filters the list of jobs based on the time that the job was submitted for processing. Returns only jobs submitted after the specified time. Jobs are returned in descending order, newest to oldest.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Provides information for filtering a list of dominant language detection jobs. For more information, see the operation.</p>\"\
    },\
    \"SentimentDetectionJobProperties\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"JobId\":{\
          \"shape\":\"JobId\",\
          \"documentation\":\"<p>The identifier assigned to the sentiment detection job.</p>\"\
        },\
        \"JobArn\":{\
          \"shape\":\"ComprehendArn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the sentiment detection job. It is a unique, fully qualified identifier for the job. It includes the AWS account, Region, and the job ID. The format of the ARN is as follows:</p> <p> <code>arn:&lt;partition&gt;:comprehend:&lt;region&gt;:&lt;account-id&gt;:sentiment-detection-job/&lt;job-id&gt;</code> </p> <p>The following is an example job ARN:</p> <p> <code>arn:aws:comprehend:us-west-2:111122223333:sentiment-detection-job/1234abcd12ab34cd56ef1234567890ab</code> </p>\"\
        },\
        \"JobName\":{\
          \"shape\":\"JobName\",\
          \"documentation\":\"<p>The name that you assigned to the sentiment detection job</p>\"\
        },\
        \"JobStatus\":{\
          \"shape\":\"JobStatus\",\
          \"documentation\":\"<p>The current status of the sentiment detection job. If the status is <code>FAILED</code>, the <code>Messages</code> field shows the reason for the failure.</p>\"\
        },\
        \"Message\":{\
          \"shape\":\"AnyLengthString\",\
          \"documentation\":\"<p>A description of the status of a job.</p>\"\
        },\
        \"SubmitTime\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The time that the sentiment detection job was submitted for processing.</p>\"\
        },\
        \"EndTime\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The time that the sentiment detection job ended.</p>\"\
        },\
        \"InputDataConfig\":{\
          \"shape\":\"InputDataConfig\",\
          \"documentation\":\"<p>The input data configuration that you supplied when you created the sentiment detection job.</p>\"\
        },\
        \"OutputDataConfig\":{\
          \"shape\":\"OutputDataConfig\",\
          \"documentation\":\"<p>The output data configuration that you supplied when you created the sentiment detection job.</p>\"\
        },\
        \"LanguageCode\":{\
          \"shape\":\"LanguageCode\",\
          \"documentation\":\"<p>The language code of the input documents.</p>\"\
        },\
        \"DataAccessRoleArn\":{\
          \"shape\":\"IamRoleArn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) that gives Amazon Comprehend read access to your input data.</p>\"\
        },\
        \"VolumeKmsKeyId\":{\
          \"shape\":\"KmsKeyId\",\
          \"documentation\":\"<p>ID for the AWS Key Management Service (KMS) key that Amazon Comprehend uses to encrypt data on the storage volume attached to the ML compute instance(s) that process the analysis job. The VolumeKmsKeyId can be either of the following formats:</p> <ul> <li> <p>KMS Key ID: <code>\\\"1234abcd-12ab-34cd-56ef-1234567890ab\\\"</code> </p> </li> <li> <p>Amazon Resource Name (ARN) of a KMS Key: <code>\\\"arn:aws:kms:us-west-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab\\\"</code> </p> </li> </ul>\"\
        },\
        \"VpcConfig\":{\
          \"shape\":\"VpcConfig\",\
          \"documentation\":\"<p> Configuration parameters for a private Virtual Private Cloud (VPC) containing the resources you are using for your sentiment detection job. For more information, see <a href=\\\"https://docs.aws.amazon.com/vpc/latest/userguide/what-is-amazon-vpc.html\\\">Amazon VPC</a>. </p>\"\
        }\
      },\
      \"documentation\":\"<p>Provides information about a sentiment detection job.</p>\"\
    },\
    \"SentimentDetectionJobPropertiesList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"SentimentDetectionJobProperties\"}\
    },\
    \"SentimentScore\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Positive\":{\
          \"shape\":\"Float\",\
          \"documentation\":\"<p>The level of confidence that Amazon Comprehend has in the accuracy of its detection of the <code>POSITIVE</code> sentiment.</p>\"\
        },\
        \"Negative\":{\
          \"shape\":\"Float\",\
          \"documentation\":\"<p>The level of confidence that Amazon Comprehend has in the accuracy of its detection of the <code>NEGATIVE</code> sentiment.</p>\"\
        },\
        \"Neutral\":{\
          \"shape\":\"Float\",\
          \"documentation\":\"<p>The level of confidence that Amazon Comprehend has in the accuracy of its detection of the <code>NEUTRAL</code> sentiment.</p>\"\
        },\
        \"Mixed\":{\
          \"shape\":\"Float\",\
          \"documentation\":\"<p>The level of confidence that Amazon Comprehend has in the accuracy of its detection of the <code>MIXED</code> sentiment.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Describes the level of confidence that Amazon Comprehend has in the accuracy of its detection of sentiments.</p>\"\
    },\
    \"SentimentType\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"POSITIVE\",\
        \"NEGATIVE\",\
        \"NEUTRAL\",\
        \"MIXED\"\
      ]\
    },\
    \"Split\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"TRAIN\",\
        \"TEST\"\
      ]\
    },\
    \"StartDocumentClassificationJobRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"DocumentClassifierArn\",\
        \"InputDataConfig\",\
        \"OutputDataConfig\",\
        \"DataAccessRoleArn\"\
      ],\
      \"members\":{\
        \"JobName\":{\
          \"shape\":\"JobName\",\
          \"documentation\":\"<p>The identifier of the job.</p>\"\
        },\
        \"DocumentClassifierArn\":{\
          \"shape\":\"DocumentClassifierArn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the document classifier to use to process the job.</p>\"\
        },\
        \"InputDataConfig\":{\
          \"shape\":\"InputDataConfig\",\
          \"documentation\":\"<p>Specifies the format and location of the input data for the job.</p>\"\
        },\
        \"OutputDataConfig\":{\
          \"shape\":\"OutputDataConfig\",\
          \"documentation\":\"<p>Specifies where to send the output files.</p>\"\
        },\
        \"DataAccessRoleArn\":{\
          \"shape\":\"IamRoleArn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the AWS Identity and Access Management (IAM) role that grants Amazon Comprehend read access to your input data.</p>\"\
        },\
        \"ClientRequestToken\":{\
          \"shape\":\"ClientRequestTokenString\",\
          \"documentation\":\"<p>A unique identifier for the request. If you do not set the client request token, Amazon Comprehend generates one.</p>\",\
          \"idempotencyToken\":true\
        },\
        \"VolumeKmsKeyId\":{\
          \"shape\":\"KmsKeyId\",\
          \"documentation\":\"<p>ID for the AWS Key Management Service (KMS) key that Amazon Comprehend uses to encrypt data on the storage volume attached to the ML compute instance(s) that process the analysis job. The VolumeKmsKeyId can be either of the following formats:</p> <ul> <li> <p>KMS Key ID: <code>\\\"1234abcd-12ab-34cd-56ef-1234567890ab\\\"</code> </p> </li> <li> <p>Amazon Resource Name (ARN) of a KMS Key: <code>\\\"arn:aws:kms:us-west-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab\\\"</code> </p> </li> </ul>\"\
        },\
        \"VpcConfig\":{\
          \"shape\":\"VpcConfig\",\
          \"documentation\":\"<p>Configuration parameters for an optional private Virtual Private Cloud (VPC) containing the resources you are using for your document classification job. For more information, see <a href=\\\"https://docs.aws.amazon.com/vpc/latest/userguide/what-is-amazon-vpc.html\\\">Amazon VPC</a>. </p>\"\
        },\
        \"Tags\":{\
          \"shape\":\"TagList\",\
          \"documentation\":\"<p>Tags to be associated with the document classification job. A tag is a key-value pair that adds metadata to a resource used by Amazon Comprehend. For example, a tag with \\\"Sales\\\" as the key might be added to a resource to indicate its use by the sales department.</p>\"\
        }\
      }\
    },\
    \"StartDocumentClassificationJobResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"JobId\":{\
          \"shape\":\"JobId\",\
          \"documentation\":\"<p>The identifier generated for the job. To get the status of the job, use this identifier with the operation.</p>\"\
        },\
        \"JobArn\":{\
          \"shape\":\"ComprehendArn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the document classification job. It is a unique, fully qualified identifier for the job. It includes the AWS account, Region, and the job ID. The format of the ARN is as follows:</p> <p> <code>arn:&lt;partition&gt;:comprehend:&lt;region&gt;:&lt;account-id&gt;:document-classification-job/&lt;job-id&gt;</code> </p> <p>The following is an example job ARN:</p> <p> <code>arn:aws:comprehend:us-west-2:111122223333:document-classification-job/1234abcd12ab34cd56ef1234567890ab</code> </p>\"\
        },\
        \"JobStatus\":{\
          \"shape\":\"JobStatus\",\
          \"documentation\":\"<p>The status of the job:</p> <ul> <li> <p>SUBMITTED - The job has been received and queued for processing.</p> </li> <li> <p>IN_PROGRESS - Amazon Comprehend is processing the job.</p> </li> <li> <p>COMPLETED - The job was successfully completed and the output is available.</p> </li> <li> <p>FAILED - The job did not complete. For details, use the operation.</p> </li> <li> <p>STOP_REQUESTED - Amazon Comprehend has received a stop request for the job and is processing the request.</p> </li> <li> <p>STOPPED - The job was successfully stopped without completing.</p> </li> </ul>\"\
        }\
      }\
    },\
    \"StartDominantLanguageDetectionJobRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"InputDataConfig\",\
        \"OutputDataConfig\",\
        \"DataAccessRoleArn\"\
      ],\
      \"members\":{\
        \"InputDataConfig\":{\
          \"shape\":\"InputDataConfig\",\
          \"documentation\":\"<p>Specifies the format and location of the input data for the job.</p>\"\
        },\
        \"OutputDataConfig\":{\
          \"shape\":\"OutputDataConfig\",\
          \"documentation\":\"<p>Specifies where to send the output files.</p>\"\
        },\
        \"DataAccessRoleArn\":{\
          \"shape\":\"IamRoleArn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the AWS Identity and Access Management (IAM) role that grants Amazon Comprehend read access to your input data. For more information, see <a href=\\\"https://docs.aws.amazon.com/comprehend/latest/dg/access-control-managing-permissions.html#auth-role-permissions\\\">https://docs.aws.amazon.com/comprehend/latest/dg/access-control-managing-permissions.html#auth-role-permissions</a>.</p>\"\
        },\
        \"JobName\":{\
          \"shape\":\"JobName\",\
          \"documentation\":\"<p>An identifier for the job.</p>\"\
        },\
        \"ClientRequestToken\":{\
          \"shape\":\"ClientRequestTokenString\",\
          \"documentation\":\"<p>A unique identifier for the request. If you do not set the client request token, Amazon Comprehend generates one.</p>\",\
          \"idempotencyToken\":true\
        },\
        \"VolumeKmsKeyId\":{\
          \"shape\":\"KmsKeyId\",\
          \"documentation\":\"<p>ID for the AWS Key Management Service (KMS) key that Amazon Comprehend uses to encrypt data on the storage volume attached to the ML compute instance(s) that process the analysis job. The VolumeKmsKeyId can be either of the following formats:</p> <ul> <li> <p>KMS Key ID: <code>\\\"1234abcd-12ab-34cd-56ef-1234567890ab\\\"</code> </p> </li> <li> <p>Amazon Resource Name (ARN) of a KMS Key: <code>\\\"arn:aws:kms:us-west-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab\\\"</code> </p> </li> </ul>\"\
        },\
        \"VpcConfig\":{\
          \"shape\":\"VpcConfig\",\
          \"documentation\":\"<p>Configuration parameters for an optional private Virtual Private Cloud (VPC) containing the resources you are using for your dominant language detection job. For more information, see <a href=\\\"https://docs.aws.amazon.com/vpc/latest/userguide/what-is-amazon-vpc.html\\\">Amazon VPC</a>. </p>\"\
        },\
        \"Tags\":{\
          \"shape\":\"TagList\",\
          \"documentation\":\"<p>Tags to be associated with the dominant language detection job. A tag is a key-value pair that adds metadata to a resource used by Amazon Comprehend. For example, a tag with \\\"Sales\\\" as the key might be added to a resource to indicate its use by the sales department.</p>\"\
        }\
      }\
    },\
    \"StartDominantLanguageDetectionJobResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"JobId\":{\
          \"shape\":\"JobId\",\
          \"documentation\":\"<p>The identifier generated for the job. To get the status of a job, use this identifier with the operation.</p>\"\
        },\
        \"JobArn\":{\
          \"shape\":\"ComprehendArn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the dominant language detection job. It is a unique, fully qualified identifier for the job. It includes the AWS account, Region, and the job ID. The format of the ARN is as follows:</p> <p> <code>arn:&lt;partition&gt;:comprehend:&lt;region&gt;:&lt;account-id&gt;:dominant-language-detection-job/&lt;job-id&gt;</code> </p> <p>The following is an example job ARN:</p> <p> <code>arn:aws:comprehend:us-west-2:111122223333:dominant-language-detection-job/1234abcd12ab34cd56ef1234567890ab</code> </p>\"\
        },\
        \"JobStatus\":{\
          \"shape\":\"JobStatus\",\
          \"documentation\":\"<p>The status of the job. </p> <ul> <li> <p>SUBMITTED - The job has been received and is queued for processing.</p> </li> <li> <p>IN_PROGRESS - Amazon Comprehend is processing the job.</p> </li> <li> <p>COMPLETED - The job was successfully completed and the output is available.</p> </li> <li> <p>FAILED - The job did not complete. To get details, use the operation.</p> </li> </ul>\"\
        }\
      }\
    },\
    \"StartEntitiesDetectionJobRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"InputDataConfig\",\
        \"OutputDataConfig\",\
        \"DataAccessRoleArn\",\
        \"LanguageCode\"\
      ],\
      \"members\":{\
        \"InputDataConfig\":{\
          \"shape\":\"InputDataConfig\",\
          \"documentation\":\"<p>Specifies the format and location of the input data for the job.</p>\"\
        },\
        \"OutputDataConfig\":{\
          \"shape\":\"OutputDataConfig\",\
          \"documentation\":\"<p>Specifies where to send the output files.</p>\"\
        },\
        \"DataAccessRoleArn\":{\
          \"shape\":\"IamRoleArn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the AWS Identity and Access Management (IAM) role that grants Amazon Comprehend read access to your input data. For more information, see <a href=\\\"https://docs.aws.amazon.com/comprehend/latest/dg/access-control-managing-permissions.html#auth-role-permissions\\\">https://docs.aws.amazon.com/comprehend/latest/dg/access-control-managing-permissions.html#auth-role-permissions</a>.</p>\"\
        },\
        \"JobName\":{\
          \"shape\":\"JobName\",\
          \"documentation\":\"<p>The identifier of the job.</p>\"\
        },\
        \"EntityRecognizerArn\":{\
          \"shape\":\"EntityRecognizerArn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) that identifies the specific entity recognizer to be used by the <code>StartEntitiesDetectionJob</code>. This ARN is optional and is only used for a custom entity recognition job.</p>\"\
        },\
        \"LanguageCode\":{\
          \"shape\":\"LanguageCode\",\
          \"documentation\":\"<p>The language of the input documents. All documents must be in the same language. You can specify any of the languages supported by Amazon Comprehend. If custom entities recognition is used, this parameter is ignored and the language used for training the model is used instead.</p>\"\
        },\
        \"ClientRequestToken\":{\
          \"shape\":\"ClientRequestTokenString\",\
          \"documentation\":\"<p>A unique identifier for the request. If you don't set the client request token, Amazon Comprehend generates one.</p>\",\
          \"idempotencyToken\":true\
        },\
        \"VolumeKmsKeyId\":{\
          \"shape\":\"KmsKeyId\",\
          \"documentation\":\"<p>ID for the AWS Key Management Service (KMS) key that Amazon Comprehend uses to encrypt data on the storage volume attached to the ML compute instance(s) that process the analysis job. The VolumeKmsKeyId can be either of the following formats:</p> <ul> <li> <p>KMS Key ID: <code>\\\"1234abcd-12ab-34cd-56ef-1234567890ab\\\"</code> </p> </li> <li> <p>Amazon Resource Name (ARN) of a KMS Key: <code>\\\"arn:aws:kms:us-west-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab\\\"</code> </p> </li> </ul>\"\
        },\
        \"VpcConfig\":{\
          \"shape\":\"VpcConfig\",\
          \"documentation\":\"<p>Configuration parameters for an optional private Virtual Private Cloud (VPC) containing the resources you are using for your entity detection job. For more information, see <a href=\\\"https://docs.aws.amazon.com/vpc/latest/userguide/what-is-amazon-vpc.html\\\">Amazon VPC</a>. </p>\"\
        },\
        \"Tags\":{\
          \"shape\":\"TagList\",\
          \"documentation\":\"<p>Tags to be associated with the entities detection job. A tag is a key-value pair that adds metadata to a resource used by Amazon Comprehend. For example, a tag with \\\"Sales\\\" as the key might be added to a resource to indicate its use by the sales department.</p>\"\
        }\
      }\
    },\
    \"StartEntitiesDetectionJobResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"JobId\":{\
          \"shape\":\"JobId\",\
          \"documentation\":\"<p>The identifier generated for the job. To get the status of job, use this identifier with the operation.</p>\"\
        },\
        \"JobArn\":{\
          \"shape\":\"ComprehendArn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the entities detection job. It is a unique, fully qualified identifier for the job. It includes the AWS account, Region, and the job ID. The format of the ARN is as follows:</p> <p> <code>arn:&lt;partition&gt;:comprehend:&lt;region&gt;:&lt;account-id&gt;:entities-detection-job/&lt;job-id&gt;</code> </p> <p>The following is an example job ARN:</p> <p> <code>arn:aws:comprehend:us-west-2:111122223333:entities-detection-job/1234abcd12ab34cd56ef1234567890ab</code> </p>\"\
        },\
        \"JobStatus\":{\
          \"shape\":\"JobStatus\",\
          \"documentation\":\"<p>The status of the job. </p> <ul> <li> <p>SUBMITTED - The job has been received and is queued for processing.</p> </li> <li> <p>IN_PROGRESS - Amazon Comprehend is processing the job.</p> </li> <li> <p>COMPLETED - The job was successfully completed and the output is available.</p> </li> <li> <p>FAILED - The job did not complete. To get details, use the operation.</p> </li> <li> <p>STOP_REQUESTED - Amazon Comprehend has received a stop request for the job and is processing the request.</p> </li> <li> <p>STOPPED - The job was successfully stopped without completing.</p> </li> </ul>\"\
        }\
      }\
    },\
    \"StartEventsDetectionJobRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"InputDataConfig\",\
        \"OutputDataConfig\",\
        \"DataAccessRoleArn\",\
        \"LanguageCode\",\
        \"TargetEventTypes\"\
      ],\
      \"members\":{\
        \"InputDataConfig\":{\
          \"shape\":\"InputDataConfig\",\
          \"documentation\":\"<p>Specifies the format and location of the input data for the job.</p>\"\
        },\
        \"OutputDataConfig\":{\
          \"shape\":\"OutputDataConfig\",\
          \"documentation\":\"<p>Specifies where to send the output files.</p>\"\
        },\
        \"DataAccessRoleArn\":{\
          \"shape\":\"IamRoleArn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the AWS Identity and Access Management (IAM) role that grants Amazon Comprehend read access to your input data.</p>\"\
        },\
        \"JobName\":{\
          \"shape\":\"JobName\",\
          \"documentation\":\"<p>The identifier of the events detection job.</p>\"\
        },\
        \"LanguageCode\":{\
          \"shape\":\"LanguageCode\",\
          \"documentation\":\"<p>The language code of the input documents.</p>\"\
        },\
        \"ClientRequestToken\":{\
          \"shape\":\"ClientRequestTokenString\",\
          \"documentation\":\"<p>An unique identifier for the request. If you don't set the client request token, Amazon Comprehend generates one.</p>\",\
          \"idempotencyToken\":true\
        },\
        \"TargetEventTypes\":{\
          \"shape\":\"TargetEventTypes\",\
          \"documentation\":\"<p>The types of events to detect in the input documents.</p>\"\
        },\
        \"Tags\":{\
          \"shape\":\"TagList\",\
          \"documentation\":\"<p>Tags to be associated with the events detection job. A tag is a key-value pair that adds metadata to a resource used by Amazon Comprehend. For example, a tag with \\\"Sales\\\" as the key might be added to a resource to indicate its use by the sales department.</p>\"\
        }\
      }\
    },\
    \"StartEventsDetectionJobResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"JobId\":{\
          \"shape\":\"JobId\",\
          \"documentation\":\"<p>An unique identifier for the request. If you don't set the client request token, Amazon Comprehend generates one.</p>\"\
        },\
        \"JobArn\":{\
          \"shape\":\"ComprehendArn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the events detection job. It is a unique, fully qualified identifier for the job. It includes the AWS account, Region, and the job ID. The format of the ARN is as follows:</p> <p> <code>arn:&lt;partition&gt;:comprehend:&lt;region&gt;:&lt;account-id&gt;:events-detection-job/&lt;job-id&gt;</code> </p> <p>The following is an example job ARN:</p> <p> <code>arn:aws:comprehend:us-west-2:111122223333:events-detection-job/1234abcd12ab34cd56ef1234567890ab</code> </p>\"\
        },\
        \"JobStatus\":{\
          \"shape\":\"JobStatus\",\
          \"documentation\":\"<p>The status of the events detection job.</p>\"\
        }\
      }\
    },\
    \"StartKeyPhrasesDetectionJobRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"InputDataConfig\",\
        \"OutputDataConfig\",\
        \"DataAccessRoleArn\",\
        \"LanguageCode\"\
      ],\
      \"members\":{\
        \"InputDataConfig\":{\
          \"shape\":\"InputDataConfig\",\
          \"documentation\":\"<p>Specifies the format and location of the input data for the job.</p>\"\
        },\
        \"OutputDataConfig\":{\
          \"shape\":\"OutputDataConfig\",\
          \"documentation\":\"<p>Specifies where to send the output files.</p>\"\
        },\
        \"DataAccessRoleArn\":{\
          \"shape\":\"IamRoleArn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the AWS Identity and Access Management (IAM) role that grants Amazon Comprehend read access to your input data. For more information, see <a href=\\\"https://docs.aws.amazon.com/comprehend/latest/dg/access-control-managing-permissions.html#auth-role-permissions\\\">https://docs.aws.amazon.com/comprehend/latest/dg/access-control-managing-permissions.html#auth-role-permissions</a>.</p>\"\
        },\
        \"JobName\":{\
          \"shape\":\"JobName\",\
          \"documentation\":\"<p>The identifier of the job.</p>\"\
        },\
        \"LanguageCode\":{\
          \"shape\":\"LanguageCode\",\
          \"documentation\":\"<p>The language of the input documents. You can specify any of the primary languages supported by Amazon Comprehend. All documents must be in the same language.</p>\"\
        },\
        \"ClientRequestToken\":{\
          \"shape\":\"ClientRequestTokenString\",\
          \"documentation\":\"<p>A unique identifier for the request. If you don't set the client request token, Amazon Comprehend generates one.</p>\",\
          \"idempotencyToken\":true\
        },\
        \"VolumeKmsKeyId\":{\
          \"shape\":\"KmsKeyId\",\
          \"documentation\":\"<p>ID for the AWS Key Management Service (KMS) key that Amazon Comprehend uses to encrypt data on the storage volume attached to the ML compute instance(s) that process the analysis job. The VolumeKmsKeyId can be either of the following formats:</p> <ul> <li> <p>KMS Key ID: <code>\\\"1234abcd-12ab-34cd-56ef-1234567890ab\\\"</code> </p> </li> <li> <p>Amazon Resource Name (ARN) of a KMS Key: <code>\\\"arn:aws:kms:us-west-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab\\\"</code> </p> </li> </ul>\"\
        },\
        \"VpcConfig\":{\
          \"shape\":\"VpcConfig\",\
          \"documentation\":\"<p> Configuration parameters for an optional private Virtual Private Cloud (VPC) containing the resources you are using for your key phrases detection job. For more information, see <a href=\\\"https://docs.aws.amazon.com/vpc/latest/userguide/what-is-amazon-vpc.html\\\">Amazon VPC</a>. </p>\"\
        },\
        \"Tags\":{\
          \"shape\":\"TagList\",\
          \"documentation\":\"<p>Tags to be associated with the key phrases detection job. A tag is a key-value pair that adds metadata to a resource used by Amazon Comprehend. For example, a tag with \\\"Sales\\\" as the key might be added to a resource to indicate its use by the sales department.</p>\"\
        }\
      }\
    },\
    \"StartKeyPhrasesDetectionJobResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"JobId\":{\
          \"shape\":\"JobId\",\
          \"documentation\":\"<p>The identifier generated for the job. To get the status of a job, use this identifier with the operation.</p>\"\
        },\
        \"JobArn\":{\
          \"shape\":\"ComprehendArn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the key phrase detection job. It is a unique, fully qualified identifier for the job. It includes the AWS account, Region, and the job ID. The format of the ARN is as follows:</p> <p> <code>arn:&lt;partition&gt;:comprehend:&lt;region&gt;:&lt;account-id&gt;:key-phrases-detection-job/&lt;job-id&gt;</code> </p> <p>The following is an example job ARN:</p> <p> <code>arn:aws:comprehend:us-west-2:111122223333:key-phrases-detection-job/1234abcd12ab34cd56ef1234567890ab</code> </p>\"\
        },\
        \"JobStatus\":{\
          \"shape\":\"JobStatus\",\
          \"documentation\":\"<p>The status of the job. </p> <ul> <li> <p>SUBMITTED - The job has been received and is queued for processing.</p> </li> <li> <p>IN_PROGRESS - Amazon Comprehend is processing the job.</p> </li> <li> <p>COMPLETED - The job was successfully completed and the output is available.</p> </li> <li> <p>FAILED - The job did not complete. To get details, use the operation.</p> </li> </ul>\"\
        }\
      }\
    },\
    \"StartPiiEntitiesDetectionJobRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"InputDataConfig\",\
        \"OutputDataConfig\",\
        \"Mode\",\
        \"DataAccessRoleArn\",\
        \"LanguageCode\"\
      ],\
      \"members\":{\
        \"InputDataConfig\":{\
          \"shape\":\"InputDataConfig\",\
          \"documentation\":\"<p>The input properties for a PII entities detection job.</p>\"\
        },\
        \"OutputDataConfig\":{\
          \"shape\":\"OutputDataConfig\",\
          \"documentation\":\"<p>Provides conï¬guration parameters for the output of PII entity detection jobs.</p>\"\
        },\
        \"Mode\":{\
          \"shape\":\"PiiEntitiesDetectionMode\",\
          \"documentation\":\"<p>Specifies whether the output provides the locations (offsets) of PII entities or a file in which PII entities are redacted.</p>\"\
        },\
        \"RedactionConfig\":{\
          \"shape\":\"RedactionConfig\",\
          \"documentation\":\"<p>Provides configuration parameters for PII entity redaction.</p> <p>This parameter is required if you set the <code>Mode</code> parameter to <code>ONLY_REDACTION</code>. In that case, you must provide a <code>RedactionConfig</code> definition that includes the <code>PiiEntityTypes</code> parameter.</p>\"\
        },\
        \"DataAccessRoleArn\":{\
          \"shape\":\"IamRoleArn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the AWS Identity and Access Management (IAM) role that grants Amazon Comprehend read access to your input data.</p>\"\
        },\
        \"JobName\":{\
          \"shape\":\"JobName\",\
          \"documentation\":\"<p>The identifier of the job.</p>\"\
        },\
        \"LanguageCode\":{\
          \"shape\":\"LanguageCode\",\
          \"documentation\":\"<p>The language of the input documents. Currently, English is the only valid language.</p>\"\
        },\
        \"ClientRequestToken\":{\
          \"shape\":\"ClientRequestTokenString\",\
          \"documentation\":\"<p>A unique identifier for the request. If you don't set the client request token, Amazon Comprehend generates one.</p>\",\
          \"idempotencyToken\":true\
        },\
        \"Tags\":{\
          \"shape\":\"TagList\",\
          \"documentation\":\"<p>Tags to be associated with the PII entities detection job. A tag is a key-value pair that adds metadata to a resource used by Amazon Comprehend. For example, a tag with \\\"Sales\\\" as the key might be added to a resource to indicate its use by the sales department.</p>\"\
        }\
      }\
    },\
    \"StartPiiEntitiesDetectionJobResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"JobId\":{\
          \"shape\":\"JobId\",\
          \"documentation\":\"<p>The identifier generated for the job.</p>\"\
        },\
        \"JobArn\":{\
          \"shape\":\"ComprehendArn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the PII entity detection job. It is a unique, fully qualified identifier for the job. It includes the AWS account, Region, and the job ID. The format of the ARN is as follows:</p> <p> <code>arn:&lt;partition&gt;:comprehend:&lt;region&gt;:&lt;account-id&gt;:pii-entities-detection-job/&lt;job-id&gt;</code> </p> <p>The following is an example job ARN:</p> <p> <code>arn:aws:comprehend:us-west-2:111122223333:pii-entities-detection-job/1234abcd12ab34cd56ef1234567890ab</code> </p>\"\
        },\
        \"JobStatus\":{\
          \"shape\":\"JobStatus\",\
          \"documentation\":\"<p>The status of the job.</p>\"\
        }\
      }\
    },\
    \"StartSentimentDetectionJobRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"InputDataConfig\",\
        \"OutputDataConfig\",\
        \"DataAccessRoleArn\",\
        \"LanguageCode\"\
      ],\
      \"members\":{\
        \"InputDataConfig\":{\
          \"shape\":\"InputDataConfig\",\
          \"documentation\":\"<p>Specifies the format and location of the input data for the job.</p>\"\
        },\
        \"OutputDataConfig\":{\
          \"shape\":\"OutputDataConfig\",\
          \"documentation\":\"<p>Specifies where to send the output files. </p>\"\
        },\
        \"DataAccessRoleArn\":{\
          \"shape\":\"IamRoleArn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the AWS Identity and Access Management (IAM) role that grants Amazon Comprehend read access to your input data. For more information, see <a href=\\\"https://docs.aws.amazon.com/comprehend/latest/dg/access-control-managing-permissions.html#auth-role-permissions\\\">https://docs.aws.amazon.com/comprehend/latest/dg/access-control-managing-permissions.html#auth-role-permissions</a>.</p>\"\
        },\
        \"JobName\":{\
          \"shape\":\"JobName\",\
          \"documentation\":\"<p>The identifier of the job.</p>\"\
        },\
        \"LanguageCode\":{\
          \"shape\":\"LanguageCode\",\
          \"documentation\":\"<p>The language of the input documents. You can specify any of the primary languages supported by Amazon Comprehend. All documents must be in the same language.</p>\"\
        },\
        \"ClientRequestToken\":{\
          \"shape\":\"ClientRequestTokenString\",\
          \"documentation\":\"<p>A unique identifier for the request. If you don't set the client request token, Amazon Comprehend generates one.</p>\",\
          \"idempotencyToken\":true\
        },\
        \"VolumeKmsKeyId\":{\
          \"shape\":\"KmsKeyId\",\
          \"documentation\":\"<p>ID for the AWS Key Management Service (KMS) key that Amazon Comprehend uses to encrypt data on the storage volume attached to the ML compute instance(s) that process the analysis job. The VolumeKmsKeyId can be either of the following formats:</p> <ul> <li> <p>KMS Key ID: <code>\\\"1234abcd-12ab-34cd-56ef-1234567890ab\\\"</code> </p> </li> <li> <p>Amazon Resource Name (ARN) of a KMS Key: <code>\\\"arn:aws:kms:us-west-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab\\\"</code> </p> </li> </ul>\"\
        },\
        \"VpcConfig\":{\
          \"shape\":\"VpcConfig\",\
          \"documentation\":\"<p>Configuration parameters for an optional private Virtual Private Cloud (VPC) containing the resources you are using for your sentiment detection job. For more information, see <a href=\\\"https://docs.aws.amazon.com/vpc/latest/userguide/what-is-amazon-vpc.html\\\">Amazon VPC</a>. </p>\"\
        },\
        \"Tags\":{\
          \"shape\":\"TagList\",\
          \"documentation\":\"<p>Tags to be associated with the sentiment detection job. A tag is a key-value pair that adds metadata to a resource used by Amazon Comprehend. For example, a tag with \\\"Sales\\\" as the key might be added to a resource to indicate its use by the sales department.</p>\"\
        }\
      }\
    },\
    \"StartSentimentDetectionJobResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"JobId\":{\
          \"shape\":\"JobId\",\
          \"documentation\":\"<p>The identifier generated for the job. To get the status of a job, use this identifier with the operation.</p>\"\
        },\
        \"JobArn\":{\
          \"shape\":\"ComprehendArn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the sentiment detection job. It is a unique, fully qualified identifier for the job. It includes the AWS account, Region, and the job ID. The format of the ARN is as follows:</p> <p> <code>arn:&lt;partition&gt;:comprehend:&lt;region&gt;:&lt;account-id&gt;:sentiment-detection-job/&lt;job-id&gt;</code> </p> <p>The following is an example job ARN:</p> <p> <code>arn:aws:comprehend:us-west-2:111122223333:sentiment-detection-job/1234abcd12ab34cd56ef1234567890ab</code> </p>\"\
        },\
        \"JobStatus\":{\
          \"shape\":\"JobStatus\",\
          \"documentation\":\"<p>The status of the job. </p> <ul> <li> <p>SUBMITTED - The job has been received and is queued for processing.</p> </li> <li> <p>IN_PROGRESS - Amazon Comprehend is processing the job.</p> </li> <li> <p>COMPLETED - The job was successfully completed and the output is available.</p> </li> <li> <p>FAILED - The job did not complete. To get details, use the operation.</p> </li> </ul>\"\
        }\
      }\
    },\
    \"StartTargetedSentimentDetectionJobRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"InputDataConfig\",\
        \"OutputDataConfig\",\
        \"DataAccessRoleArn\",\
        \"LanguageCode\"\
      ],\
      \"members\":{\
        \"InputDataConfig\":{\"shape\":\"InputDataConfig\"},\
        \"OutputDataConfig\":{\
          \"shape\":\"OutputDataConfig\",\
          \"documentation\":\"<p>Specifies where to send the output files. </p>\"\
        },\
        \"DataAccessRoleArn\":{\
          \"shape\":\"IamRoleArn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the AWS Identity and Access Management (IAM) role that grants Amazon Comprehend read access to your input data. For more information, see <a href=\\\"https://docs.aws.amazon.com/comprehend/latest/dg/access-control-managing-permissions.html#auth-role-permissions\\\">Role-based permissions</a>.</p>\"\
        },\
        \"JobName\":{\
          \"shape\":\"JobName\",\
          \"documentation\":\"<p>The identifier of the job.</p>\"\
        },\
        \"LanguageCode\":{\
          \"shape\":\"LanguageCode\",\
          \"documentation\":\"<p>The language of the input documents. Currently, English is the only supported language.</p>\"\
        },\
        \"ClientRequestToken\":{\
          \"shape\":\"ClientRequestTokenString\",\
          \"documentation\":\"<p>A unique identifier for the request. If you don't set the client request token, Amazon Comprehend generates one.</p>\",\
          \"idempotencyToken\":true\
        },\
        \"VolumeKmsKeyId\":{\
          \"shape\":\"KmsKeyId\",\
          \"documentation\":\"<p>ID for the KMS key that Amazon Comprehend uses to encrypt data on the storage volume attached to the ML compute instance(s) that process the analysis job. The VolumeKmsKeyId can be either of the following formats:</p> <ul> <li> <p>KMS Key ID: <code>\\\"1234abcd-12ab-34cd-56ef-1234567890ab\\\"</code> </p> </li> <li> <p>Amazon Resource Name (ARN) of a KMS Key: <code>\\\"arn:aws:kms:us-west-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab\\\"</code> </p> </li> </ul>\"\
        },\
        \"VpcConfig\":{\"shape\":\"VpcConfig\"},\
        \"Tags\":{\
          \"shape\":\"TagList\",\
          \"documentation\":\"<p>Tags to be associated with the targeted sentiment detection job. A tag is a key-value pair that adds metadata to a resource used by Amazon Comprehend. For example, a tag with \\\"Sales\\\" as the key might be added to a resource to indicate its use by the sales department.</p>\"\
        }\
      }\
    },\
    \"StartTargetedSentimentDetectionJobResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"JobId\":{\
          \"shape\":\"JobId\",\
          \"documentation\":\"<p>The identifier generated for the job. To get the status of a job, use this identifier with the operation.</p>\"\
        },\
        \"JobArn\":{\
          \"shape\":\"ComprehendArn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the targeted sentiment detection job. It is a unique, fully qualified identifier for the job. It includes the AWS account, Region, and the job ID. The format of the ARN is as follows:</p> <p> <code>arn:&lt;partition&gt;:comprehend:&lt;region&gt;:&lt;account-id&gt;:targeted-sentiment-detection-job/&lt;job-id&gt;</code> </p> <p>The following is an example job ARN:</p> <p> <code>arn:aws:comprehend:us-west-2:111122223333:targeted-sentiment-detection-job/1234abcd12ab34cd56ef1234567890ab</code> </p>\"\
        },\
        \"JobStatus\":{\
          \"shape\":\"JobStatus\",\
          \"documentation\":\"<p>The status of the job. </p> <ul> <li> <p>SUBMITTED - The job has been received and is queued for processing.</p> </li> <li> <p>IN_PROGRESS - Amazon Comprehend is processing the job.</p> </li> <li> <p>COMPLETED - The job was successfully completed and the output is available.</p> </li> <li> <p>FAILED - The job did not complete. To get details, use the operation.</p> </li> </ul>\"\
        }\
      }\
    },\
    \"StartTopicsDetectionJobRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"InputDataConfig\",\
        \"OutputDataConfig\",\
        \"DataAccessRoleArn\"\
      ],\
      \"members\":{\
        \"InputDataConfig\":{\
          \"shape\":\"InputDataConfig\",\
          \"documentation\":\"<p>Specifies the format and location of the input data for the job.</p>\"\
        },\
        \"OutputDataConfig\":{\
          \"shape\":\"OutputDataConfig\",\
          \"documentation\":\"<p>Specifies where to send the output files. The output is a compressed archive with two files, <code>topic-terms.csv</code> that lists the terms associated with each topic, and <code>doc-topics.csv</code> that lists the documents associated with each topic</p>\"\
        },\
        \"DataAccessRoleArn\":{\
          \"shape\":\"IamRoleArn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the AWS Identity and Access Management (IAM) role that grants Amazon Comprehend read access to your input data. For more information, see <a href=\\\"https://docs.aws.amazon.com/comprehend/latest/dg/access-control-managing-permissions.html#auth-role-permissions\\\">https://docs.aws.amazon.com/comprehend/latest/dg/access-control-managing-permissions.html#auth-role-permissions</a>.</p>\"\
        },\
        \"JobName\":{\
          \"shape\":\"JobName\",\
          \"documentation\":\"<p>The identifier of the job.</p>\"\
        },\
        \"NumberOfTopics\":{\
          \"shape\":\"NumberOfTopicsInteger\",\
          \"documentation\":\"<p>The number of topics to detect.</p>\"\
        },\
        \"ClientRequestToken\":{\
          \"shape\":\"ClientRequestTokenString\",\
          \"documentation\":\"<p>A unique identifier for the request. If you do not set the client request token, Amazon Comprehend generates one.</p>\",\
          \"idempotencyToken\":true\
        },\
        \"VolumeKmsKeyId\":{\
          \"shape\":\"KmsKeyId\",\
          \"documentation\":\"<p>ID for the AWS Key Management Service (KMS) key that Amazon Comprehend uses to encrypt data on the storage volume attached to the ML compute instance(s) that process the analysis job. The VolumeKmsKeyId can be either of the following formats:</p> <ul> <li> <p>KMS Key ID: <code>\\\"1234abcd-12ab-34cd-56ef-1234567890ab\\\"</code> </p> </li> <li> <p>Amazon Resource Name (ARN) of a KMS Key: <code>\\\"arn:aws:kms:us-west-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab\\\"</code> </p> </li> </ul>\"\
        },\
        \"VpcConfig\":{\
          \"shape\":\"VpcConfig\",\
          \"documentation\":\"<p>Configuration parameters for an optional private Virtual Private Cloud (VPC) containing the resources you are using for your topic detection job. For more information, see <a href=\\\"https://docs.aws.amazon.com/vpc/latest/userguide/what-is-amazon-vpc.html\\\">Amazon VPC</a>. </p>\"\
        },\
        \"Tags\":{\
          \"shape\":\"TagList\",\
          \"documentation\":\"<p>Tags to be associated with the topics detection job. A tag is a key-value pair that adds metadata to a resource used by Amazon Comprehend. For example, a tag with \\\"Sales\\\" as the key might be added to a resource to indicate its use by the sales department.</p>\"\
        }\
      }\
    },\
    \"StartTopicsDetectionJobResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"JobId\":{\
          \"shape\":\"JobId\",\
          \"documentation\":\"<p>The identifier generated for the job. To get the status of the job, use this identifier with the <code>DescribeTopicDetectionJob</code> operation.</p>\"\
        },\
        \"JobArn\":{\
          \"shape\":\"ComprehendArn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the topics detection job. It is a unique, fully qualified identifier for the job. It includes the AWS account, Region, and the job ID. The format of the ARN is as follows:</p> <p> <code>arn:&lt;partition&gt;:comprehend:&lt;region&gt;:&lt;account-id&gt;:topics-detection-job/&lt;job-id&gt;</code> </p> <p>The following is an example job ARN:</p> <p> <code>arn:aws:comprehend:us-west-2:111122223333:document-classification-job/1234abcd12ab34cd56ef1234567890ab</code> </p>\"\
        },\
        \"JobStatus\":{\
          \"shape\":\"JobStatus\",\
          \"documentation\":\"<p>The status of the job: </p> <ul> <li> <p>SUBMITTED - The job has been received and is queued for processing.</p> </li> <li> <p>IN_PROGRESS - Amazon Comprehend is processing the job.</p> </li> <li> <p>COMPLETED - The job was successfully completed and the output is available.</p> </li> <li> <p>FAILED - The job did not complete. To get details, use the <code>DescribeTopicDetectionJob</code> operation.</p> </li> </ul>\"\
        }\
      }\
    },\
    \"StopDominantLanguageDetectionJobRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"JobId\"],\
      \"members\":{\
        \"JobId\":{\
          \"shape\":\"JobId\",\
          \"documentation\":\"<p>The identifier of the dominant language detection job to stop.</p>\"\
        }\
      }\
    },\
    \"StopDominantLanguageDetectionJobResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"JobId\":{\
          \"shape\":\"JobId\",\
          \"documentation\":\"<p>The identifier of the dominant language detection job to stop.</p>\"\
        },\
        \"JobStatus\":{\
          \"shape\":\"JobStatus\",\
          \"documentation\":\"<p>Either <code>STOP_REQUESTED</code> if the job is currently running, or <code>STOPPED</code> if the job was previously stopped with the <code>StopDominantLanguageDetectionJob</code> operation.</p>\"\
        }\
      }\
    },\
    \"StopEntitiesDetectionJobRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"JobId\"],\
      \"members\":{\
        \"JobId\":{\
          \"shape\":\"JobId\",\
          \"documentation\":\"<p>The identifier of the entities detection job to stop.</p>\"\
        }\
      }\
    },\
    \"StopEntitiesDetectionJobResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"JobId\":{\
          \"shape\":\"JobId\",\
          \"documentation\":\"<p>The identifier of the entities detection job to stop.</p>\"\
        },\
        \"JobStatus\":{\
          \"shape\":\"JobStatus\",\
          \"documentation\":\"<p>Either <code>STOP_REQUESTED</code> if the job is currently running, or <code>STOPPED</code> if the job was previously stopped with the <code>StopEntitiesDetectionJob</code> operation.</p>\"\
        }\
      }\
    },\
    \"StopEventsDetectionJobRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"JobId\"],\
      \"members\":{\
        \"JobId\":{\
          \"shape\":\"JobId\",\
          \"documentation\":\"<p>The identifier of the events detection job to stop.</p>\"\
        }\
      }\
    },\
    \"StopEventsDetectionJobResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"JobId\":{\
          \"shape\":\"JobId\",\
          \"documentation\":\"<p>The identifier of the events detection job to stop.</p>\"\
        },\
        \"JobStatus\":{\
          \"shape\":\"JobStatus\",\
          \"documentation\":\"<p>The status of the events detection job.</p>\"\
        }\
      }\
    },\
    \"StopKeyPhrasesDetectionJobRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"JobId\"],\
      \"members\":{\
        \"JobId\":{\
          \"shape\":\"JobId\",\
          \"documentation\":\"<p>The identifier of the key phrases detection job to stop.</p>\"\
        }\
      }\
    },\
    \"StopKeyPhrasesDetectionJobResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"JobId\":{\
          \"shape\":\"JobId\",\
          \"documentation\":\"<p>The identifier of the key phrases detection job to stop.</p>\"\
        },\
        \"JobStatus\":{\
          \"shape\":\"JobStatus\",\
          \"documentation\":\"<p>Either <code>STOP_REQUESTED</code> if the job is currently running, or <code>STOPPED</code> if the job was previously stopped with the <code>StopKeyPhrasesDetectionJob</code> operation.</p>\"\
        }\
      }\
    },\
    \"StopPiiEntitiesDetectionJobRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"JobId\"],\
      \"members\":{\
        \"JobId\":{\
          \"shape\":\"JobId\",\
          \"documentation\":\"<p>The identifier of the PII entities detection job to stop.</p>\"\
        }\
      }\
    },\
    \"StopPiiEntitiesDetectionJobResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"JobId\":{\
          \"shape\":\"JobId\",\
          \"documentation\":\"<p>The identifier of the PII entities detection job to stop.</p>\"\
        },\
        \"JobStatus\":{\
          \"shape\":\"JobStatus\",\
          \"documentation\":\"<p>The status of the PII entities detection job.</p>\"\
        }\
      }\
    },\
    \"StopSentimentDetectionJobRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"JobId\"],\
      \"members\":{\
        \"JobId\":{\
          \"shape\":\"JobId\",\
          \"documentation\":\"<p>The identifier of the sentiment detection job to stop.</p>\"\
        }\
      }\
    },\
    \"StopSentimentDetectionJobResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"JobId\":{\
          \"shape\":\"JobId\",\
          \"documentation\":\"<p>The identifier of the sentiment detection job to stop.</p>\"\
        },\
        \"JobStatus\":{\
          \"shape\":\"JobStatus\",\
          \"documentation\":\"<p>Either <code>STOP_REQUESTED</code> if the job is currently running, or <code>STOPPED</code> if the job was previously stopped with the <code>StopSentimentDetectionJob</code> operation.</p>\"\
        }\
      }\
    },\
    \"StopTargetedSentimentDetectionJobRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"JobId\"],\
      \"members\":{\
        \"JobId\":{\
          \"shape\":\"JobId\",\
          \"documentation\":\"<p>The identifier of the targeted sentiment detection job to stop.</p>\"\
        }\
      }\
    },\
    \"StopTargetedSentimentDetectionJobResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"JobId\":{\
          \"shape\":\"JobId\",\
          \"documentation\":\"<p>The identifier of the targeted sentiment detection job to stop.</p>\"\
        },\
        \"JobStatus\":{\
          \"shape\":\"JobStatus\",\
          \"documentation\":\"<p>Either <code>STOP_REQUESTED</code> if the job is currently running, or <code>STOPPED</code> if the job was previously stopped with the <code>StopSentimentDetectionJob</code> operation.</p>\"\
        }\
      }\
    },\
    \"StopTrainingDocumentClassifierRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"DocumentClassifierArn\"],\
      \"members\":{\
        \"DocumentClassifierArn\":{\
          \"shape\":\"DocumentClassifierArn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) that identifies the document classifier currently being trained.</p>\"\
        }\
      }\
    },\
    \"StopTrainingDocumentClassifierResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
      }\
    },\
    \"StopTrainingEntityRecognizerRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"EntityRecognizerArn\"],\
      \"members\":{\
        \"EntityRecognizerArn\":{\
          \"shape\":\"EntityRecognizerArn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) that identifies the entity recognizer currently being trained.</p>\"\
        }\
      }\
    },\
    \"StopTrainingEntityRecognizerResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
      }\
    },\
    \"String\":{\
      \"type\":\"string\",\
      \"min\":1\
    },\
    \"StringList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"String\"}\
    },\
    \"SubnetId\":{\
      \"type\":\"string\",\
      \"max\":32,\
      \"min\":1,\
      \"pattern\":\"[-0-9a-zA-Z]+\"\
    },\
    \"Subnets\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"SubnetId\"},\
      \"max\":16,\
      \"min\":1\
    },\
    \"SyntaxLanguageCode\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"en\",\
        \"es\",\
        \"fr\",\
        \"de\",\
        \"it\",\
        \"pt\"\
      ]\
    },\
    \"SyntaxToken\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"TokenId\":{\
          \"shape\":\"Integer\",\
          \"documentation\":\"<p>A unique identifier for a token.</p>\"\
        },\
        \"Text\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The word that was recognized in the source text.</p>\"\
        },\
        \"BeginOffset\":{\
          \"shape\":\"Integer\",\
          \"documentation\":\"<p>The zero-based offset from the beginning of the source text to the first character in the word.</p>\"\
        },\
        \"EndOffset\":{\
          \"shape\":\"Integer\",\
          \"documentation\":\"<p>The zero-based offset from the beginning of the source text to the last character in the word.</p>\"\
        },\
        \"PartOfSpeech\":{\
          \"shape\":\"PartOfSpeechTag\",\
          \"documentation\":\"<p>Provides the part of speech label and the confidence level that Amazon Comprehend has that the part of speech was correctly identified. For more information, see <a href=\\\"https://docs.aws.amazon.com/comprehend/latest/dg/how-syntax.html\\\">Syntax</a> in the Comprehend Developer Guide. </p>\"\
        }\
      },\
      \"documentation\":\"<p>Represents a work in the input text that was recognized and assigned a part of speech. There is one syntax token record for each word in the source text.</p>\"\
    },\
    \"Tag\":{\
      \"type\":\"structure\",\
      \"required\":[\"Key\"],\
      \"members\":{\
        \"Key\":{\
          \"shape\":\"TagKey\",\
          \"documentation\":\"<p>The initial part of a key-value pair that forms a tag associated with a given resource. For instance, if you want to show which resources are used by which departments, you might use âDepartmentâ as the key portion of the pair, with multiple possible values such as âsales,â âlegal,â and âadministration.â </p>\"\
        },\
        \"Value\":{\
          \"shape\":\"TagValue\",\
          \"documentation\":\"<p> The second part of a key-value pair that forms a tag associated with a given resource. For instance, if you want to show which resources are used by which departments, you might use âDepartmentâ as the initial (key) portion of the pair, with a value of âsalesâ to indicate the sales department. </p>\"\
        }\
      },\
      \"documentation\":\"<p>A key-value pair that adds as a metadata to a resource used by Amazon Comprehend. For example, a tag with the key-value pair âDepartmentâ:âSalesâ might be added to a resource to indicate its use by a particular department. </p>\"\
    },\
    \"TagKey\":{\
      \"type\":\"string\",\
      \"max\":128,\
      \"min\":1\
    },\
    \"TagKeyList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"TagKey\"}\
    },\
    \"TagList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"Tag\"}\
    },\
    \"TagResourceRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"ResourceArn\",\
        \"Tags\"\
      ],\
      \"members\":{\
        \"ResourceArn\":{\
          \"shape\":\"ComprehendArn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the given Amazon Comprehend resource to which you want to associate the tags. </p>\"\
        },\
        \"Tags\":{\
          \"shape\":\"TagList\",\
          \"documentation\":\"<p>Tags being associated with a specific Amazon Comprehend resource. There can be a maximum of 50 tags (both existing and pending) associated with a specific resource. </p>\"\
        }\
      }\
    },\
    \"TagResourceResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
      }\
    },\
    \"TagValue\":{\
      \"type\":\"string\",\
      \"max\":256,\
      \"min\":0\
    },\
    \"TargetEventTypes\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"EventTypeString\"},\
      \"min\":1\
    },\
    \"TargetedSentimentDetectionJobFilter\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"JobName\":{\
          \"shape\":\"JobName\",\
          \"documentation\":\"<p>Filters on the name of the job.</p>\"\
        },\
        \"JobStatus\":{\
          \"shape\":\"JobStatus\",\
          \"documentation\":\"<p>Filters the list of jobs based on job status. Returns only jobs with the specified status.</p>\"\
        },\
        \"SubmitTimeBefore\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>Filters the list of jobs based on the time that the job was submitted for processing. Returns only jobs submitted before the specified time. Jobs are returned in ascending order, oldest to newest.</p>\"\
        },\
        \"SubmitTimeAfter\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>Filters the list of jobs based on the time that the job was submitted for processing. Returns only jobs submitted after the specified time. Jobs are returned in descending order, newest to oldest.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Provides information for filtering a list of dominant language detection jobs. For more information, see the operation.</p>\"\
    },\
    \"TargetedSentimentDetectionJobProperties\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"JobId\":{\
          \"shape\":\"JobId\",\
          \"documentation\":\"<p>The identifier assigned to the targeted sentiment detection job.</p>\"\
        },\
        \"JobArn\":{\
          \"shape\":\"ComprehendArn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the targeted sentiment detection job. It is a unique, fully qualified identifier for the job. It includes the AWS account, Region, and the job ID. The format of the ARN is as follows:</p> <p> <code>arn:&lt;partition&gt;:comprehend:&lt;region&gt;:&lt;account-id&gt;:targeted-sentiment-detection-job/&lt;job-id&gt;</code> </p> <p>The following is an example job ARN:</p> <p> <code>arn:aws:comprehend:us-west-2:111122223333:targeted-sentiment-detection-job/1234abcd12ab34cd56ef1234567890ab</code> </p>\"\
        },\
        \"JobName\":{\
          \"shape\":\"JobName\",\
          \"documentation\":\"<p>The name that you assigned to the targeted sentiment detection job.</p>\"\
        },\
        \"JobStatus\":{\
          \"shape\":\"JobStatus\",\
          \"documentation\":\"<p>The current status of the targeted sentiment detection job. If the status is <code>FAILED</code>, the <code>Messages</code> field shows the reason for the failure.</p>\"\
        },\
        \"Message\":{\
          \"shape\":\"AnyLengthString\",\
          \"documentation\":\"<p>A description of the status of a job.</p>\"\
        },\
        \"SubmitTime\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The time that the targeted sentiment detection job was submitted for processing.</p>\"\
        },\
        \"EndTime\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The time that the targeted sentiment detection job ended.</p>\"\
        },\
        \"InputDataConfig\":{\"shape\":\"InputDataConfig\"},\
        \"OutputDataConfig\":{\"shape\":\"OutputDataConfig\"},\
        \"LanguageCode\":{\
          \"shape\":\"LanguageCode\",\
          \"documentation\":\"<p>The language code of the input documents.</p>\"\
        },\
        \"DataAccessRoleArn\":{\
          \"shape\":\"IamRoleArn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) that gives Amazon Comprehend read access to your input data.</p>\"\
        },\
        \"VolumeKmsKeyId\":{\
          \"shape\":\"KmsKeyId\",\
          \"documentation\":\"<p>ID for the AWS Key Management Service (KMS) key that Amazon Comprehend uses to encrypt data on the storage volume attached to the ML compute instance(s) that process the targeted sentiment detection job. The VolumeKmsKeyId can be either of the following formats:</p> <ul> <li> <p>KMS Key ID: <code>\\\"1234abcd-12ab-34cd-56ef-1234567890ab\\\"</code> </p> </li> <li> <p>Amazon Resource Name (ARN) of a KMS Key: <code>\\\"arn:aws:kms:us-west-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab\\\"</code> </p> </li> </ul>\"\
        },\
        \"VpcConfig\":{\"shape\":\"VpcConfig\"}\
      },\
      \"documentation\":\"<p>Provides information about a targeted sentiment detection job.</p>\"\
    },\
    \"TargetedSentimentDetectionJobPropertiesList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"TargetedSentimentDetectionJobProperties\"}\
    },\
    \"TargetedSentimentEntity\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"DescriptiveMentionIndex\":{\
          \"shape\":\"ListOfDescriptiveMentionIndices\",\
          \"documentation\":\"<p>One or more index into the Mentions array that provides the best name for the entity group.</p>\"\
        },\
        \"Mentions\":{\
          \"shape\":\"ListOfMentions\",\
          \"documentation\":\"<p>An array of mentions of the entity in the document. The array represents a co-reference group. See <a href=\\\"https://docs.aws.amazon.com/comprehend/latest/dg/how-targeted-sentiment.html#how-targeted-sentiment-values\\\"> Co-reference group</a> for an example. </p>\"\
        }\
      },\
      \"documentation\":\"<p>Information about one of the entities found by targeted sentiment analysis.</p> <p>For more information about targeted sentiment, see <a href=\\\"https://docs.aws.amazon.com/comprehend/latest/dg/how-targeted-sentiment.html\\\">Targeted sentiment</a>.</p>\"\
    },\
    \"TargetedSentimentEntityType\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"PERSON\",\
        \"LOCATION\",\
        \"ORGANIZATION\",\
        \"FACILITY\",\
        \"BRAND\",\
        \"COMMERCIAL_ITEM\",\
        \"MOVIE\",\
        \"MUSIC\",\
        \"BOOK\",\
        \"SOFTWARE\",\
        \"GAME\",\
        \"PERSONAL_TITLE\",\
        \"EVENT\",\
        \"DATE\",\
        \"QUANTITY\",\
        \"ATTRIBUTE\",\
        \"OTHER\"\
      ]\
    },\
    \"TargetedSentimentMention\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Score\":{\
          \"shape\":\"Float\",\
          \"documentation\":\"<p>Model confidence that the entity is relevant. Value range is zero to one, where one is highest confidence.</p>\"\
        },\
        \"GroupScore\":{\
          \"shape\":\"Float\",\
          \"documentation\":\"<p>The confidence that all the entities mentioned in the group relate to the same entity.</p>\"\
        },\
        \"Text\":{\
          \"shape\":\"String\",\
          \"documentation\":\"<p>The text in the document that identifies the entity.</p>\"\
        },\
        \"Type\":{\
          \"shape\":\"TargetedSentimentEntityType\",\
          \"documentation\":\"<p>The type of the entity. Amazon Comprehend supports a variety of <a href=\\\"https://docs.aws.amazon.com/comprehend/latest/dg/how-targeted-sentiment.html#how-targeted-sentiment-entities\\\">entity types</a>.</p>\"\
        },\
        \"MentionSentiment\":{\
          \"shape\":\"MentionSentiment\",\
          \"documentation\":\"<p>Contains the sentiment and sentiment score for the mention.</p>\"\
        },\
        \"BeginOffset\":{\
          \"shape\":\"Integer\",\
          \"documentation\":\"<p>The offset into the document text where the mention begins.</p>\"\
        },\
        \"EndOffset\":{\
          \"shape\":\"Integer\",\
          \"documentation\":\"<p>The offset into the document text where the mention ends.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Information about one mention of an entity. The mention information includes the location of the mention in the text and the sentiment of the mention.</p> <p>For more information about targeted sentiment, see <a href=\\\"https://docs.aws.amazon.com/comprehend/latest/dg/how-targeted-sentiment.html\\\">Targeted sentiment</a>.</p>\"\
    },\
    \"TextSizeLimitExceededException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Message\":{\"shape\":\"String\"}\
      },\
      \"documentation\":\"<p>The size of the input text exceeds the limit. Use a smaller document.</p>\",\
      \"exception\":true\
    },\
    \"Timestamp\":{\"type\":\"timestamp\"},\
    \"TooManyRequestsException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Message\":{\"shape\":\"String\"}\
      },\
      \"documentation\":\"<p>The number of requests exceeds the limit. Resubmit your request later.</p>\",\
      \"exception\":true\
    },\
    \"TooManyTagKeysException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Message\":{\"shape\":\"String\"}\
      },\
      \"documentation\":\"<p>The request contains more tag keys than can be associated with a resource (50 tag keys per resource).</p>\",\
      \"exception\":true\
    },\
    \"TooManyTagsException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Message\":{\"shape\":\"String\"}\
      },\
      \"documentation\":\"<p>The request contains more tags than can be associated with a resource (50 tags per resource). The maximum number of tags includes both existing tags and those included in your current request. </p>\",\
      \"exception\":true\
    },\
    \"TopicsDetectionJobFilter\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"JobName\":{\
          \"shape\":\"JobName\",\
          \"documentation\":\"<p/>\"\
        },\
        \"JobStatus\":{\
          \"shape\":\"JobStatus\",\
          \"documentation\":\"<p>Filters the list of topic detection jobs based on job status. Returns only jobs with the specified status.</p>\"\
        },\
        \"SubmitTimeBefore\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>Filters the list of jobs based on the time that the job was submitted for processing. Only returns jobs submitted before the specified time. Jobs are returned in descending order, newest to oldest.</p>\"\
        },\
        \"SubmitTimeAfter\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>Filters the list of jobs based on the time that the job was submitted for processing. Only returns jobs submitted after the specified time. Jobs are returned in ascending order, oldest to newest.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Provides information for filtering topic detection jobs. For more information, see .</p>\"\
    },\
    \"TopicsDetectionJobProperties\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"JobId\":{\
          \"shape\":\"JobId\",\
          \"documentation\":\"<p>The identifier assigned to the topic detection job.</p>\"\
        },\
        \"JobArn\":{\
          \"shape\":\"ComprehendArn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the topics detection job. It is a unique, fully qualified identifier for the job. It includes the AWS account, Region, and the job ID. The format of the ARN is as follows:</p> <p> <code>arn:&lt;partition&gt;:comprehend:&lt;region&gt;:&lt;account-id&gt;:topics-detection-job/&lt;job-id&gt;</code> </p> <p>The following is an example job ARN:</p> <p> <code>arn:aws:comprehend:us-west-2:111122223333:topics-detection-job/1234abcd12ab34cd56ef1234567890ab</code> </p>\"\
        },\
        \"JobName\":{\
          \"shape\":\"JobName\",\
          \"documentation\":\"<p>The name of the topic detection job.</p>\"\
        },\
        \"JobStatus\":{\
          \"shape\":\"JobStatus\",\
          \"documentation\":\"<p>The current status of the topic detection job. If the status is <code>Failed</code>, the reason for the failure is shown in the <code>Message</code> field.</p>\"\
        },\
        \"Message\":{\
          \"shape\":\"AnyLengthString\",\
          \"documentation\":\"<p>A description for the status of a job.</p>\"\
        },\
        \"SubmitTime\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The time that the topic detection job was submitted for processing.</p>\"\
        },\
        \"EndTime\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The time that the topic detection job was completed.</p>\"\
        },\
        \"InputDataConfig\":{\
          \"shape\":\"InputDataConfig\",\
          \"documentation\":\"<p>The input data configuration supplied when you created the topic detection job.</p>\"\
        },\
        \"OutputDataConfig\":{\
          \"shape\":\"OutputDataConfig\",\
          \"documentation\":\"<p>The output data configuration supplied when you created the topic detection job.</p>\"\
        },\
        \"NumberOfTopics\":{\
          \"shape\":\"Integer\",\
          \"documentation\":\"<p>The number of topics to detect supplied when you created the topic detection job. The default is 10. </p>\"\
        },\
        \"DataAccessRoleArn\":{\
          \"shape\":\"IamRoleArn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the AWS Identity and Management (IAM) role that grants Amazon Comprehend read access to your job data. </p>\"\
        },\
        \"VolumeKmsKeyId\":{\
          \"shape\":\"KmsKeyId\",\
          \"documentation\":\"<p>ID for the AWS Key Management Service (KMS) key that Amazon Comprehend uses to encrypt data on the storage volume attached to the ML compute instance(s) that process the analysis job. The VolumeKmsKeyId can be either of the following formats:</p> <ul> <li> <p>KMS Key ID: <code>\\\"1234abcd-12ab-34cd-56ef-1234567890ab\\\"</code> </p> </li> <li> <p>Amazon Resource Name (ARN) of a KMS Key: <code>\\\"arn:aws:kms:us-west-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab\\\"</code> </p> </li> </ul>\"\
        },\
        \"VpcConfig\":{\
          \"shape\":\"VpcConfig\",\
          \"documentation\":\"<p>Configuration parameters for a private Virtual Private Cloud (VPC) containing the resources you are using for your topic detection job. For more information, see <a href=\\\"https://docs.aws.amazon.com/vpc/latest/userguide/what-is-amazon-vpc.html\\\">Amazon VPC</a>. </p>\"\
        }\
      },\
      \"documentation\":\"<p>Provides information about a topic detection job.</p>\"\
    },\
    \"TopicsDetectionJobPropertiesList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"TopicsDetectionJobProperties\"}\
    },\
    \"UnsupportedLanguageException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"Message\":{\"shape\":\"String\"}\
      },\
      \"documentation\":\"<p>Amazon Comprehend can't process the language of the input text. For custom entity recognition APIs, only English, Spanish, French, Italian, German, or Portuguese are accepted. For a list of supported languages, <a href=\\\"https://docs.aws.amazon.com/comprehend/latest/dg/supported-languages.html\\\">Supported languages</a> in the Comprehend Developer Guide. </p>\",\
      \"exception\":true\
    },\
    \"UntagResourceRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"ResourceArn\",\
        \"TagKeys\"\
      ],\
      \"members\":{\
        \"ResourceArn\":{\
          \"shape\":\"ComprehendArn\",\
          \"documentation\":\"<p> The Amazon Resource Name (ARN) of the given Amazon Comprehend resource from which you want to remove the tags. </p>\"\
        },\
        \"TagKeys\":{\
          \"shape\":\"TagKeyList\",\
          \"documentation\":\"<p>The initial part of a key-value pair that forms a tag being removed from a given resource. For example, a tag with \\\"Sales\\\" as the key might be added to a resource to indicate its use by the sales department. Keys must be unique and cannot be duplicated for a particular resource. </p>\"\
        }\
      }\
    },\
    \"UntagResourceResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
      }\
    },\
    \"UpdateEndpointRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"EndpointArn\"],\
      \"members\":{\
        \"EndpointArn\":{\
          \"shape\":\"ComprehendEndpointArn\",\
          \"documentation\":\"<p>The Amazon Resource Number (ARN) of the endpoint being updated.</p>\"\
        },\
        \"DesiredModelArn\":{\
          \"shape\":\"ComprehendModelArn\",\
          \"documentation\":\"<p>The ARN of the new model to use when updating an existing endpoint.</p>\"\
        },\
        \"DesiredInferenceUnits\":{\
          \"shape\":\"InferenceUnitsInteger\",\
          \"documentation\":\"<p> The desired number of inference units to be used by the model using this endpoint. Each inference unit represents of a throughput of 100 characters per second.</p>\"\
        },\
        \"DesiredDataAccessRoleArn\":{\
          \"shape\":\"IamRoleArn\",\
          \"documentation\":\"<p>Data access role ARN to use in case the new model is encrypted with a customer CMK.</p>\"\
        }\
      }\
    },\
    \"UpdateEndpointResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
      }\
    },\
    \"VersionName\":{\
      \"type\":\"string\",\
      \"max\":63,\
      \"pattern\":\"^[a-zA-Z0-9](-*[a-zA-Z0-9])*$\"\
    },\
    \"VpcConfig\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"SecurityGroupIds\",\
        \"Subnets\"\
      ],\
      \"members\":{\
        \"SecurityGroupIds\":{\
          \"shape\":\"SecurityGroupIds\",\
          \"documentation\":\"<p>The ID number for a security group on an instance of your private VPC. Security groups on your VPC function serve as a virtual firewall to control inbound and outbound traffic and provides security for the resources that youâll be accessing on the VPC. This ID number is preceded by \\\"sg-\\\", for instance: \\\"sg-03b388029b0a285ea\\\". For more information, see <a href=\\\"https://docs.aws.amazon.com/vpc/latest/userguide/VPC_SecurityGroups.html\\\">Security Groups for your VPC</a>. </p>\"\
        },\
        \"Subnets\":{\
          \"shape\":\"Subnets\",\
          \"documentation\":\"<p>The ID for each subnet being used in your private VPC. This subnet is a subset of the a range of IPv4 addresses used by the VPC and is specific to a given availability zone in the VPCâs region. This ID number is preceded by \\\"subnet-\\\", for instance: \\\"subnet-04ccf456919e69055\\\". For more information, see <a href=\\\"https://docs.aws.amazon.com/vpc/latest/userguide/VPC_Subnets.html\\\">VPCs and Subnets</a>. </p>\"\
        }\
      },\
      \"documentation\":\"<p> Configuration parameters for an optional private Virtual Private Cloud (VPC) containing the resources you are using for the job. For more information, see <a href=\\\"https://docs.aws.amazon.com/vpc/latest/userguide/what-is-amazon-vpc.html\\\">Amazon VPC</a>. </p>\"\
    }\
  },\
  \"documentation\":\"<p>Amazon Comprehend is an AWS service for gaining insight into the content of documents. Use these actions to determine the topics contained in your documents, the topics they discuss, the predominant sentiment expressed in them, the predominant language used, and more.</p>\"\
}\
";
}

@end
