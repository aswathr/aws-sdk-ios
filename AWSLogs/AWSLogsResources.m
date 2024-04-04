//
// Copyright 2010-2024 Amazon.com, Inc. or its affiliates. All Rights Reserved.
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

#import "AWSLogsResources.h"
#import <AWSCore/AWSCocoaLumberjack.h>

@interface AWSLogsResources ()

@property (nonatomic, strong) NSDictionary *definitionDictionary;

@end

@implementation AWSLogsResources

+ (instancetype)sharedInstance {
    static AWSLogsResources *_sharedResources = nil;
    static dispatch_once_t once_token;

    dispatch_once(&once_token, ^{
        _sharedResources = [AWSLogsResources new];
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
    \"apiVersion\":\"2014-03-28\",\
    \"endpointPrefix\":\"logs\",\
    \"jsonVersion\":\"1.1\",\
    \"protocol\":\"json\",\
    \"serviceFullName\":\"Amazon CloudWatch Logs\",\
    \"serviceId\":\"CloudWatch Logs\",\
    \"signatureVersion\":\"v4\",\
    \"targetPrefix\":\"Logs_20140328\",\
    \"uid\":\"logs-2014-03-28\"\
  },\
  \"operations\":{\
    \"AssociateKmsKey\":{\
      \"name\":\"AssociateKmsKey\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"AssociateKmsKeyRequest\"},\
      \"errors\":[\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"OperationAbortedException\"},\
        {\"shape\":\"ServiceUnavailableException\"}\
      ],\
      \"documentation\":\"<p>Associates the specified KMS key with either one log group in the account, or with all stored CloudWatch Logs query insights results in the account.</p> <p>When you use <code>AssociateKmsKey</code>, you specify either the <code>logGroupName</code> parameter or the <code>resourceIdentifier</code> parameter. You can't specify both of those parameters in the same operation.</p> <ul> <li> <p>Specify the <code>logGroupName</code> parameter to cause all log events stored in the log group to be encrypted with that key. Only the log events ingested after the key is associated are encrypted with that key.</p> <p>Associating a KMS key with a log group overrides any existing associations between the log group and a KMS key. After a KMS key is associated with a log group, all newly ingested data for the log group is encrypted using the KMS key. This association is stored as long as the data encrypted with the KMS key is still within CloudWatch Logs. This enables CloudWatch Logs to decrypt this data whenever it is requested.</p> <p>Associating a key with a log group does not cause the results of queries of that log group to be encrypted with that key. To have query results encrypted with a KMS key, you must use an <code>AssociateKmsKey</code> operation with the <code>resourceIdentifier</code> parameter that specifies a <code>query-result</code> resource. </p> </li> <li> <p>Specify the <code>resourceIdentifier</code> parameter with a <code>query-result</code> resource, to use that key to encrypt the stored results of all future <a href=\\\"https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_StartQuery.html\\\">StartQuery</a> operations in the account. The response from a <a href=\\\"https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_GetQueryResults.html\\\">GetQueryResults</a> operation will still return the query results in plain text.</p> <p>Even if you have not associated a key with your query results, the query results are encrypted when stored, using the default CloudWatch Logs method.</p> <p>If you run a query from a monitoring account that queries logs in a source account, the query results key from the monitoring account, if any, is used.</p> </li> </ul> <important> <p>If you delete the key that is used to encrypt log events or log group query results, then all the associated stored log events or query results that were encrypted with that key will be unencryptable and unusable.</p> </important> <note> <p>CloudWatch Logs supports only symmetric KMS keys. Do not use an associate an asymmetric KMS key with your log group or query results. For more information, see <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/symmetric-asymmetric.html\\\">Using Symmetric and Asymmetric Keys</a>.</p> </note> <p>It can take up to 5 minutes for this operation to take effect.</p> <p>If you attempt to associate a KMS key with a log group but the KMS key does not exist or the KMS key is disabled, you receive an <code>InvalidParameterException</code> error. </p>\"\
    },\
    \"CancelExportTask\":{\
      \"name\":\"CancelExportTask\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"CancelExportTaskRequest\"},\
      \"errors\":[\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InvalidOperationException\"},\
        {\"shape\":\"ServiceUnavailableException\"}\
      ],\
      \"documentation\":\"<p>Cancels the specified export task.</p> <p>The task must be in the <code>PENDING</code> or <code>RUNNING</code> state.</p>\"\
    },\
    \"CreateDelivery\":{\
      \"name\":\"CreateDelivery\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"CreateDeliveryRequest\"},\
      \"output\":{\"shape\":\"CreateDeliveryResponse\"},\
      \"errors\":[\
        {\"shape\":\"ServiceUnavailableException\"},\
        {\"shape\":\"ConflictException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ValidationException\"},\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"ServiceQuotaExceededException\"},\
        {\"shape\":\"ThrottlingException\"}\
      ],\
      \"documentation\":\"<p>Creates a <i>delivery</i>. A delivery is a connection between a logical <i>delivery source</i> and a logical <i>delivery destination</i> that you have already created.</p> <p>Only some Amazon Web Services services support being configured as a delivery source using this operation. These services are listed as <b>Supported [V2 Permissions]</b> in the table at <a href=\\\"https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/AWS-logs-and-resource-policy.html\\\">Enabling logging from Amazon Web Services services.</a> </p> <p>A delivery destination can represent a log group in CloudWatch Logs, an Amazon S3 bucket, or a delivery stream in Firehose.</p> <p>To configure logs delivery between a supported Amazon Web Services service and a destination, you must do the following:</p> <ul> <li> <p>Create a delivery source, which is a logical object that represents the resource that is actually sending the logs. For more information, see <a href=\\\"https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_PutDeliverySource.html\\\">PutDeliverySource</a>.</p> </li> <li> <p>Create a <i>delivery destination</i>, which is a logical object that represents the actual delivery destination. For more information, see <a href=\\\"https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_PutDeliveryDestination.html\\\">PutDeliveryDestination</a>.</p> </li> <li> <p>If you are delivering logs cross-account, you must use <a href=\\\"https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_PutDeliveryDestinationPolicy.html\\\">PutDeliveryDestinationPolicy</a> in the destination account to assign an IAM policy to the destination. This policy allows delivery to that destination. </p> </li> <li> <p>Use <code>CreateDelivery</code> to create a <i>delivery</i> by pairing exactly one delivery source and one delivery destination. </p> </li> </ul> <p>You can configure a single delivery source to send logs to multiple destinations by creating multiple deliveries. You can also create multiple deliveries to configure multiple delivery sources to send logs to the same delivery destination.</p> <p>You can't update an existing delivery. You can only create and delete deliveries.</p>\"\
    },\
    \"CreateExportTask\":{\
      \"name\":\"CreateExportTask\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"CreateExportTaskRequest\"},\
      \"output\":{\"shape\":\"CreateExportTaskResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"LimitExceededException\"},\
        {\"shape\":\"OperationAbortedException\"},\
        {\"shape\":\"ServiceUnavailableException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ResourceAlreadyExistsException\"}\
      ],\
      \"documentation\":\"<p>Creates an export task so that you can efficiently export data from a log group to an Amazon S3 bucket. When you perform a <code>CreateExportTask</code> operation, you must use credentials that have permission to write to the S3 bucket that you specify as the destination.</p> <p>Exporting log data to S3 buckets that are encrypted by KMS is supported. Exporting log data to Amazon S3 buckets that have S3 Object Lock enabled with a retention period is also supported.</p> <p>Exporting to S3 buckets that are encrypted with AES-256 is supported. </p> <p>This is an asynchronous call. If all the required information is provided, this operation initiates an export task and responds with the ID of the task. After the task has started, you can use <a href=\\\"https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_DescribeExportTasks.html\\\">DescribeExportTasks</a> to get the status of the export task. Each account can only have one active (<code>RUNNING</code> or <code>PENDING</code>) export task at a time. To cancel an export task, use <a href=\\\"https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_CancelExportTask.html\\\">CancelExportTask</a>.</p> <p>You can export logs from multiple log groups or multiple time ranges to the same S3 bucket. To separate log data for each export task, specify a prefix to be used as the Amazon S3 key prefix for all exported objects.</p> <note> <p>Time-based sorting on chunks of log data inside an exported file is not guaranteed. You can sort the exported log field data by using Linux utilities.</p> </note>\"\
    },\
    \"CreateLogAnomalyDetector\":{\
      \"name\":\"CreateLogAnomalyDetector\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"CreateLogAnomalyDetectorRequest\"},\
      \"output\":{\"shape\":\"CreateLogAnomalyDetectorResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ServiceUnavailableException\"},\
        {\"shape\":\"OperationAbortedException\"},\
        {\"shape\":\"LimitExceededException\"}\
      ],\
      \"documentation\":\"<p>Creates an <i>anomaly detector</i> that regularly scans one or more log groups and look for patterns and anomalies in the logs.</p> <p>An anomaly detector can help surface issues by automatically discovering anomalies in your log event traffic. An anomaly detector uses machine learning algorithms to scan log events and find <i>patterns</i>. A pattern is a shared text structure that recurs among your log fields. Patterns provide a useful tool for analyzing large sets of logs because a large number of log events can often be compressed into a few patterns.</p> <p>The anomaly detector uses pattern recognition to find <code>anomalies</code>, which are unusual log events. It uses the <code>evaluationFrequency</code> to compare current log events and patterns with trained baselines. </p> <p>Fields within a pattern are called <i>tokens</i>. Fields that vary within a pattern, such as a request ID or timestamp, are referred to as <i>dynamic tokens</i> and represented by <code>&lt;*&gt;</code>. </p> <p>The following is an example of a pattern:</p> <p> <code>[INFO] Request time: &lt;*&gt; ms</code> </p> <p>This pattern represents log events like <code>[INFO] Request time: 327 ms</code> and other similar log events that differ only by the number, in this csse 327. When the pattern is displayed, the different numbers are replaced by <code>&lt;*&gt;</code> </p> <note> <p>Any parts of log events that are masked as sensitive data are not scanned for anomalies. For more information about masking sensitive data, see <a href=\\\"https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/mask-sensitive-log-data.html\\\">Help protect sensitive log data with masking</a>. </p> </note>\"\
    },\
    \"CreateLogGroup\":{\
      \"name\":\"CreateLogGroup\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"CreateLogGroupRequest\"},\
      \"errors\":[\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ResourceAlreadyExistsException\"},\
        {\"shape\":\"LimitExceededException\"},\
        {\"shape\":\"OperationAbortedException\"},\
        {\"shape\":\"ServiceUnavailableException\"}\
      ],\
      \"documentation\":\"<p>Creates a log group with the specified name. You can create up to 1,000,000 log groups per Region per account.</p> <p>You must use the following guidelines when naming a log group:</p> <ul> <li> <p>Log group names must be unique within a Region for an Amazon Web Services account.</p> </li> <li> <p>Log group names can be between 1 and 512 characters long.</p> </li> <li> <p>Log group names consist of the following characters: a-z, A-Z, 0-9, '_' (underscore), '-' (hyphen), '/' (forward slash), '.' (period), and '#' (number sign)</p> </li> <li> <p>Log group names can't start with the string <code>aws/</code> </p> </li> </ul> <p>When you create a log group, by default the log events in the log group do not expire. To set a retention policy so that events expire and are deleted after a specified time, use <a href=\\\"https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_PutRetentionPolicy.html\\\">PutRetentionPolicy</a>.</p> <p>If you associate an KMS key with the log group, ingested data is encrypted using the KMS key. This association is stored as long as the data encrypted with the KMS key is still within CloudWatch Logs. This enables CloudWatch Logs to decrypt this data whenever it is requested.</p> <p>If you attempt to associate a KMS key with the log group but the KMS key does not exist or the KMS key is disabled, you receive an <code>InvalidParameterException</code> error. </p> <important> <p>CloudWatch Logs supports only symmetric KMS keys. Do not associate an asymmetric KMS key with your log group. For more information, see <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/symmetric-asymmetric.html\\\">Using Symmetric and Asymmetric Keys</a>.</p> </important>\"\
    },\
    \"CreateLogStream\":{\
      \"name\":\"CreateLogStream\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"CreateLogStreamRequest\"},\
      \"errors\":[\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ResourceAlreadyExistsException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ServiceUnavailableException\"}\
      ],\
      \"documentation\":\"<p>Creates a log stream for the specified log group. A log stream is a sequence of log events that originate from a single source, such as an application instance or a resource that is being monitored.</p> <p>There is no limit on the number of log streams that you can create for a log group. There is a limit of 50 TPS on <code>CreateLogStream</code> operations, after which transactions are throttled.</p> <p>You must use the following guidelines when naming a log stream:</p> <ul> <li> <p>Log stream names must be unique within the log group.</p> </li> <li> <p>Log stream names can be between 1 and 512 characters long.</p> </li> <li> <p>Don't use ':' (colon) or '*' (asterisk) characters.</p> </li> </ul>\"\
    },\
    \"DeleteAccountPolicy\":{\
      \"name\":\"DeleteAccountPolicy\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DeleteAccountPolicyRequest\"},\
      \"errors\":[\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ServiceUnavailableException\"},\
        {\"shape\":\"OperationAbortedException\"}\
      ],\
      \"documentation\":\"<p>Deletes a CloudWatch Logs account policy. This stops the policy from applying to all log groups or a subset of log groups in the account. Log-group level policies will still be in effect.</p> <p>To use this operation, you must be signed on with the correct permissions depending on the type of policy that you are deleting.</p> <ul> <li> <p>To delete a data protection policy, you must have the <code>logs:DeleteDataProtectionPolicy</code> and <code>logs:DeleteAccountPolicy</code> permissions.</p> </li> <li> <p>To delete a subscription filter policy, you must have the <code>logs:DeleteSubscriptionFilter</code> and <code>logs:DeleteAccountPolicy</code> permissions.</p> </li> </ul>\"\
    },\
    \"DeleteDataProtectionPolicy\":{\
      \"name\":\"DeleteDataProtectionPolicy\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DeleteDataProtectionPolicyRequest\"},\
      \"errors\":[\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"OperationAbortedException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ServiceUnavailableException\"}\
      ],\
      \"documentation\":\"<p>Deletes the data protection policy from the specified log group. </p> <p>For more information about data protection policies, see <a href=\\\"https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_PutDataProtectionPolicy.html\\\">PutDataProtectionPolicy</a>.</p>\"\
    },\
    \"DeleteDelivery\":{\
      \"name\":\"DeleteDelivery\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DeleteDeliveryRequest\"},\
      \"errors\":[\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ServiceUnavailableException\"},\
        {\"shape\":\"ConflictException\"},\
        {\"shape\":\"ValidationException\"},\
        {\"shape\":\"ServiceQuotaExceededException\"},\
        {\"shape\":\"ThrottlingException\"}\
      ],\
      \"documentation\":\"<p>Deletes s <i>delivery</i>. A delivery is a connection between a logical <i>delivery source</i> and a logical <i>delivery destination</i>. Deleting a delivery only deletes the connection between the delivery source and delivery destination. It does not delete the delivery destination or the delivery source.</p>\"\
    },\
    \"DeleteDeliveryDestination\":{\
      \"name\":\"DeleteDeliveryDestination\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DeleteDeliveryDestinationRequest\"},\
      \"errors\":[\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ServiceUnavailableException\"},\
        {\"shape\":\"ConflictException\"},\
        {\"shape\":\"ValidationException\"},\
        {\"shape\":\"ServiceQuotaExceededException\"},\
        {\"shape\":\"ThrottlingException\"}\
      ],\
      \"documentation\":\"<p>Deletes a <i>delivery destination</i>. A delivery is a connection between a logical <i>delivery source</i> and a logical <i>delivery destination</i>.</p> <p>You can't delete a delivery destination if any current deliveries are associated with it. To find whether any deliveries are associated with this delivery destination, use the <a href=\\\"https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_DescribeDeliveries.html\\\">DescribeDeliveries</a> operation and check the <code>deliveryDestinationArn</code> field in the results.</p>\"\
    },\
    \"DeleteDeliveryDestinationPolicy\":{\
      \"name\":\"DeleteDeliveryDestinationPolicy\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DeleteDeliveryDestinationPolicyRequest\"},\
      \"errors\":[\
        {\"shape\":\"ServiceUnavailableException\"},\
        {\"shape\":\"ValidationException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ConflictException\"}\
      ],\
      \"documentation\":\"<p>Deletes a delivery destination policy. For more information about these policies, see <a href=\\\"https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_PutDeliveryDestinationPolicy.html\\\">PutDeliveryDestinationPolicy</a>.</p>\"\
    },\
    \"DeleteDeliverySource\":{\
      \"name\":\"DeleteDeliverySource\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DeleteDeliverySourceRequest\"},\
      \"errors\":[\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ServiceUnavailableException\"},\
        {\"shape\":\"ConflictException\"},\
        {\"shape\":\"ValidationException\"},\
        {\"shape\":\"ServiceQuotaExceededException\"},\
        {\"shape\":\"ThrottlingException\"}\
      ],\
      \"documentation\":\"<p>Deletes a <i>delivery source</i>. A delivery is a connection between a logical <i>delivery source</i> and a logical <i>delivery destination</i>.</p> <p>You can't delete a delivery source if any current deliveries are associated with it. To find whether any deliveries are associated with this delivery source, use the <a href=\\\"https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_DescribeDeliveries.html\\\">DescribeDeliveries</a> operation and check the <code>deliverySourceName</code> field in the results.</p>\"\
    },\
    \"DeleteDestination\":{\
      \"name\":\"DeleteDestination\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DeleteDestinationRequest\"},\
      \"errors\":[\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"OperationAbortedException\"},\
        {\"shape\":\"ServiceUnavailableException\"}\
      ],\
      \"documentation\":\"<p>Deletes the specified destination, and eventually disables all the subscription filters that publish to it. This operation does not delete the physical resource encapsulated by the destination.</p>\"\
    },\
    \"DeleteLogAnomalyDetector\":{\
      \"name\":\"DeleteLogAnomalyDetector\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DeleteLogAnomalyDetectorRequest\"},\
      \"errors\":[\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ServiceUnavailableException\"},\
        {\"shape\":\"OperationAbortedException\"}\
      ],\
      \"documentation\":\"<p>Deletes the specified CloudWatch Logs anomaly detector.</p>\"\
    },\
    \"DeleteLogGroup\":{\
      \"name\":\"DeleteLogGroup\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DeleteLogGroupRequest\"},\
      \"errors\":[\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"OperationAbortedException\"},\
        {\"shape\":\"ServiceUnavailableException\"}\
      ],\
      \"documentation\":\"<p>Deletes the specified log group and permanently deletes all the archived log events associated with the log group.</p>\"\
    },\
    \"DeleteLogStream\":{\
      \"name\":\"DeleteLogStream\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DeleteLogStreamRequest\"},\
      \"errors\":[\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"OperationAbortedException\"},\
        {\"shape\":\"ServiceUnavailableException\"}\
      ],\
      \"documentation\":\"<p>Deletes the specified log stream and permanently deletes all the archived log events associated with the log stream.</p>\"\
    },\
    \"DeleteMetricFilter\":{\
      \"name\":\"DeleteMetricFilter\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DeleteMetricFilterRequest\"},\
      \"errors\":[\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"OperationAbortedException\"},\
        {\"shape\":\"ServiceUnavailableException\"}\
      ],\
      \"documentation\":\"<p>Deletes the specified metric filter.</p>\"\
    },\
    \"DeleteQueryDefinition\":{\
      \"name\":\"DeleteQueryDefinition\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DeleteQueryDefinitionRequest\"},\
      \"output\":{\"shape\":\"DeleteQueryDefinitionResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ServiceUnavailableException\"}\
      ],\
      \"documentation\":\"<p>Deletes a saved CloudWatch Logs Insights query definition. A query definition contains details about a saved CloudWatch Logs Insights query.</p> <p>Each <code>DeleteQueryDefinition</code> operation can delete one query definition.</p> <p>You must have the <code>logs:DeleteQueryDefinition</code> permission to be able to perform this operation.</p>\"\
    },\
    \"DeleteResourcePolicy\":{\
      \"name\":\"DeleteResourcePolicy\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DeleteResourcePolicyRequest\"},\
      \"errors\":[\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ServiceUnavailableException\"}\
      ],\
      \"documentation\":\"<p>Deletes a resource policy from this account. This revokes the access of the identities in that policy to put log events to this account.</p>\"\
    },\
    \"DeleteRetentionPolicy\":{\
      \"name\":\"DeleteRetentionPolicy\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DeleteRetentionPolicyRequest\"},\
      \"errors\":[\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"OperationAbortedException\"},\
        {\"shape\":\"ServiceUnavailableException\"}\
      ],\
      \"documentation\":\"<p>Deletes the specified retention policy.</p> <p>Log events do not expire if they belong to log groups without a retention policy.</p>\"\
    },\
    \"DeleteSubscriptionFilter\":{\
      \"name\":\"DeleteSubscriptionFilter\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DeleteSubscriptionFilterRequest\"},\
      \"errors\":[\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"OperationAbortedException\"},\
        {\"shape\":\"ServiceUnavailableException\"}\
      ],\
      \"documentation\":\"<p>Deletes the specified subscription filter.</p>\"\
    },\
    \"DescribeAccountPolicies\":{\
      \"name\":\"DescribeAccountPolicies\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DescribeAccountPoliciesRequest\"},\
      \"output\":{\"shape\":\"DescribeAccountPoliciesResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"OperationAbortedException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ServiceUnavailableException\"}\
      ],\
      \"documentation\":\"<p>Returns a list of all CloudWatch Logs account policies in the account.</p>\"\
    },\
    \"DescribeDeliveries\":{\
      \"name\":\"DescribeDeliveries\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DescribeDeliveriesRequest\"},\
      \"output\":{\"shape\":\"DescribeDeliveriesResponse\"},\
      \"errors\":[\
        {\"shape\":\"ServiceUnavailableException\"},\
        {\"shape\":\"ServiceQuotaExceededException\"},\
        {\"shape\":\"ValidationException\"},\
        {\"shape\":\"ThrottlingException\"}\
      ],\
      \"documentation\":\"<p>Retrieves a list of the deliveries that have been created in the account.</p> <p>A <i>delivery</i> is a connection between a <a href=\\\"https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_PutDeliverySource.html\\\"> <i>delivery source</i> </a> and a <a href=\\\"https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_PutDeliveryDestination.html\\\"> <i>delivery destination</i> </a>.</p> <p>A delivery source represents an Amazon Web Services resource that sends logs to an logs delivery destination. The destination can be CloudWatch Logs, Amazon S3, or Firehose. Only some Amazon Web Services services support being configured as a delivery source. These services are listed in <a href=\\\"https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/AWS-logs-and-resource-policy.html\\\">Enable logging from Amazon Web Services services.</a> </p>\"\
    },\
    \"DescribeDeliveryDestinations\":{\
      \"name\":\"DescribeDeliveryDestinations\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DescribeDeliveryDestinationsRequest\"},\
      \"output\":{\"shape\":\"DescribeDeliveryDestinationsResponse\"},\
      \"errors\":[\
        {\"shape\":\"ServiceUnavailableException\"},\
        {\"shape\":\"ServiceQuotaExceededException\"},\
        {\"shape\":\"ValidationException\"},\
        {\"shape\":\"ThrottlingException\"}\
      ],\
      \"documentation\":\"<p>Retrieves a list of the delivery destinations that have been created in the account.</p>\"\
    },\
    \"DescribeDeliverySources\":{\
      \"name\":\"DescribeDeliverySources\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DescribeDeliverySourcesRequest\"},\
      \"output\":{\"shape\":\"DescribeDeliverySourcesResponse\"},\
      \"errors\":[\
        {\"shape\":\"ServiceUnavailableException\"},\
        {\"shape\":\"ServiceQuotaExceededException\"},\
        {\"shape\":\"ValidationException\"},\
        {\"shape\":\"ThrottlingException\"}\
      ],\
      \"documentation\":\"<p>Retrieves a list of the delivery sources that have been created in the account.</p>\"\
    },\
    \"DescribeDestinations\":{\
      \"name\":\"DescribeDestinations\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DescribeDestinationsRequest\"},\
      \"output\":{\"shape\":\"DescribeDestinationsResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ServiceUnavailableException\"}\
      ],\
      \"documentation\":\"<p>Lists all your destinations. The results are ASCII-sorted by destination name.</p>\"\
    },\
    \"DescribeExportTasks\":{\
      \"name\":\"DescribeExportTasks\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DescribeExportTasksRequest\"},\
      \"output\":{\"shape\":\"DescribeExportTasksResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ServiceUnavailableException\"}\
      ],\
      \"documentation\":\"<p>Lists the specified export tasks. You can list all your export tasks or filter the results based on task ID or task status.</p>\"\
    },\
    \"DescribeLogGroups\":{\
      \"name\":\"DescribeLogGroups\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DescribeLogGroupsRequest\"},\
      \"output\":{\"shape\":\"DescribeLogGroupsResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ServiceUnavailableException\"}\
      ],\
      \"documentation\":\"<p>Lists the specified log groups. You can list all your log groups or filter the results by prefix. The results are ASCII-sorted by log group name.</p> <p>CloudWatch Logs doesnât support IAM policies that control access to the <code>DescribeLogGroups</code> action by using the <code>aws:ResourceTag/<i>key-name</i> </code> condition key. Other CloudWatch Logs actions do support the use of the <code>aws:ResourceTag/<i>key-name</i> </code> condition key to control access. For more information about using tags to control access, see <a href=\\\"https://docs.aws.amazon.com/IAM/latest/UserGuide/access_tags.html\\\">Controlling access to Amazon Web Services resources using tags</a>.</p> <p>If you are using CloudWatch cross-account observability, you can use this operation in a monitoring account and view data from the linked source accounts. For more information, see <a href=\\\"https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/CloudWatch-Unified-Cross-Account.html\\\">CloudWatch cross-account observability</a>.</p>\"\
    },\
    \"DescribeLogStreams\":{\
      \"name\":\"DescribeLogStreams\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DescribeLogStreamsRequest\"},\
      \"output\":{\"shape\":\"DescribeLogStreamsResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ServiceUnavailableException\"}\
      ],\
      \"documentation\":\"<p>Lists the log streams for the specified log group. You can list all the log streams or filter the results by prefix. You can also control how the results are ordered.</p> <p>You can specify the log group to search by using either <code>logGroupIdentifier</code> or <code>logGroupName</code>. You must include one of these two parameters, but you can't include both. </p> <p>This operation has a limit of five transactions per second, after which transactions are throttled.</p> <p>If you are using CloudWatch cross-account observability, you can use this operation in a monitoring account and view data from the linked source accounts. For more information, see <a href=\\\"https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/CloudWatch-Unified-Cross-Account.html\\\">CloudWatch cross-account observability</a>.</p>\"\
    },\
    \"DescribeMetricFilters\":{\
      \"name\":\"DescribeMetricFilters\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DescribeMetricFiltersRequest\"},\
      \"output\":{\"shape\":\"DescribeMetricFiltersResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ServiceUnavailableException\"}\
      ],\
      \"documentation\":\"<p>Lists the specified metric filters. You can list all of the metric filters or filter the results by log name, prefix, metric name, or metric namespace. The results are ASCII-sorted by filter name.</p>\"\
    },\
    \"DescribeQueries\":{\
      \"name\":\"DescribeQueries\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DescribeQueriesRequest\"},\
      \"output\":{\"shape\":\"DescribeQueriesResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ServiceUnavailableException\"}\
      ],\
      \"documentation\":\"<p>Returns a list of CloudWatch Logs Insights queries that are scheduled, running, or have been run recently in this account. You can request all queries or limit it to queries of a specific log group or queries with a certain status.</p>\"\
    },\
    \"DescribeQueryDefinitions\":{\
      \"name\":\"DescribeQueryDefinitions\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DescribeQueryDefinitionsRequest\"},\
      \"output\":{\"shape\":\"DescribeQueryDefinitionsResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ServiceUnavailableException\"}\
      ],\
      \"documentation\":\"<p>This operation returns a paginated list of your saved CloudWatch Logs Insights query definitions. You can retrieve query definitions from the current account or from a source account that is linked to the current account.</p> <p>You can use the <code>queryDefinitionNamePrefix</code> parameter to limit the results to only the query definitions that have names that start with a certain string.</p>\"\
    },\
    \"DescribeResourcePolicies\":{\
      \"name\":\"DescribeResourcePolicies\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DescribeResourcePoliciesRequest\"},\
      \"output\":{\"shape\":\"DescribeResourcePoliciesResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ServiceUnavailableException\"}\
      ],\
      \"documentation\":\"<p>Lists the resource policies in this account.</p>\"\
    },\
    \"DescribeSubscriptionFilters\":{\
      \"name\":\"DescribeSubscriptionFilters\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DescribeSubscriptionFiltersRequest\"},\
      \"output\":{\"shape\":\"DescribeSubscriptionFiltersResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ServiceUnavailableException\"}\
      ],\
      \"documentation\":\"<p>Lists the subscription filters for the specified log group. You can list all the subscription filters or filter the results by prefix. The results are ASCII-sorted by filter name.</p>\"\
    },\
    \"DisassociateKmsKey\":{\
      \"name\":\"DisassociateKmsKey\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"DisassociateKmsKeyRequest\"},\
      \"errors\":[\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"OperationAbortedException\"},\
        {\"shape\":\"ServiceUnavailableException\"}\
      ],\
      \"documentation\":\"<p>Disassociates the specified KMS key from the specified log group or from all CloudWatch Logs Insights query results in the account.</p> <p>When you use <code>DisassociateKmsKey</code>, you specify either the <code>logGroupName</code> parameter or the <code>resourceIdentifier</code> parameter. You can't specify both of those parameters in the same operation.</p> <ul> <li> <p>Specify the <code>logGroupName</code> parameter to stop using the KMS key to encrypt future log events ingested and stored in the log group. Instead, they will be encrypted with the default CloudWatch Logs method. The log events that were ingested while the key was associated with the log group are still encrypted with that key. Therefore, CloudWatch Logs will need permissions for the key whenever that data is accessed.</p> </li> <li> <p>Specify the <code>resourceIdentifier</code> parameter with the <code>query-result</code> resource to stop using the KMS key to encrypt the results of all future <a href=\\\"https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_StartQuery.html\\\">StartQuery</a> operations in the account. They will instead be encrypted with the default CloudWatch Logs method. The results from queries that ran while the key was associated with the account are still encrypted with that key. Therefore, CloudWatch Logs will need permissions for the key whenever that data is accessed.</p> </li> </ul> <p>It can take up to 5 minutes for this operation to take effect.</p>\"\
    },\
    \"FilterLogEvents\":{\
      \"name\":\"FilterLogEvents\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"FilterLogEventsRequest\"},\
      \"output\":{\"shape\":\"FilterLogEventsResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ServiceUnavailableException\"}\
      ],\
      \"documentation\":\"<p>Lists log events from the specified log group. You can list all the log events or filter the results using a filter pattern, a time range, and the name of the log stream.</p> <p>You must have the <code>logs:FilterLogEvents</code> permission to perform this operation.</p> <p>You can specify the log group to search by using either <code>logGroupIdentifier</code> or <code>logGroupName</code>. You must include one of these two parameters, but you can't include both. </p> <p>By default, this operation returns as many log events as can fit in 1 MB (up to 10,000 log events) or all the events found within the specified time range. If the results include a token, that means there are more log events available. You can get additional results by specifying the token in a subsequent call. This operation can return empty results while there are more log events available through the token.</p> <p>The returned log events are sorted by event timestamp, the timestamp when the event was ingested by CloudWatch Logs, and the ID of the <code>PutLogEvents</code> request.</p> <p>If you are using CloudWatch cross-account observability, you can use this operation in a monitoring account and view data from the linked source accounts. For more information, see <a href=\\\"https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/CloudWatch-Unified-Cross-Account.html\\\">CloudWatch cross-account observability</a>.</p>\"\
    },\
    \"GetDataProtectionPolicy\":{\
      \"name\":\"GetDataProtectionPolicy\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"GetDataProtectionPolicyRequest\"},\
      \"output\":{\"shape\":\"GetDataProtectionPolicyResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"OperationAbortedException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ServiceUnavailableException\"}\
      ],\
      \"documentation\":\"<p>Returns information about a log group data protection policy.</p>\"\
    },\
    \"GetDelivery\":{\
      \"name\":\"GetDelivery\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"GetDeliveryRequest\"},\
      \"output\":{\"shape\":\"GetDeliveryResponse\"},\
      \"errors\":[\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ServiceUnavailableException\"},\
        {\"shape\":\"ValidationException\"},\
        {\"shape\":\"ServiceQuotaExceededException\"},\
        {\"shape\":\"ThrottlingException\"}\
      ],\
      \"documentation\":\"<p>Returns complete information about one logical <i>delivery</i>. A delivery is a connection between a <a href=\\\"https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_PutDeliverySource.html\\\"> <i>delivery source</i> </a> and a <a href=\\\"https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_PutDeliveryDestination.html\\\"> <i>delivery destination</i> </a>.</p> <p>A delivery source represents an Amazon Web Services resource that sends logs to an logs delivery destination. The destination can be CloudWatch Logs, Amazon S3, or Firehose. Only some Amazon Web Services services support being configured as a delivery source. These services are listed in <a href=\\\"https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/AWS-logs-and-resource-policy.html\\\">Enable logging from Amazon Web Services services.</a> </p> <p>You need to specify the delivery <code>id</code> in this operation. You can find the IDs of the deliveries in your account with the <a href=\\\"https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_DescribeDeliveries.html\\\">DescribeDeliveries</a> operation.</p>\"\
    },\
    \"GetDeliveryDestination\":{\
      \"name\":\"GetDeliveryDestination\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"GetDeliveryDestinationRequest\"},\
      \"output\":{\"shape\":\"GetDeliveryDestinationResponse\"},\
      \"errors\":[\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ServiceUnavailableException\"},\
        {\"shape\":\"ValidationException\"},\
        {\"shape\":\"ServiceQuotaExceededException\"},\
        {\"shape\":\"ThrottlingException\"}\
      ],\
      \"documentation\":\"<p>Retrieves complete information about one delivery destination.</p>\"\
    },\
    \"GetDeliveryDestinationPolicy\":{\
      \"name\":\"GetDeliveryDestinationPolicy\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"GetDeliveryDestinationPolicyRequest\"},\
      \"output\":{\"shape\":\"GetDeliveryDestinationPolicyResponse\"},\
      \"errors\":[\
        {\"shape\":\"ServiceUnavailableException\"},\
        {\"shape\":\"ValidationException\"},\
        {\"shape\":\"ResourceNotFoundException\"}\
      ],\
      \"documentation\":\"<p>Retrieves the delivery destination policy assigned to the delivery destination that you specify. For more information about delivery destinations and their policies, see <a href=\\\"https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_PutDeliveryDestinationPolicy.html\\\">PutDeliveryDestinationPolicy</a>.</p>\"\
    },\
    \"GetDeliverySource\":{\
      \"name\":\"GetDeliverySource\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"GetDeliverySourceRequest\"},\
      \"output\":{\"shape\":\"GetDeliverySourceResponse\"},\
      \"errors\":[\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ServiceUnavailableException\"},\
        {\"shape\":\"ValidationException\"},\
        {\"shape\":\"ServiceQuotaExceededException\"},\
        {\"shape\":\"ThrottlingException\"}\
      ],\
      \"documentation\":\"<p>Retrieves complete information about one delivery source.</p>\"\
    },\
    \"GetLogAnomalyDetector\":{\
      \"name\":\"GetLogAnomalyDetector\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"GetLogAnomalyDetectorRequest\"},\
      \"output\":{\"shape\":\"GetLogAnomalyDetectorResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ServiceUnavailableException\"},\
        {\"shape\":\"OperationAbortedException\"}\
      ],\
      \"documentation\":\"<p>Retrieves information about the log anomaly detector that you specify.</p>\"\
    },\
    \"GetLogEvents\":{\
      \"name\":\"GetLogEvents\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"GetLogEventsRequest\"},\
      \"output\":{\"shape\":\"GetLogEventsResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ServiceUnavailableException\"}\
      ],\
      \"documentation\":\"<p>Lists log events from the specified log stream. You can list all of the log events or filter using a time range.</p> <p>By default, this operation returns as many log events as can fit in a response size of 1MB (up to 10,000 log events). You can get additional log events by specifying one of the tokens in a subsequent call. This operation can return empty results while there are more log events available through the token.</p> <p>If you are using CloudWatch cross-account observability, you can use this operation in a monitoring account and view data from the linked source accounts. For more information, see <a href=\\\"https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/CloudWatch-Unified-Cross-Account.html\\\">CloudWatch cross-account observability</a>.</p> <p>You can specify the log group to search by using either <code>logGroupIdentifier</code> or <code>logGroupName</code>. You must include one of these two parameters, but you can't include both. </p>\"\
    },\
    \"GetLogGroupFields\":{\
      \"name\":\"GetLogGroupFields\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"GetLogGroupFieldsRequest\"},\
      \"output\":{\"shape\":\"GetLogGroupFieldsResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"LimitExceededException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ServiceUnavailableException\"}\
      ],\
      \"documentation\":\"<p>Returns a list of the fields that are included in log events in the specified log group. Includes the percentage of log events that contain each field. The search is limited to a time period that you specify.</p> <p>You can specify the log group to search by using either <code>logGroupIdentifier</code> or <code>logGroupName</code>. You must specify one of these parameters, but you can't specify both. </p> <p>In the results, fields that start with <code>@</code> are fields generated by CloudWatch Logs. For example, <code>@timestamp</code> is the timestamp of each log event. For more information about the fields that are generated by CloudWatch logs, see <a href=\\\"https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/CWL_AnalyzeLogData-discoverable-fields.html\\\">Supported Logs and Discovered Fields</a>.</p> <p>The response results are sorted by the frequency percentage, starting with the highest percentage.</p> <p>If you are using CloudWatch cross-account observability, you can use this operation in a monitoring account and view data from the linked source accounts. For more information, see <a href=\\\"https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/CloudWatch-Unified-Cross-Account.html\\\">CloudWatch cross-account observability</a>.</p>\"\
    },\
    \"GetLogRecord\":{\
      \"name\":\"GetLogRecord\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"GetLogRecordRequest\"},\
      \"output\":{\"shape\":\"GetLogRecordResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"LimitExceededException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ServiceUnavailableException\"}\
      ],\
      \"documentation\":\"<p>Retrieves all of the fields and values of a single log event. All fields are retrieved, even if the original query that produced the <code>logRecordPointer</code> retrieved only a subset of fields. Fields are returned as field name/field value pairs.</p> <p>The full unparsed log event is returned within <code>@message</code>.</p>\"\
    },\
    \"GetQueryResults\":{\
      \"name\":\"GetQueryResults\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"GetQueryResultsRequest\"},\
      \"output\":{\"shape\":\"GetQueryResultsResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ServiceUnavailableException\"}\
      ],\
      \"documentation\":\"<p>Returns the results from the specified query.</p> <p>Only the fields requested in the query are returned, along with a <code>@ptr</code> field, which is the identifier for the log record. You can use the value of <code>@ptr</code> in a <a href=\\\"https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_GetLogRecord.html\\\">GetLogRecord</a> operation to get the full log record.</p> <p> <code>GetQueryResults</code> does not start running a query. To run a query, use <a href=\\\"https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_StartQuery.html\\\">StartQuery</a>. For more information about how long results of previous queries are available, see <a href=\\\"https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/cloudwatch_limits_cwl.html\\\">CloudWatch Logs quotas</a>.</p> <p>If the value of the <code>Status</code> field in the output is <code>Running</code>, this operation returns only partial results. If you see a value of <code>Scheduled</code> or <code>Running</code> for the status, you can retry the operation later to see the final results. </p> <p>If you are using CloudWatch cross-account observability, you can use this operation in a monitoring account to start queries in linked source accounts. For more information, see <a href=\\\"https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/CloudWatch-Unified-Cross-Account.html\\\">CloudWatch cross-account observability</a>.</p>\"\
    },\
    \"ListAnomalies\":{\
      \"name\":\"ListAnomalies\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"ListAnomaliesRequest\"},\
      \"output\":{\"shape\":\"ListAnomaliesResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ServiceUnavailableException\"},\
        {\"shape\":\"OperationAbortedException\"}\
      ],\
      \"documentation\":\"<p>Returns a list of anomalies that log anomaly detectors have found. For details about the structure format of each anomaly object that is returned, see the example in this section.</p>\"\
    },\
    \"ListLogAnomalyDetectors\":{\
      \"name\":\"ListLogAnomalyDetectors\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"ListLogAnomalyDetectorsRequest\"},\
      \"output\":{\"shape\":\"ListLogAnomalyDetectorsResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ServiceUnavailableException\"},\
        {\"shape\":\"OperationAbortedException\"}\
      ],\
      \"documentation\":\"<p>Retrieves a list of the log anomaly detectors in the account.</p>\"\
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
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ServiceUnavailableException\"}\
      ],\
      \"documentation\":\"<p>Displays the tags associated with a CloudWatch Logs resource. Currently, log groups and destinations support tagging.</p>\"\
    },\
    \"ListTagsLogGroup\":{\
      \"name\":\"ListTagsLogGroup\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"ListTagsLogGroupRequest\"},\
      \"output\":{\"shape\":\"ListTagsLogGroupResponse\"},\
      \"errors\":[\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ServiceUnavailableException\"}\
      ],\
      \"documentation\":\"<important> <p>The ListTagsLogGroup operation is on the path to deprecation. We recommend that you use <a href=\\\"https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_ListTagsForResource.html\\\">ListTagsForResource</a> instead.</p> </important> <p>Lists the tags for the specified log group.</p>\",\
      \"deprecated\":true,\
      \"deprecatedMessage\":\"Please use the generic tagging API ListTagsForResource\"\
    },\
    \"PutAccountPolicy\":{\
      \"name\":\"PutAccountPolicy\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"PutAccountPolicyRequest\"},\
      \"output\":{\"shape\":\"PutAccountPolicyResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"OperationAbortedException\"},\
        {\"shape\":\"ServiceUnavailableException\"},\
        {\"shape\":\"LimitExceededException\"}\
      ],\
      \"documentation\":\"<p>Creates an account-level data protection policy or subscription filter policy that applies to all log groups or a subset of log groups in the account.</p> <p> <b>Data protection policy</b> </p> <p>A data protection policy can help safeguard sensitive data that's ingested by your log groups by auditing and masking the sensitive log data. Each account can have only one account-level data protection policy.</p> <important> <p>Sensitive data is detected and masked when it is ingested into a log group. When you set a data protection policy, log events ingested into the log groups before that time are not masked.</p> </important> <p>If you use <code>PutAccountPolicy</code> to create a data protection policy for your whole account, it applies to both existing log groups and all log groups that are created later in this account. The account-level policy is applied to existing log groups with eventual consistency. It might take up to 5 minutes before sensitive data in existing log groups begins to be masked.</p> <p>By default, when a user views a log event that includes masked data, the sensitive data is replaced by asterisks. A user who has the <code>logs:Unmask</code> permission can use a <a href=\\\"https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_GetLogEvents.html\\\">GetLogEvents</a> or <a href=\\\"https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_FilterLogEvents.html\\\">FilterLogEvents</a> operation with the <code>unmask</code> parameter set to <code>true</code> to view the unmasked log events. Users with the <code>logs:Unmask</code> can also view unmasked data in the CloudWatch Logs console by running a CloudWatch Logs Insights query with the <code>unmask</code> query command.</p> <p>For more information, including a list of types of data that can be audited and masked, see <a href=\\\"https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/mask-sensitive-log-data.html\\\">Protect sensitive log data with masking</a>.</p> <p>To use the <code>PutAccountPolicy</code> operation for a data protection policy, you must be signed on with the <code>logs:PutDataProtectionPolicy</code> and <code>logs:PutAccountPolicy</code> permissions.</p> <p>The <code>PutAccountPolicy</code> operation applies to all log groups in the account. You can use <a href=\\\"https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_PutDataProtectionPolicy.html\\\">PutDataProtectionPolicy</a> to create a data protection policy that applies to just one log group. If a log group has its own data protection policy and the account also has an account-level data protection policy, then the two policies are cumulative. Any sensitive term specified in either policy is masked.</p> <p> <b>Subscription filter policy</b> </p> <p>A subscription filter policy sets up a real-time feed of log events from CloudWatch Logs to other Amazon Web Services services. Account-level subscription filter policies apply to both existing log groups and log groups that are created later in this account. Supported destinations are Kinesis Data Streams, Firehose, and Lambda. When log events are sent to the receiving service, they are Base64 encoded and compressed with the GZIP format.</p> <p>The following destinations are supported for subscription filters:</p> <ul> <li> <p>An Kinesis Data Streams data stream in the same account as the subscription policy, for same-account delivery.</p> </li> <li> <p>An Firehose data stream in the same account as the subscription policy, for same-account delivery.</p> </li> <li> <p>A Lambda function in the same account as the subscription policy, for same-account delivery.</p> </li> <li> <p>A logical destination in a different account created with <a href=\\\"https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_PutDestination.html\\\">PutDestination</a>, for cross-account delivery. Kinesis Data Streams and Firehose are supported as logical destinations.</p> </li> </ul> <p>Each account can have one account-level subscription filter policy. If you are updating an existing filter, you must specify the correct name in <code>PolicyName</code>. To perform a <code>PutAccountPolicy</code> subscription filter operation for any destination except a Lambda function, you must also have the <code>iam:PassRole</code> permission.</p>\"\
    },\
    \"PutDataProtectionPolicy\":{\
      \"name\":\"PutDataProtectionPolicy\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"PutDataProtectionPolicyRequest\"},\
      \"output\":{\"shape\":\"PutDataProtectionPolicyResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"LimitExceededException\"},\
        {\"shape\":\"OperationAbortedException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ServiceUnavailableException\"}\
      ],\
      \"documentation\":\"<p>Creates a data protection policy for the specified log group. A data protection policy can help safeguard sensitive data that's ingested by the log group by auditing and masking the sensitive log data.</p> <important> <p>Sensitive data is detected and masked when it is ingested into the log group. When you set a data protection policy, log events ingested into the log group before that time are not masked.</p> </important> <p>By default, when a user views a log event that includes masked data, the sensitive data is replaced by asterisks. A user who has the <code>logs:Unmask</code> permission can use a <a href=\\\"https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_GetLogEvents.html\\\">GetLogEvents</a> or <a href=\\\"https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_FilterLogEvents.html\\\">FilterLogEvents</a> operation with the <code>unmask</code> parameter set to <code>true</code> to view the unmasked log events. Users with the <code>logs:Unmask</code> can also view unmasked data in the CloudWatch Logs console by running a CloudWatch Logs Insights query with the <code>unmask</code> query command.</p> <p>For more information, including a list of types of data that can be audited and masked, see <a href=\\\"https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/mask-sensitive-log-data.html\\\">Protect sensitive log data with masking</a>.</p> <p>The <code>PutDataProtectionPolicy</code> operation applies to only the specified log group. You can also use <a href=\\\"https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_PutAccountPolicy.html\\\">PutAccountPolicy</a> to create an account-level data protection policy that applies to all log groups in the account, including both existing log groups and log groups that are created level. If a log group has its own data protection policy and the account also has an account-level data protection policy, then the two policies are cumulative. Any sensitive term specified in either policy is masked.</p>\"\
    },\
    \"PutDeliveryDestination\":{\
      \"name\":\"PutDeliveryDestination\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"PutDeliveryDestinationRequest\"},\
      \"output\":{\"shape\":\"PutDeliveryDestinationResponse\"},\
      \"errors\":[\
        {\"shape\":\"ServiceUnavailableException\"},\
        {\"shape\":\"ConflictException\"},\
        {\"shape\":\"ValidationException\"},\
        {\"shape\":\"ServiceQuotaExceededException\"},\
        {\"shape\":\"ThrottlingException\"},\
        {\"shape\":\"ResourceNotFoundException\"}\
      ],\
      \"documentation\":\"<p>Creates or updates a logical <i>delivery destination</i>. A delivery destination is an Amazon Web Services resource that represents an Amazon Web Services service that logs can be sent to. CloudWatch Logs, Amazon S3, and Firehose are supported as logs delivery destinations.</p> <p>To configure logs delivery between a supported Amazon Web Services service and a destination, you must do the following:</p> <ul> <li> <p>Create a delivery source, which is a logical object that represents the resource that is actually sending the logs. For more information, see <a href=\\\"https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_PutDeliverySource.html\\\">PutDeliverySource</a>.</p> </li> <li> <p>Use <code>PutDeliveryDestination</code> to create a <i>delivery destination</i>, which is a logical object that represents the actual delivery destination. </p> </li> <li> <p>If you are delivering logs cross-account, you must use <a href=\\\"https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_PutDeliveryDestinationPolicy.html\\\">PutDeliveryDestinationPolicy</a> in the destination account to assign an IAM policy to the destination. This policy allows delivery to that destination. </p> </li> <li> <p>Use <code>CreateDelivery</code> to create a <i>delivery</i> by pairing exactly one delivery source and one delivery destination. For more information, see <a href=\\\"https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_CreateDelivery.html\\\">CreateDelivery</a>. </p> </li> </ul> <p>You can configure a single delivery source to send logs to multiple destinations by creating multiple deliveries. You can also create multiple deliveries to configure multiple delivery sources to send logs to the same delivery destination.</p> <p>Only some Amazon Web Services services support being configured as a delivery source. These services are listed as <b>Supported [V2 Permissions]</b> in the table at <a href=\\\"https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/AWS-logs-and-resource-policy.html\\\">Enabling logging from Amazon Web Services services.</a> </p> <p>If you use this operation to update an existing delivery destination, all the current delivery destination parameters are overwritten with the new parameter values that you specify.</p>\"\
    },\
    \"PutDeliveryDestinationPolicy\":{\
      \"name\":\"PutDeliveryDestinationPolicy\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"PutDeliveryDestinationPolicyRequest\"},\
      \"output\":{\"shape\":\"PutDeliveryDestinationPolicyResponse\"},\
      \"errors\":[\
        {\"shape\":\"ServiceUnavailableException\"},\
        {\"shape\":\"ValidationException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ConflictException\"}\
      ],\
      \"documentation\":\"<p>Creates and assigns an IAM policy that grants permissions to CloudWatch Logs to deliver logs cross-account to a specified destination in this account. To configure the delivery of logs from an Amazon Web Services service in another account to a logs delivery destination in the current account, you must do the following:</p> <ul> <li> <p>Create a delivery source, which is a logical object that represents the resource that is actually sending the logs. For more information, see <a href=\\\"https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_PutDeliverySource.html\\\">PutDeliverySource</a>.</p> </li> <li> <p>Create a <i>delivery destination</i>, which is a logical object that represents the actual delivery destination. For more information, see <a href=\\\"https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_PutDeliveryDestination.html\\\">PutDeliveryDestination</a>.</p> </li> <li> <p>Use this operation in the destination account to assign an IAM policy to the destination. This policy allows delivery to that destination. </p> </li> <li> <p>Create a <i>delivery</i> by pairing exactly one delivery source and one delivery destination. For more information, see <a href=\\\"https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_CreateDelivery.html\\\">CreateDelivery</a>.</p> </li> </ul> <p>Only some Amazon Web Services services support being configured as a delivery source. These services are listed as <b>Supported [V2 Permissions]</b> in the table at <a href=\\\"https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/AWS-logs-and-resource-policy.html\\\">Enabling logging from Amazon Web Services services.</a> </p> <p>The contents of the policy must include two statements. One statement enables general logs delivery, and the other allows delivery to the chosen destination. See the examples for the needed policies.</p>\"\
    },\
    \"PutDeliverySource\":{\
      \"name\":\"PutDeliverySource\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"PutDeliverySourceRequest\"},\
      \"output\":{\"shape\":\"PutDeliverySourceResponse\"},\
      \"errors\":[\
        {\"shape\":\"ServiceUnavailableException\"},\
        {\"shape\":\"ConflictException\"},\
        {\"shape\":\"ValidationException\"},\
        {\"shape\":\"ServiceQuotaExceededException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ThrottlingException\"}\
      ],\
      \"documentation\":\"<p>Creates or updates a logical <i>delivery source</i>. A delivery source represents an Amazon Web Services resource that sends logs to an logs delivery destination. The destination can be CloudWatch Logs, Amazon S3, or Firehose.</p> <p>To configure logs delivery between a delivery destination and an Amazon Web Services service that is supported as a delivery source, you must do the following:</p> <ul> <li> <p>Use <code>PutDeliverySource</code> to create a delivery source, which is a logical object that represents the resource that is actually sending the logs. </p> </li> <li> <p>Use <code>PutDeliveryDestination</code> to create a <i>delivery destination</i>, which is a logical object that represents the actual delivery destination. For more information, see <a href=\\\"https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_PutDeliveryDestination.html\\\">PutDeliveryDestination</a>.</p> </li> <li> <p>If you are delivering logs cross-account, you must use <a href=\\\"https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_PutDeliveryDestinationPolicy.html\\\">PutDeliveryDestinationPolicy</a> in the destination account to assign an IAM policy to the destination. This policy allows delivery to that destination. </p> </li> <li> <p>Use <code>CreateDelivery</code> to create a <i>delivery</i> by pairing exactly one delivery source and one delivery destination. For more information, see <a href=\\\"https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_CreateDelivery.html\\\">CreateDelivery</a>. </p> </li> </ul> <p>You can configure a single delivery source to send logs to multiple destinations by creating multiple deliveries. You can also create multiple deliveries to configure multiple delivery sources to send logs to the same delivery destination.</p> <p>Only some Amazon Web Services services support being configured as a delivery source. These services are listed as <b>Supported [V2 Permissions]</b> in the table at <a href=\\\"https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/AWS-logs-and-resource-policy.html\\\">Enabling logging from Amazon Web Services services.</a> </p> <p>If you use this operation to update an existing delivery source, all the current delivery source parameters are overwritten with the new parameter values that you specify.</p>\"\
    },\
    \"PutDestination\":{\
      \"name\":\"PutDestination\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"PutDestinationRequest\"},\
      \"output\":{\"shape\":\"PutDestinationResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"OperationAbortedException\"},\
        {\"shape\":\"ServiceUnavailableException\"}\
      ],\
      \"documentation\":\"<p>Creates or updates a destination. This operation is used only to create destinations for cross-account subscriptions.</p> <p>A destination encapsulates a physical resource (such as an Amazon Kinesis stream). With a destination, you can subscribe to a real-time stream of log events for a different account, ingested using <a href=\\\"https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_PutLogEvents.html\\\">PutLogEvents</a>.</p> <p>Through an access policy, a destination controls what is written to it. By default, <code>PutDestination</code> does not set any access policy with the destination, which means a cross-account user cannot call <a href=\\\"https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_PutSubscriptionFilter.html\\\">PutSubscriptionFilter</a> against this destination. To enable this, the destination owner must call <a href=\\\"https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_PutDestinationPolicy.html\\\">PutDestinationPolicy</a> after <code>PutDestination</code>.</p> <p>To perform a <code>PutDestination</code> operation, you must also have the <code>iam:PassRole</code> permission.</p>\"\
    },\
    \"PutDestinationPolicy\":{\
      \"name\":\"PutDestinationPolicy\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"PutDestinationPolicyRequest\"},\
      \"errors\":[\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"OperationAbortedException\"},\
        {\"shape\":\"ServiceUnavailableException\"}\
      ],\
      \"documentation\":\"<p>Creates or updates an access policy associated with an existing destination. An access policy is an <a href=\\\"https://docs.aws.amazon.com/IAM/latest/UserGuide/policies_overview.html\\\">IAM policy document</a> that is used to authorize claims to register a subscription filter against a given destination.</p>\"\
    },\
    \"PutLogEvents\":{\
      \"name\":\"PutLogEvents\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"PutLogEventsRequest\"},\
      \"output\":{\"shape\":\"PutLogEventsResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"InvalidSequenceTokenException\"},\
        {\"shape\":\"DataAlreadyAcceptedException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ServiceUnavailableException\"},\
        {\"shape\":\"UnrecognizedClientException\"}\
      ],\
      \"documentation\":\"<p>Uploads a batch of log events to the specified log stream.</p> <important> <p>The sequence token is now ignored in <code>PutLogEvents</code> actions. <code>PutLogEvents</code> actions are always accepted and never return <code>InvalidSequenceTokenException</code> or <code>DataAlreadyAcceptedException</code> even if the sequence token is not valid. You can use parallel <code>PutLogEvents</code> actions on the same log stream. </p> </important> <p>The batch of events must satisfy the following constraints:</p> <ul> <li> <p>The maximum batch size is 1,048,576 bytes. This size is calculated as the sum of all event messages in UTF-8, plus 26 bytes for each log event.</p> </li> <li> <p>None of the log events in the batch can be more than 2 hours in the future.</p> </li> <li> <p>None of the log events in the batch can be more than 14 days in the past. Also, none of the log events can be from earlier than the retention period of the log group.</p> </li> <li> <p>The log events in the batch must be in chronological order by their timestamp. The timestamp is the time that the event occurred, expressed as the number of milliseconds after <code>Jan 1, 1970 00:00:00 UTC</code>. (In Amazon Web Services Tools for PowerShell and the Amazon Web Services SDK for .NET, the timestamp is specified in .NET format: <code>yyyy-mm-ddThh:mm:ss</code>. For example, <code>2017-09-15T13:45:30</code>.) </p> </li> <li> <p>A batch of log events in a single request cannot span more than 24 hours. Otherwise, the operation fails.</p> </li> <li> <p>Each log event can be no larger than 256 KB.</p> </li> <li> <p>The maximum number of log events in a batch is 10,000.</p> </li> <li> <important> <p>The quota of five requests per second per log stream has been removed. Instead, <code>PutLogEvents</code> actions are throttled based on a per-second per-account quota. You can request an increase to the per-second throttling quota by using the Service Quotas service.</p> </important> </li> </ul> <p>If a call to <code>PutLogEvents</code> returns \\\"UnrecognizedClientException\\\" the most likely cause is a non-valid Amazon Web Services access key ID or secret key. </p>\"\
    },\
    \"PutMetricFilter\":{\
      \"name\":\"PutMetricFilter\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"PutMetricFilterRequest\"},\
      \"errors\":[\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"OperationAbortedException\"},\
        {\"shape\":\"LimitExceededException\"},\
        {\"shape\":\"ServiceUnavailableException\"}\
      ],\
      \"documentation\":\"<p>Creates or updates a metric filter and associates it with the specified log group. With metric filters, you can configure rules to extract metric data from log events ingested through <a href=\\\"https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_PutLogEvents.html\\\">PutLogEvents</a>.</p> <p>The maximum number of metric filters that can be associated with a log group is 100.</p> <p>When you create a metric filter, you can also optionally assign a unit and dimensions to the metric that is created.</p> <important> <p>Metrics extracted from log events are charged as custom metrics. To prevent unexpected high charges, do not specify high-cardinality fields such as <code>IPAddress</code> or <code>requestID</code> as dimensions. Each different value found for a dimension is treated as a separate metric and accrues charges as a separate custom metric. </p> <p>CloudWatch Logs might disable a metric filter if it generates 1,000 different name/value pairs for your specified dimensions within one hour.</p> <p>You can also set up a billing alarm to alert you if your charges are higher than expected. For more information, see <a href=\\\"https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/monitor_estimated_charges_with_cloudwatch.html\\\"> Creating a Billing Alarm to Monitor Your Estimated Amazon Web Services Charges</a>. </p> </important>\"\
    },\
    \"PutQueryDefinition\":{\
      \"name\":\"PutQueryDefinition\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"PutQueryDefinitionRequest\"},\
      \"output\":{\"shape\":\"PutQueryDefinitionResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"LimitExceededException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ServiceUnavailableException\"}\
      ],\
      \"documentation\":\"<p>Creates or updates a query definition for CloudWatch Logs Insights. For more information, see <a href=\\\"https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/AnalyzingLogData.html\\\">Analyzing Log Data with CloudWatch Logs Insights</a>.</p> <p>To update a query definition, specify its <code>queryDefinitionId</code> in your request. The values of <code>name</code>, <code>queryString</code>, and <code>logGroupNames</code> are changed to the values that you specify in your update operation. No current values are retained from the current query definition. For example, imagine updating a current query definition that includes log groups. If you don't specify the <code>logGroupNames</code> parameter in your update operation, the query definition changes to contain no log groups.</p> <p>You must have the <code>logs:PutQueryDefinition</code> permission to be able to perform this operation.</p>\"\
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
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"LimitExceededException\"},\
        {\"shape\":\"ServiceUnavailableException\"}\
      ],\
      \"documentation\":\"<p>Creates or updates a resource policy allowing other Amazon Web Services services to put log events to this account, such as Amazon Route 53. An account can have up to 10 resource policies per Amazon Web Services Region.</p>\"\
    },\
    \"PutRetentionPolicy\":{\
      \"name\":\"PutRetentionPolicy\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"PutRetentionPolicyRequest\"},\
      \"errors\":[\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"OperationAbortedException\"},\
        {\"shape\":\"ServiceUnavailableException\"}\
      ],\
      \"documentation\":\"<p>Sets the retention of the specified log group. With a retention policy, you can configure the number of days for which to retain log events in the specified log group.</p> <note> <p>CloudWatch Logs doesnât immediately delete log events when they reach their retention setting. It typically takes up to 72 hours after that before log events are deleted, but in rare situations might take longer.</p> <p>To illustrate, imagine that you change a log group to have a longer retention setting when it contains log events that are past the expiration date, but havenât been deleted. Those log events will take up to 72 hours to be deleted after the new retention date is reached. To make sure that log data is deleted permanently, keep a log group at its lower retention setting until 72 hours after the previous retention period ends. Alternatively, wait to change the retention setting until you confirm that the earlier log events are deleted. </p> <p>When log events reach their retention setting they are marked for deletion. After they are marked for deletion, they do not add to your archival storage costs anymore, even if they are not actually deleted until later. These log events marked for deletion are also not included when you use an API to retrieve the <code>storedBytes</code> value to see how many bytes a log group is storing.</p> </note>\"\
    },\
    \"PutSubscriptionFilter\":{\
      \"name\":\"PutSubscriptionFilter\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"PutSubscriptionFilterRequest\"},\
      \"errors\":[\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"OperationAbortedException\"},\
        {\"shape\":\"LimitExceededException\"},\
        {\"shape\":\"ServiceUnavailableException\"}\
      ],\
      \"documentation\":\"<p>Creates or updates a subscription filter and associates it with the specified log group. With subscription filters, you can subscribe to a real-time stream of log events ingested through <a href=\\\"https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_PutLogEvents.html\\\">PutLogEvents</a> and have them delivered to a specific destination. When log events are sent to the receiving service, they are Base64 encoded and compressed with the GZIP format.</p> <p>The following destinations are supported for subscription filters:</p> <ul> <li> <p>An Amazon Kinesis data stream belonging to the same account as the subscription filter, for same-account delivery.</p> </li> <li> <p>A logical destination created with <a href=\\\"https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_PutDestination.html\\\">PutDestination</a> that belongs to a different account, for cross-account delivery. We currently support Kinesis Data Streams and Firehose as logical destinations.</p> </li> <li> <p>An Amazon Kinesis Data Firehose delivery stream that belongs to the same account as the subscription filter, for same-account delivery.</p> </li> <li> <p>An Lambda function that belongs to the same account as the subscription filter, for same-account delivery.</p> </li> </ul> <p>Each log group can have up to two subscription filters associated with it. If you are updating an existing filter, you must specify the correct name in <code>filterName</code>. </p> <p>To perform a <code>PutSubscriptionFilter</code> operation for any destination except a Lambda function, you must also have the <code>iam:PassRole</code> permission.</p>\"\
    },\
    \"StartLiveTail\":{\
      \"name\":\"StartLiveTail\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"StartLiveTailRequest\"},\
      \"output\":{\"shape\":\"StartLiveTailResponse\"},\
      \"errors\":[\
        {\"shape\":\"AccessDeniedException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"LimitExceededException\"},\
        {\"shape\":\"InvalidOperationException\"}\
      ],\
      \"documentation\":\"<p>Starts a Live Tail streaming session for one or more log groups. A Live Tail session returns a stream of log events that have been recently ingested in the log groups. For more information, see <a href=\\\"https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/CloudWatchLogs_LiveTail.html\\\">Use Live Tail to view logs in near real time</a>. </p> <p>The response to this operation is a response stream, over which the server sends live log events and the client receives them.</p> <p>The following objects are sent over the stream:</p> <ul> <li> <p>A single <a href=\\\"https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_LiveTailSessionStart.html\\\">LiveTailSessionStart</a> object is sent at the start of the session.</p> </li> <li> <p>Every second, a <a href=\\\"https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_LiveTailSessionUpdate.html\\\">LiveTailSessionUpdate</a> object is sent. Each of these objects contains an array of the actual log events.</p> <p>If no new log events were ingested in the past second, the <code>LiveTailSessionUpdate</code> object will contain an empty array.</p> <p>The array of log events contained in a <code>LiveTailSessionUpdate</code> can include as many as 500 log events. If the number of log events matching the request exceeds 500 per second, the log events are sampled down to 500 log events to be included in each <code>LiveTailSessionUpdate</code> object.</p> <p>If your client consumes the log events slower than the server produces them, CloudWatch Logs buffers up to 10 <code>LiveTailSessionUpdate</code> events or 5000 log events, after which it starts dropping the oldest events.</p> </li> <li> <p>A <a href=\\\"https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_SessionStreamingException.html\\\">SessionStreamingException</a> object is returned if an unknown error occurs on the server side.</p> </li> <li> <p>A <a href=\\\"https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_SessionTimeoutException.html\\\">SessionTimeoutException</a> object is returned when the session times out, after it has been kept open for three hours.</p> </li> </ul> <important> <p>You can end a session before it times out by closing the session stream or by closing the client that is receiving the stream. The session also ends if the established connection between the client and the server breaks.</p> </important> <p>For examples of using an SDK to start a Live Tail session, see <a href=\\\"https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/example_cloudwatch-logs_StartLiveTail_section.html\\\"> Start a Live Tail session using an Amazon Web Services SDK</a>.</p>\",\
      \"endpoint\":{\"hostPrefix\":\"streaming-\"}\
    },\
    \"StartQuery\":{\
      \"name\":\"StartQuery\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"StartQueryRequest\"},\
      \"output\":{\"shape\":\"StartQueryResponse\"},\
      \"errors\":[\
        {\"shape\":\"MalformedQueryException\"},\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"LimitExceededException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ServiceUnavailableException\"}\
      ],\
      \"documentation\":\"<p>Schedules a query of a log group using CloudWatch Logs Insights. You specify the log group and time range to query and the query string to use.</p> <p>For more information, see <a href=\\\"https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/CWL_QuerySyntax.html\\\">CloudWatch Logs Insights Query Syntax</a>.</p> <p>After you run a query using <code>StartQuery</code>, the query results are stored by CloudWatch Logs. You can use <a href=\\\"https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_GetQueryResults.html\\\">GetQueryResults</a> to retrieve the results of a query, using the <code>queryId</code> that <code>StartQuery</code> returns. </p> <p>If you have associated a KMS key with the query results in this account, then <a href=\\\"https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_StartQuery.html\\\">StartQuery</a> uses that key to encrypt the results when it stores them. If no key is associated with query results, the query results are encrypted with the default CloudWatch Logs encryption method.</p> <p>Queries time out after 60 minutes of runtime. If your queries are timing out, reduce the time range being searched or partition your query into a number of queries.</p> <p>If you are using CloudWatch cross-account observability, you can use this operation in a monitoring account to start a query in a linked source account. For more information, see <a href=\\\"https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/CloudWatch-Unified-Cross-Account.html\\\">CloudWatch cross-account observability</a>. For a cross-account <code>StartQuery</code> operation, the query definition must be defined in the monitoring account.</p> <p>You can have up to 30 concurrent CloudWatch Logs insights queries, including queries that have been added to dashboards. </p>\"\
    },\
    \"StopQuery\":{\
      \"name\":\"StopQuery\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"StopQueryRequest\"},\
      \"output\":{\"shape\":\"StopQueryResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ServiceUnavailableException\"}\
      ],\
      \"documentation\":\"<p>Stops a CloudWatch Logs Insights query that is in progress. If the query has already ended, the operation returns an error indicating that the specified query is not running.</p>\"\
    },\
    \"TagLogGroup\":{\
      \"name\":\"TagLogGroup\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"TagLogGroupRequest\"},\
      \"errors\":[\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"InvalidParameterException\"}\
      ],\
      \"documentation\":\"<important> <p>The TagLogGroup operation is on the path to deprecation. We recommend that you use <a href=\\\"https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_TagResource.html\\\">TagResource</a> instead.</p> </important> <p>Adds or updates the specified tags for the specified log group.</p> <p>To list the tags for a log group, use <a href=\\\"https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_ListTagsForResource.html\\\">ListTagsForResource</a>. To remove tags, use <a href=\\\"https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_UntagResource.html\\\">UntagResource</a>.</p> <p>For more information about tags, see <a href=\\\"https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/Working-with-log-groups-and-streams.html#log-group-tagging\\\">Tag Log Groups in Amazon CloudWatch Logs</a> in the <i>Amazon CloudWatch Logs User Guide</i>.</p> <p>CloudWatch Logs doesnât support IAM policies that prevent users from assigning specified tags to log groups using the <code>aws:Resource/<i>key-name</i> </code> or <code>aws:TagKeys</code> condition keys. For more information about using tags to control access, see <a href=\\\"https://docs.aws.amazon.com/IAM/latest/UserGuide/access_tags.html\\\">Controlling access to Amazon Web Services resources using tags</a>.</p>\",\
      \"deprecated\":true,\
      \"deprecatedMessage\":\"Please use the generic tagging API TagResource\"\
    },\
    \"TagResource\":{\
      \"name\":\"TagResource\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"TagResourceRequest\"},\
      \"errors\":[\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ServiceUnavailableException\"},\
        {\"shape\":\"TooManyTagsException\"}\
      ],\
      \"documentation\":\"<p>Assigns one or more tags (key-value pairs) to the specified CloudWatch Logs resource. Currently, the only CloudWatch Logs resources that can be tagged are log groups and destinations. </p> <p>Tags can help you organize and categorize your resources. You can also use them to scope user permissions by granting a user permission to access or change only resources with certain tag values.</p> <p>Tags don't have any semantic meaning to Amazon Web Services and are interpreted strictly as strings of characters.</p> <p>You can use the <code>TagResource</code> action with a resource that already has tags. If you specify a new tag key for the alarm, this tag is appended to the list of tags associated with the alarm. If you specify a tag key that is already associated with the alarm, the new tag value that you specify replaces the previous value for that tag.</p> <p>You can associate as many as 50 tags with a CloudWatch Logs resource.</p>\"\
    },\
    \"TestMetricFilter\":{\
      \"name\":\"TestMetricFilter\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"TestMetricFilterRequest\"},\
      \"output\":{\"shape\":\"TestMetricFilterResponse\"},\
      \"errors\":[\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ServiceUnavailableException\"}\
      ],\
      \"documentation\":\"<p>Tests the filter pattern of a metric filter against a sample of log event messages. You can use this operation to validate the correctness of a metric filter pattern.</p>\"\
    },\
    \"UntagLogGroup\":{\
      \"name\":\"UntagLogGroup\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"UntagLogGroupRequest\"},\
      \"errors\":[\
        {\"shape\":\"ResourceNotFoundException\"}\
      ],\
      \"documentation\":\"<important> <p>The UntagLogGroup operation is on the path to deprecation. We recommend that you use <a href=\\\"https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_UntagResource.html\\\">UntagResource</a> instead.</p> </important> <p>Removes the specified tags from the specified log group.</p> <p>To list the tags for a log group, use <a href=\\\"https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_ListTagsForResource.html\\\">ListTagsForResource</a>. To add tags, use <a href=\\\"https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_TagResource.html\\\">TagResource</a>.</p> <p>CloudWatch Logs doesnât support IAM policies that prevent users from assigning specified tags to log groups using the <code>aws:Resource/<i>key-name</i> </code> or <code>aws:TagKeys</code> condition keys. </p>\",\
      \"deprecated\":true,\
      \"deprecatedMessage\":\"Please use the generic tagging API UntagResource\"\
    },\
    \"UntagResource\":{\
      \"name\":\"UntagResource\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"UntagResourceRequest\"},\
      \"errors\":[\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ServiceUnavailableException\"}\
      ],\
      \"documentation\":\"<p>Removes one or more tags from the specified resource.</p>\"\
    },\
    \"UpdateAnomaly\":{\
      \"name\":\"UpdateAnomaly\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"UpdateAnomalyRequest\"},\
      \"errors\":[\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ServiceUnavailableException\"},\
        {\"shape\":\"OperationAbortedException\"}\
      ],\
      \"documentation\":\"<p>Use this operation to <i>suppress</i> anomaly detection for a specified anomaly or pattern. If you suppress an anomaly, CloudWatch Logs wonât report new occurrences of that anomaly and won't update that anomaly with new data. If you suppress a pattern, CloudWatch Logs wonât report any anomalies related to that pattern.</p> <p>You must specify either <code>anomalyId</code> or <code>patternId</code>, but you can't specify both parameters in the same operation.</p> <p>If you have previously used this operation to suppress detection of a pattern or anomaly, you can use it again to cause CloudWatch Logs to end the suppression. To do this, use this operation and specify the anomaly or pattern to stop suppressing, and omit the <code>suppressionType</code> and <code>suppressionPeriod</code> parameters.</p>\"\
    },\
    \"UpdateLogAnomalyDetector\":{\
      \"name\":\"UpdateLogAnomalyDetector\",\
      \"http\":{\
        \"method\":\"POST\",\
        \"requestUri\":\"/\"\
      },\
      \"input\":{\"shape\":\"UpdateLogAnomalyDetectorRequest\"},\
      \"errors\":[\
        {\"shape\":\"InvalidParameterException\"},\
        {\"shape\":\"ResourceNotFoundException\"},\
        {\"shape\":\"ServiceUnavailableException\"},\
        {\"shape\":\"OperationAbortedException\"}\
      ],\
      \"documentation\":\"<p>Updates an existing log anomaly detector.</p>\"\
    }\
  },\
  \"shapes\":{\
    \"AccessDeniedException\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p>You don't have sufficient permissions to perform this action.</p>\",\
      \"exception\":true\
    },\
    \"AccessPolicy\":{\
      \"type\":\"string\",\
      \"min\":1\
    },\
    \"AccountId\":{\
      \"type\":\"string\",\
      \"max\":12,\
      \"min\":12,\
      \"pattern\":\"^\\\\d{12}$\"\
    },\
    \"AccountIds\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"AccountId\"},\
      \"max\":20,\
      \"min\":0\
    },\
    \"AccountPolicies\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"AccountPolicy\"}\
    },\
    \"AccountPolicy\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"policyName\":{\
          \"shape\":\"PolicyName\",\
          \"documentation\":\"<p>The name of the account policy.</p>\"\
        },\
        \"policyDocument\":{\
          \"shape\":\"AccountPolicyDocument\",\
          \"documentation\":\"<p>The policy document for this account policy.</p> <p>The JSON specified in <code>policyDocument</code> can be up to 30,720 characters.</p>\"\
        },\
        \"lastUpdatedTime\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The date and time that this policy was most recently updated.</p>\"\
        },\
        \"policyType\":{\
          \"shape\":\"PolicyType\",\
          \"documentation\":\"<p>The type of policy for this account policy.</p>\"\
        },\
        \"scope\":{\
          \"shape\":\"Scope\",\
          \"documentation\":\"<p>The scope of the account policy.</p>\"\
        },\
        \"selectionCriteria\":{\
          \"shape\":\"SelectionCriteria\",\
          \"documentation\":\"<p>The log group selection criteria for this subscription filter policy.</p>\"\
        },\
        \"accountId\":{\
          \"shape\":\"AccountId\",\
          \"documentation\":\"<p>The Amazon Web Services account ID that the policy applies to.</p>\"\
        }\
      },\
      \"documentation\":\"<p>A structure that contains information about one CloudWatch Logs account policy.</p>\"\
    },\
    \"AccountPolicyDocument\":{\"type\":\"string\"},\
    \"AmazonResourceName\":{\
      \"type\":\"string\",\
      \"max\":1011,\
      \"min\":1,\
      \"pattern\":\"[\\\\w+=/:,.@-]*\"\
    },\
    \"Anomalies\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"Anomaly\"}\
    },\
    \"Anomaly\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"anomalyId\",\
        \"patternId\",\
        \"anomalyDetectorArn\",\
        \"patternString\",\
        \"firstSeen\",\
        \"lastSeen\",\
        \"description\",\
        \"active\",\
        \"state\",\
        \"histogram\",\
        \"logSamples\",\
        \"patternTokens\",\
        \"logGroupArnList\"\
      ],\
      \"members\":{\
        \"anomalyId\":{\
          \"shape\":\"AnomalyId\",\
          \"documentation\":\"<p>The unique ID that CloudWatch Logs assigned to this anomaly.</p>\"\
        },\
        \"patternId\":{\
          \"shape\":\"PatternId\",\
          \"documentation\":\"<p>The ID of the pattern used to help identify this anomaly.</p>\"\
        },\
        \"anomalyDetectorArn\":{\
          \"shape\":\"AnomalyDetectorArn\",\
          \"documentation\":\"<p>The ARN of the anomaly detector that identified this anomaly.</p>\"\
        },\
        \"patternString\":{\
          \"shape\":\"PatternString\",\
          \"documentation\":\"<p>The pattern used to help identify this anomaly, in string format.</p>\"\
        },\
        \"patternRegex\":{\
          \"shape\":\"PatternRegex\",\
          \"documentation\":\"<p>The pattern used to help identify this anomaly, in regular expression format.</p>\"\
        },\
        \"priority\":{\
          \"shape\":\"Priority\",\
          \"documentation\":\"<p>The priority level of this anomaly, as determined by CloudWatch Logs. Priority is computed based on log severity labels such as <code>FATAL</code> and <code>ERROR</code> and the amount of deviation from the baseline. Possible values are <code>HIGH</code>, <code>MEDIUM</code>, and <code>LOW</code>.</p>\"\
        },\
        \"firstSeen\":{\
          \"shape\":\"EpochMillis\",\
          \"documentation\":\"<p>The date and time when the anomaly detector first saw this anomaly. It is specified as epoch time, which is the number of seconds since <code>January 1, 1970, 00:00:00 UTC</code>.</p>\"\
        },\
        \"lastSeen\":{\
          \"shape\":\"EpochMillis\",\
          \"documentation\":\"<p>The date and time when the anomaly detector most recently saw this anomaly. It is specified as epoch time, which is the number of seconds since <code>January 1, 1970, 00:00:00 UTC</code>.</p>\"\
        },\
        \"description\":{\
          \"shape\":\"Description\",\
          \"documentation\":\"<p>A human-readable description of the anomaly. This description is generated by CloudWatch Logs.</p>\"\
        },\
        \"active\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Specifies whether this anomaly is still ongoing.</p>\"\
        },\
        \"state\":{\
          \"shape\":\"State\",\
          \"documentation\":\"<p>Indicates the current state of this anomaly. If it is still being treated as an anomaly, the value is <code>Active</code>. If you have suppressed this anomaly by using the <a href=\\\"https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_UpdateAnomaly.html\\\">UpdateAnomaly</a> operation, the value is <code>Suppressed</code>. If this behavior is now considered to be normal, the value is <code>Baseline</code>.</p>\"\
        },\
        \"histogram\":{\
          \"shape\":\"Histogram\",\
          \"documentation\":\"<p>A map showing times when the anomaly detector ran, and the number of occurrences of this anomaly that were detected at each of those runs. The times are specified in epoch time, which is the number of seconds since <code>January 1, 1970, 00:00:00 UTC</code>.</p>\"\
        },\
        \"logSamples\":{\
          \"shape\":\"LogSamples\",\
          \"documentation\":\"<p>An array of sample log event messages that are considered to be part of this anomaly.</p>\"\
        },\
        \"patternTokens\":{\
          \"shape\":\"PatternTokens\",\
          \"documentation\":\"<p>An array of structures where each structure contains information about one token that makes up the pattern.</p>\"\
        },\
        \"logGroupArnList\":{\
          \"shape\":\"LogGroupArnList\",\
          \"documentation\":\"<p>An array of ARNS of the log groups that contained log events considered to be part of this anomaly.</p>\"\
        },\
        \"suppressed\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Indicates whether this anomaly is currently suppressed. To suppress an anomaly, use <a href=\\\"https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_UpdateAnomaly.html\\\">UpdateAnomaly</a>.</p>\"\
        },\
        \"suppressedDate\":{\
          \"shape\":\"EpochMillis\",\
          \"documentation\":\"<p>If the anomaly is suppressed, this indicates when it was suppressed.</p>\"\
        },\
        \"suppressedUntil\":{\
          \"shape\":\"EpochMillis\",\
          \"documentation\":\"<p>If the anomaly is suppressed, this indicates when the suppression will end. If this value is <code>0</code>, the anomaly was suppressed with no expiration, with the <code>INFINITE</code> value.</p>\"\
        },\
        \"isPatternLevelSuppression\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>If this anomaly is suppressed, this field is <code>true</code> if the suppression is because the pattern is suppressed. If <code>false</code>, then only this particular anomaly is suppressed.</p>\"\
        }\
      },\
      \"documentation\":\"<p>This structure represents one anomaly that has been found by a logs anomaly detector.</p> <p>For more information about patterns and anomalies, see <a href=\\\"https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_CreateLogAnomalyDetector.html\\\">CreateLogAnomalyDetector</a>. </p>\"\
    },\
    \"AnomalyDetector\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"anomalyDetectorArn\":{\
          \"shape\":\"AnomalyDetectorArn\",\
          \"documentation\":\"<p>The ARN of the anomaly detector.</p>\"\
        },\
        \"detectorName\":{\
          \"shape\":\"DetectorName\",\
          \"documentation\":\"<p>The name of the anomaly detector.</p>\"\
        },\
        \"logGroupArnList\":{\
          \"shape\":\"LogGroupArnList\",\
          \"documentation\":\"<p>A list of the ARNs of the log groups that this anomaly detector watches.</p>\"\
        },\
        \"evaluationFrequency\":{\
          \"shape\":\"EvaluationFrequency\",\
          \"documentation\":\"<p>Specifies how often the anomaly detector runs and look for anomalies.</p>\"\
        },\
        \"filterPattern\":{\"shape\":\"FilterPattern\"},\
        \"anomalyDetectorStatus\":{\
          \"shape\":\"AnomalyDetectorStatus\",\
          \"documentation\":\"<p>Specifies the current status of the anomaly detector. To pause an anomaly detector, use the <code>enabled</code> parameter in the <a href=\\\"https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_UpdateLogAnomalyDetector.html\\\">UpdateLogAnomalyDetector</a> operation.</p>\"\
        },\
        \"kmsKeyId\":{\
          \"shape\":\"KmsKeyId\",\
          \"documentation\":\"<p>The ID of the KMS key assigned to this anomaly detector, if any.</p>\"\
        },\
        \"creationTimeStamp\":{\
          \"shape\":\"EpochMillis\",\
          \"documentation\":\"<p>The date and time when this anomaly detector was created.</p>\"\
        },\
        \"lastModifiedTimeStamp\":{\
          \"shape\":\"EpochMillis\",\
          \"documentation\":\"<p>The date and time when this anomaly detector was most recently modified.</p>\"\
        },\
        \"anomalyVisibilityTime\":{\
          \"shape\":\"AnomalyVisibilityTime\",\
          \"documentation\":\"<p>The number of days used as the life cycle of anomalies. After this time, anomalies are automatically baselined and the anomaly detector model will treat new occurrences of similar event as normal. </p>\"\
        }\
      },\
      \"documentation\":\"<p>Contains information about one anomaly detector in the account.</p>\"\
    },\
    \"AnomalyDetectorArn\":{\
      \"type\":\"string\",\
      \"min\":1,\
      \"pattern\":\"[\\\\w#+=/:,.@-]*\"\
    },\
    \"AnomalyDetectorStatus\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"INITIALIZING\",\
        \"TRAINING\",\
        \"ANALYZING\",\
        \"FAILED\",\
        \"DELETED\",\
        \"PAUSED\"\
      ]\
    },\
    \"AnomalyDetectors\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"AnomalyDetector\"}\
    },\
    \"AnomalyId\":{\
      \"type\":\"string\",\
      \"max\":36,\
      \"min\":36\
    },\
    \"AnomalyVisibilityTime\":{\
      \"type\":\"long\",\
      \"max\":90,\
      \"min\":7\
    },\
    \"Arn\":{\"type\":\"string\"},\
    \"AssociateKmsKeyRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"kmsKeyId\"],\
      \"members\":{\
        \"logGroupName\":{\
          \"shape\":\"LogGroupName\",\
          \"documentation\":\"<p>The name of the log group.</p> <p>In your <code>AssociateKmsKey</code> operation, you must specify either the <code>resourceIdentifier</code> parameter or the <code>logGroup</code> parameter, but you can't specify both.</p>\"\
        },\
        \"kmsKeyId\":{\
          \"shape\":\"KmsKeyId\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the KMS key to use when encrypting log data. This must be a symmetric KMS key. For more information, see <a href=\\\"https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html#arn-syntax-kms\\\">Amazon Resource Names</a> and <a href=\\\"https://docs.aws.amazon.com/kms/latest/developerguide/symmetric-asymmetric.html\\\">Using Symmetric and Asymmetric Keys</a>.</p>\"\
        },\
        \"resourceIdentifier\":{\
          \"shape\":\"ResourceIdentifier\",\
          \"documentation\":\"<p>Specifies the target for this operation. You must specify one of the following:</p> <ul> <li> <p>Specify the following ARN to have future <a href=\\\"https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_GetQueryResults.html\\\">GetQueryResults</a> operations in this account encrypt the results with the specified KMS key. Replace <i>REGION</i> and <i>ACCOUNT_ID</i> with your Region and account ID.</p> <p> <code>arn:aws:logs:<i>REGION</i>:<i>ACCOUNT_ID</i>:query-result:*</code> </p> </li> <li> <p>Specify the ARN of a log group to have CloudWatch Logs use the KMS key to encrypt log events that are ingested and stored by that log group. The log group ARN must be in the following format. Replace <i>REGION</i> and <i>ACCOUNT_ID</i> with your Region and account ID.</p> <p> <code>arn:aws:logs:<i>REGION</i>:<i>ACCOUNT_ID</i>:log-group:<i>LOG_GROUP_NAME</i> </code> </p> </li> </ul> <p>In your <code>AssociateKmsKey</code> operation, you must specify either the <code>resourceIdentifier</code> parameter or the <code>logGroup</code> parameter, but you can't specify both.</p>\"\
        }\
      }\
    },\
    \"Boolean\":{\"type\":\"boolean\"},\
    \"CancelExportTaskRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"taskId\"],\
      \"members\":{\
        \"taskId\":{\
          \"shape\":\"ExportTaskId\",\
          \"documentation\":\"<p>The ID of the export task.</p>\"\
        }\
      }\
    },\
    \"ClientToken\":{\
      \"type\":\"string\",\
      \"max\":128,\
      \"min\":36,\
      \"pattern\":\"\\\\S{36,128}\"\
    },\
    \"ConflictException\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p>This operation attempted to create a resource that already exists.</p>\",\
      \"exception\":true\
    },\
    \"Count\":{\"type\":\"long\"},\
    \"CreateDeliveryRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"deliverySourceName\",\
        \"deliveryDestinationArn\"\
      ],\
      \"members\":{\
        \"deliverySourceName\":{\
          \"shape\":\"DeliverySourceName\",\
          \"documentation\":\"<p>The name of the delivery source to use for this delivery.</p>\"\
        },\
        \"deliveryDestinationArn\":{\
          \"shape\":\"Arn\",\
          \"documentation\":\"<p>The ARN of the delivery destination to use for this delivery.</p>\"\
        },\
        \"tags\":{\
          \"shape\":\"Tags\",\
          \"documentation\":\"<p>An optional list of key-value pairs to associate with the resource.</p> <p>For more information about tagging, see <a href=\\\"https://docs.aws.amazon.com/general/latest/gr/aws_tagging.html\\\">Tagging Amazon Web Services resources</a> </p>\"\
        }\
      }\
    },\
    \"CreateDeliveryResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"delivery\":{\
          \"shape\":\"Delivery\",\
          \"documentation\":\"<p>A structure that contains information about the delivery that you just created.</p>\"\
        }\
      }\
    },\
    \"CreateExportTaskRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"logGroupName\",\
        \"from\",\
        \"to\",\
        \"destination\"\
      ],\
      \"members\":{\
        \"taskName\":{\
          \"shape\":\"ExportTaskName\",\
          \"documentation\":\"<p>The name of the export task.</p>\"\
        },\
        \"logGroupName\":{\
          \"shape\":\"LogGroupName\",\
          \"documentation\":\"<p>The name of the log group.</p>\"\
        },\
        \"logStreamNamePrefix\":{\
          \"shape\":\"LogStreamName\",\
          \"documentation\":\"<p>Export only log streams that match the provided prefix. If you don't specify a value, no prefix filter is applied.</p>\"\
        },\
        \"from\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The start time of the range for the request, expressed as the number of milliseconds after <code>Jan 1, 1970 00:00:00 UTC</code>. Events with a timestamp earlier than this time are not exported.</p>\"\
        },\
        \"to\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The end time of the range for the request, expressed as the number of milliseconds after <code>Jan 1, 1970 00:00:00 UTC</code>. Events with a timestamp later than this time are not exported.</p> <p>You must specify a time that is not earlier than when this log group was created.</p>\"\
        },\
        \"destination\":{\
          \"shape\":\"ExportDestinationBucket\",\
          \"documentation\":\"<p>The name of S3 bucket for the exported log data. The bucket must be in the same Amazon Web Services Region.</p>\"\
        },\
        \"destinationPrefix\":{\
          \"shape\":\"ExportDestinationPrefix\",\
          \"documentation\":\"<p>The prefix used as the start of the key for every object exported. If you don't specify a value, the default is <code>exportedlogs</code>.</p>\"\
        }\
      }\
    },\
    \"CreateExportTaskResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"taskId\":{\
          \"shape\":\"ExportTaskId\",\
          \"documentation\":\"<p>The ID of the export task.</p>\"\
        }\
      }\
    },\
    \"CreateLogAnomalyDetectorRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"logGroupArnList\"],\
      \"members\":{\
        \"logGroupArnList\":{\
          \"shape\":\"LogGroupArnList\",\
          \"documentation\":\"<p>An array containing the ARN of the log group that this anomaly detector will watch. You can specify only one log group ARN.</p>\"\
        },\
        \"detectorName\":{\
          \"shape\":\"DetectorName\",\
          \"documentation\":\"<p>A name for this anomaly detector.</p>\"\
        },\
        \"evaluationFrequency\":{\
          \"shape\":\"EvaluationFrequency\",\
          \"documentation\":\"<p>Specifies how often the anomaly detector is to run and look for anomalies. Set this value according to the frequency that the log group receives new logs. For example, if the log group receives new log events every 10 minutes, then 15 minutes might be a good setting for <code>evaluationFrequency</code> .</p>\"\
        },\
        \"filterPattern\":{\
          \"shape\":\"FilterPattern\",\
          \"documentation\":\"<p>You can use this parameter to limit the anomaly detection model to examine only log events that match the pattern you specify here. For more information, see <a href=\\\"https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/FilterAndPatternSyntax.html\\\">Filter and Pattern Syntax</a>.</p>\"\
        },\
        \"kmsKeyId\":{\
          \"shape\":\"KmsKeyId\",\
          \"documentation\":\"<p>Optionally assigns a KMS key to secure this anomaly detector and its findings. If a key is assigned, the anomalies found and the model used by this detector are encrypted at rest with the key. If a key is assigned to an anomaly detector, a user must have permissions for both this key and for the anomaly detector to retrieve information about the anomalies that it finds.</p> <p>For more information about using a KMS key and to see the required IAM policy, see <a href=\\\"https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/LogsAnomalyDetection-KMS.html\\\">Use a KMS key with an anomaly detector</a>.</p>\"\
        },\
        \"anomalyVisibilityTime\":{\
          \"shape\":\"AnomalyVisibilityTime\",\
          \"documentation\":\"<p>The number of days to have visibility on an anomaly. After this time period has elapsed for an anomaly, it will be automatically baselined and the anomaly detector will treat new occurrences of a similar anomaly as normal. Therefore, if you do not correct the cause of an anomaly during the time period specified in <code>anomalyVisibilityTime</code>, it will be considered normal going forward and will not be detected as an anomaly.</p>\"\
        },\
        \"tags\":{\
          \"shape\":\"Tags\",\
          \"documentation\":\"<p>An optional list of key-value pairs to associate with the resource.</p> <p>For more information about tagging, see <a href=\\\"https://docs.aws.amazon.com/general/latest/gr/aws_tagging.html\\\">Tagging Amazon Web Services resources</a> </p>\"\
        }\
      }\
    },\
    \"CreateLogAnomalyDetectorResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"anomalyDetectorArn\":{\
          \"shape\":\"AnomalyDetectorArn\",\
          \"documentation\":\"<p>The ARN of the log anomaly detector that you just created.</p>\"\
        }\
      }\
    },\
    \"CreateLogGroupRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"logGroupName\"],\
      \"members\":{\
        \"logGroupName\":{\
          \"shape\":\"LogGroupName\",\
          \"documentation\":\"<p>A name for the log group.</p>\"\
        },\
        \"kmsKeyId\":{\
          \"shape\":\"KmsKeyId\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the KMS key to use when encrypting log data. For more information, see <a href=\\\"https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html#arn-syntax-kms\\\">Amazon Resource Names</a>.</p>\"\
        },\
        \"tags\":{\
          \"shape\":\"Tags\",\
          \"documentation\":\"<p>The key-value pairs to use for the tags.</p> <p>You can grant users access to certain log groups while preventing them from accessing other log groups. To do so, tag your groups and use IAM policies that refer to those tags. To assign tags when you create a log group, you must have either the <code>logs:TagResource</code> or <code>logs:TagLogGroup</code> permission. For more information about tagging, see <a href=\\\"https://docs.aws.amazon.com/general/latest/gr/aws_tagging.html\\\">Tagging Amazon Web Services resources</a>. For more information about using tags to control access, see <a href=\\\"https://docs.aws.amazon.com/IAM/latest/UserGuide/access_tags.html\\\">Controlling access to Amazon Web Services resources using tags</a>.</p>\"\
        },\
        \"logGroupClass\":{\
          \"shape\":\"LogGroupClass\",\
          \"documentation\":\"<p>Use this parameter to specify the log group class for this log group. There are two classes:</p> <ul> <li> <p>The <code>Standard</code> log class supports all CloudWatch Logs features.</p> </li> <li> <p>The <code>Infrequent Access</code> log class supports a subset of CloudWatch Logs features and incurs lower costs.</p> </li> </ul> <p>If you omit this parameter, the default of <code>STANDARD</code> is used.</p> <important> <p>The value of <code>logGroupClass</code> can't be changed after a log group is created.</p> </important> <p>For details about the features supported by each class, see <a href=\\\"https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/CloudWatch_Logs_Log_Classes.html\\\">Log classes</a> </p>\"\
        }\
      }\
    },\
    \"CreateLogStreamRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"logGroupName\",\
        \"logStreamName\"\
      ],\
      \"members\":{\
        \"logGroupName\":{\
          \"shape\":\"LogGroupName\",\
          \"documentation\":\"<p>The name of the log group.</p>\"\
        },\
        \"logStreamName\":{\
          \"shape\":\"LogStreamName\",\
          \"documentation\":\"<p>The name of the log stream.</p>\"\
        }\
      }\
    },\
    \"DataAlreadyAcceptedException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"expectedSequenceToken\":{\"shape\":\"SequenceToken\"}\
      },\
      \"documentation\":\"<p>The event was already logged.</p> <important> <p> <code>PutLogEvents</code> actions are now always accepted and never return <code>DataAlreadyAcceptedException</code> regardless of whether a given batch of log events has already been accepted. </p> </important>\",\
      \"exception\":true\
    },\
    \"DataProtectionPolicyDocument\":{\"type\":\"string\"},\
    \"DataProtectionStatus\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"ACTIVATED\",\
        \"DELETED\",\
        \"ARCHIVED\",\
        \"DISABLED\"\
      ]\
    },\
    \"Days\":{\
      \"type\":\"integer\",\
      \"documentation\":\"<p>The number of days to retain the log events in the specified log group. Possible values are: 1, 3, 5, 7, 14, 30, 60, 90, 120, 150, 180, 365, 400, 545, 731, 1096, 1827, 2192, 2557, 2922, 3288, and 3653.</p> <p>To set a log group so that its log events do not expire, use <a href=\\\"https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_DeleteRetentionPolicy.html\\\">DeleteRetentionPolicy</a>. </p>\"\
    },\
    \"DefaultValue\":{\"type\":\"double\"},\
    \"DeleteAccountPolicyRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"policyName\",\
        \"policyType\"\
      ],\
      \"members\":{\
        \"policyName\":{\
          \"shape\":\"PolicyName\",\
          \"documentation\":\"<p>The name of the policy to delete.</p>\"\
        },\
        \"policyType\":{\
          \"shape\":\"PolicyType\",\
          \"documentation\":\"<p>The type of policy to delete.</p>\"\
        }\
      }\
    },\
    \"DeleteDataProtectionPolicyRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"logGroupIdentifier\"],\
      \"members\":{\
        \"logGroupIdentifier\":{\
          \"shape\":\"LogGroupIdentifier\",\
          \"documentation\":\"<p>The name or ARN of the log group that you want to delete the data protection policy for.</p>\"\
        }\
      }\
    },\
    \"DeleteDeliveryDestinationPolicyRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"deliveryDestinationName\"],\
      \"members\":{\
        \"deliveryDestinationName\":{\
          \"shape\":\"DeliveryDestinationName\",\
          \"documentation\":\"<p>The name of the delivery destination that you want to delete the policy for.</p>\"\
        }\
      }\
    },\
    \"DeleteDeliveryDestinationRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"name\"],\
      \"members\":{\
        \"name\":{\
          \"shape\":\"DeliveryDestinationName\",\
          \"documentation\":\"<p>The name of the delivery destination that you want to delete. You can find a list of delivery destionation names by using the <a href=\\\"https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_DescribeDeliveryDestinations.html\\\">DescribeDeliveryDestinations</a> operation.</p>\"\
        }\
      }\
    },\
    \"DeleteDeliveryRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"id\"],\
      \"members\":{\
        \"id\":{\
          \"shape\":\"DeliveryId\",\
          \"documentation\":\"<p>The unique ID of the delivery to delete. You can find the ID of a delivery with the <a href=\\\"https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_DescribeDeliveries.html\\\">DescribeDeliveries</a> operation.</p>\"\
        }\
      }\
    },\
    \"DeleteDeliverySourceRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"name\"],\
      \"members\":{\
        \"name\":{\
          \"shape\":\"DeliverySourceName\",\
          \"documentation\":\"<p>The name of the delivery source that you want to delete.</p>\"\
        }\
      }\
    },\
    \"DeleteDestinationRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"destinationName\"],\
      \"members\":{\
        \"destinationName\":{\
          \"shape\":\"DestinationName\",\
          \"documentation\":\"<p>The name of the destination.</p>\"\
        }\
      }\
    },\
    \"DeleteLogAnomalyDetectorRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"anomalyDetectorArn\"],\
      \"members\":{\
        \"anomalyDetectorArn\":{\
          \"shape\":\"AnomalyDetectorArn\",\
          \"documentation\":\"<p>The ARN of the anomaly detector to delete. You can find the ARNs of log anomaly detectors in your account by using the <a href=\\\"https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_ListLogAnomalyDetectors.html\\\">ListLogAnomalyDetectors</a> operation.</p>\"\
        }\
      }\
    },\
    \"DeleteLogGroupRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"logGroupName\"],\
      \"members\":{\
        \"logGroupName\":{\
          \"shape\":\"LogGroupName\",\
          \"documentation\":\"<p>The name of the log group.</p>\"\
        }\
      }\
    },\
    \"DeleteLogStreamRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"logGroupName\",\
        \"logStreamName\"\
      ],\
      \"members\":{\
        \"logGroupName\":{\
          \"shape\":\"LogGroupName\",\
          \"documentation\":\"<p>The name of the log group.</p>\"\
        },\
        \"logStreamName\":{\
          \"shape\":\"LogStreamName\",\
          \"documentation\":\"<p>The name of the log stream.</p>\"\
        }\
      }\
    },\
    \"DeleteMetricFilterRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"logGroupName\",\
        \"filterName\"\
      ],\
      \"members\":{\
        \"logGroupName\":{\
          \"shape\":\"LogGroupName\",\
          \"documentation\":\"<p>The name of the log group.</p>\"\
        },\
        \"filterName\":{\
          \"shape\":\"FilterName\",\
          \"documentation\":\"<p>The name of the metric filter.</p>\"\
        }\
      }\
    },\
    \"DeleteQueryDefinitionRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"queryDefinitionId\"],\
      \"members\":{\
        \"queryDefinitionId\":{\
          \"shape\":\"QueryId\",\
          \"documentation\":\"<p>The ID of the query definition that you want to delete. You can use <a href=\\\"https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_DescribeQueryDefinitions.html\\\">DescribeQueryDefinitions</a> to retrieve the IDs of your saved query definitions.</p>\"\
        }\
      }\
    },\
    \"DeleteQueryDefinitionResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"success\":{\
          \"shape\":\"Success\",\
          \"documentation\":\"<p>A value of TRUE indicates that the operation succeeded. FALSE indicates that the operation failed.</p>\"\
        }\
      }\
    },\
    \"DeleteResourcePolicyRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"policyName\":{\
          \"shape\":\"PolicyName\",\
          \"documentation\":\"<p>The name of the policy to be revoked. This parameter is required.</p>\"\
        }\
      }\
    },\
    \"DeleteRetentionPolicyRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"logGroupName\"],\
      \"members\":{\
        \"logGroupName\":{\
          \"shape\":\"LogGroupName\",\
          \"documentation\":\"<p>The name of the log group.</p>\"\
        }\
      }\
    },\
    \"DeleteSubscriptionFilterRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"logGroupName\",\
        \"filterName\"\
      ],\
      \"members\":{\
        \"logGroupName\":{\
          \"shape\":\"LogGroupName\",\
          \"documentation\":\"<p>The name of the log group.</p>\"\
        },\
        \"filterName\":{\
          \"shape\":\"FilterName\",\
          \"documentation\":\"<p>The name of the subscription filter.</p>\"\
        }\
      }\
    },\
    \"Deliveries\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"Delivery\"}\
    },\
    \"Delivery\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"id\":{\
          \"shape\":\"DeliveryId\",\
          \"documentation\":\"<p>The unique ID that identifies this delivery in your account.</p>\"\
        },\
        \"arn\":{\
          \"shape\":\"Arn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) that uniquely identifies this delivery.</p>\"\
        },\
        \"deliverySourceName\":{\
          \"shape\":\"DeliverySourceName\",\
          \"documentation\":\"<p>The name of the delivery source that is associated with this delivery.</p>\"\
        },\
        \"deliveryDestinationArn\":{\
          \"shape\":\"Arn\",\
          \"documentation\":\"<p>The ARN of the delivery destination that is associated with this delivery.</p>\"\
        },\
        \"deliveryDestinationType\":{\
          \"shape\":\"DeliveryDestinationType\",\
          \"documentation\":\"<p>Displays whether the delivery destination associated with this delivery is CloudWatch Logs, Amazon S3, or Firehose.</p>\"\
        },\
        \"tags\":{\
          \"shape\":\"Tags\",\
          \"documentation\":\"<p>The tags that have been assigned to this delivery.</p>\"\
        }\
      },\
      \"documentation\":\"<p>This structure contains information about one <i>delivery</i> in your account. </p> <p>A delivery is a connection between a logical <i>delivery source</i> and a logical <i>delivery destination</i>.</p> <p>For more information, see <a href=\\\"https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_CreateDelivery.html\\\">CreateDelivery</a>.</p> <p>You can't update an existing delivery. You can only create and delete deliveries.</p>\"\
    },\
    \"DeliveryDestination\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"name\":{\
          \"shape\":\"DeliveryDestinationName\",\
          \"documentation\":\"<p>The name of this delivery destination.</p>\"\
        },\
        \"arn\":{\
          \"shape\":\"Arn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) that uniquely identifies this delivery destination.</p>\"\
        },\
        \"deliveryDestinationType\":{\
          \"shape\":\"DeliveryDestinationType\",\
          \"documentation\":\"<p>Displays whether this delivery destination is CloudWatch Logs, Amazon S3, or Firehose.</p>\"\
        },\
        \"outputFormat\":{\
          \"shape\":\"OutputFormat\",\
          \"documentation\":\"<p>The format of the logs that are sent to this delivery destination. </p>\"\
        },\
        \"deliveryDestinationConfiguration\":{\
          \"shape\":\"DeliveryDestinationConfiguration\",\
          \"documentation\":\"<p>A structure that contains the ARN of the Amazon Web Services resource that will receive the logs.</p>\"\
        },\
        \"tags\":{\
          \"shape\":\"Tags\",\
          \"documentation\":\"<p>The tags that have been assigned to this delivery destination.</p>\"\
        }\
      },\
      \"documentation\":\"<p>This structure contains information about one <i>delivery destination</i> in your account. A delivery destination is an Amazon Web Services resource that represents an Amazon Web Services service that logs can be sent to. CloudWatch Logs, Amazon S3, are supported as Firehose delivery destinations.</p> <p>To configure logs delivery between a supported Amazon Web Services service and a destination, you must do the following:</p> <ul> <li> <p>Create a delivery source, which is a logical object that represents the resource that is actually sending the logs. For more information, see <a href=\\\"https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_PutDeliverySource.html\\\">PutDeliverySource</a>.</p> </li> <li> <p>Create a <i>delivery destination</i>, which is a logical object that represents the actual delivery destination. </p> </li> <li> <p>If you are delivering logs cross-account, you must use <a href=\\\"https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_PutDeliveryDestinationPolicy.html\\\">PutDeliveryDestinationPolicy</a> in the destination account to assign an IAM policy to the destination. This policy allows delivery to that destination. </p> </li> <li> <p>Create a <i>delivery</i> by pairing exactly one delivery source and one delivery destination. For more information, see <a href=\\\"https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_CreateDelivery.html\\\">CreateDelivery</a>.</p> </li> </ul> <p>You can configure a single delivery source to send logs to multiple destinations by creating multiple deliveries. You can also create multiple deliveries to configure multiple delivery sources to send logs to the same delivery destination.</p>\"\
    },\
    \"DeliveryDestinationConfiguration\":{\
      \"type\":\"structure\",\
      \"required\":[\"destinationResourceArn\"],\
      \"members\":{\
        \"destinationResourceArn\":{\
          \"shape\":\"Arn\",\
          \"documentation\":\"<p>The ARN of the Amazon Web Services destination that this delivery destination represents. That Amazon Web Services destination can be a log group in CloudWatch Logs, an Amazon S3 bucket, or a delivery stream in Firehose.</p>\"\
        }\
      },\
      \"documentation\":\"<p>A structure that contains information about one logs delivery destination.</p>\"\
    },\
    \"DeliveryDestinationName\":{\
      \"type\":\"string\",\
      \"max\":60,\
      \"min\":1,\
      \"pattern\":\"[\\\\w-]*\"\
    },\
    \"DeliveryDestinationPolicy\":{\
      \"type\":\"string\",\
      \"max\":51200,\
      \"min\":1\
    },\
    \"DeliveryDestinationType\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"S3\",\
        \"CWL\",\
        \"FH\"\
      ]\
    },\
    \"DeliveryDestinations\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"DeliveryDestination\"}\
    },\
    \"DeliveryId\":{\
      \"type\":\"string\",\
      \"max\":64,\
      \"min\":1,\
      \"pattern\":\"^[0-9A-Za-z]+$\"\
    },\
    \"DeliverySource\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"name\":{\
          \"shape\":\"DeliverySourceName\",\
          \"documentation\":\"<p>The unique name of the delivery source.</p>\"\
        },\
        \"arn\":{\
          \"shape\":\"Arn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) that uniquely identifies this delivery source.</p>\"\
        },\
        \"resourceArns\":{\
          \"shape\":\"ResourceArns\",\
          \"documentation\":\"<p>This array contains the ARN of the Amazon Web Services resource that sends logs and is represented by this delivery source. Currently, only one ARN can be in the array.</p>\"\
        },\
        \"service\":{\
          \"shape\":\"Service\",\
          \"documentation\":\"<p>The Amazon Web Services service that is sending logs.</p>\"\
        },\
        \"logType\":{\
          \"shape\":\"LogType\",\
          \"documentation\":\"<p>The type of log that the source is sending. For valid values for this parameter, see the documentation for the source service.</p>\"\
        },\
        \"tags\":{\
          \"shape\":\"Tags\",\
          \"documentation\":\"<p>The tags that have been assigned to this delivery source.</p>\"\
        }\
      },\
      \"documentation\":\"<p>This structure contains information about one <i>delivery source</i> in your account. A delivery source is an Amazon Web Services resource that sends logs to an Amazon Web Services destination. The destination can be CloudWatch Logs, Amazon S3, or Firehose.</p> <p>Only some Amazon Web Services services support being configured as a delivery source. These services are listed as <b>Supported [V2 Permissions]</b> in the table at <a href=\\\"https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/AWS-logs-and-resource-policy.html\\\">Enabling logging from Amazon Web Services services.</a> </p> <p>To configure logs delivery between a supported Amazon Web Services service and a destination, you must do the following:</p> <ul> <li> <p>Create a delivery source, which is a logical object that represents the resource that is actually sending the logs. For more information, see <a href=\\\"https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_PutDeliverySource.html\\\">PutDeliverySource</a>.</p> </li> <li> <p>Create a <i>delivery destination</i>, which is a logical object that represents the actual delivery destination. For more information, see <a href=\\\"https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_PutDeliveryDestination.html\\\">PutDeliveryDestination</a>.</p> </li> <li> <p>If you are delivering logs cross-account, you must use <a href=\\\"https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_PutDeliveryDestinationPolicy.html\\\">PutDeliveryDestinationPolicy</a> in the destination account to assign an IAM policy to the destination. This policy allows delivery to that destination. </p> </li> <li> <p>Create a <i>delivery</i> by pairing exactly one delivery source and one delivery destination. For more information, see <a href=\\\"https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_CreateDelivery.html\\\">CreateDelivery</a>.</p> </li> </ul> <p>You can configure a single delivery source to send logs to multiple destinations by creating multiple deliveries. You can also create multiple deliveries to configure multiple delivery sources to send logs to the same delivery destination.</p>\"\
    },\
    \"DeliverySourceName\":{\
      \"type\":\"string\",\
      \"max\":60,\
      \"min\":1,\
      \"pattern\":\"[\\\\w-]*\"\
    },\
    \"DeliverySources\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"DeliverySource\"}\
    },\
    \"Descending\":{\"type\":\"boolean\"},\
    \"DescribeAccountPoliciesRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"policyType\"],\
      \"members\":{\
        \"policyType\":{\
          \"shape\":\"PolicyType\",\
          \"documentation\":\"<p>Use this parameter to limit the returned policies to only the policies that match the policy type that you specify.</p>\"\
        },\
        \"policyName\":{\
          \"shape\":\"PolicyName\",\
          \"documentation\":\"<p>Use this parameter to limit the returned policies to only the policy with the name that you specify.</p>\"\
        },\
        \"accountIdentifiers\":{\
          \"shape\":\"AccountIds\",\
          \"documentation\":\"<p>If you are using an account that is set up as a monitoring account for CloudWatch unified cross-account observability, you can use this to specify the account ID of a source account. If you do, the operation returns the account policy for the specified account. Currently, you can specify only one account ID in this parameter.</p> <p>If you omit this parameter, only the policy in the current account is returned.</p>\"\
        }\
      }\
    },\
    \"DescribeAccountPoliciesResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"accountPolicies\":{\
          \"shape\":\"AccountPolicies\",\
          \"documentation\":\"<p>An array of structures that contain information about the CloudWatch Logs account policies that match the specified filters.</p>\"\
        }\
      }\
    },\
    \"DescribeDeliveriesRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"nextToken\":{\"shape\":\"NextToken\"},\
        \"limit\":{\
          \"shape\":\"DescribeLimit\",\
          \"documentation\":\"<p>Optionally specify the maximum number of deliveries to return in the response.</p>\"\
        }\
      }\
    },\
    \"DescribeDeliveriesResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"deliveries\":{\
          \"shape\":\"Deliveries\",\
          \"documentation\":\"<p>An array of structures. Each structure contains information about one delivery in the account.</p>\"\
        },\
        \"nextToken\":{\"shape\":\"NextToken\"}\
      }\
    },\
    \"DescribeDeliveryDestinationsRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"nextToken\":{\"shape\":\"NextToken\"},\
        \"limit\":{\
          \"shape\":\"DescribeLimit\",\
          \"documentation\":\"<p>Optionally specify the maximum number of delivery destinations to return in the response.</p>\"\
        }\
      }\
    },\
    \"DescribeDeliveryDestinationsResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"deliveryDestinations\":{\
          \"shape\":\"DeliveryDestinations\",\
          \"documentation\":\"<p>An array of structures. Each structure contains information about one delivery destination in the account.</p>\"\
        },\
        \"nextToken\":{\"shape\":\"NextToken\"}\
      }\
    },\
    \"DescribeDeliverySourcesRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"nextToken\":{\"shape\":\"NextToken\"},\
        \"limit\":{\
          \"shape\":\"DescribeLimit\",\
          \"documentation\":\"<p>Optionally specify the maximum number of delivery sources to return in the response.</p>\"\
        }\
      }\
    },\
    \"DescribeDeliverySourcesResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"deliverySources\":{\
          \"shape\":\"DeliverySources\",\
          \"documentation\":\"<p>An array of structures. Each structure contains information about one delivery source in the account.</p>\"\
        },\
        \"nextToken\":{\"shape\":\"NextToken\"}\
      }\
    },\
    \"DescribeDestinationsRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"DestinationNamePrefix\":{\
          \"shape\":\"DestinationName\",\
          \"documentation\":\"<p>The prefix to match. If you don't specify a value, no prefix filter is applied.</p>\"\
        },\
        \"nextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>The token for the next set of items to return. (You received this token from a previous call.)</p>\"\
        },\
        \"limit\":{\
          \"shape\":\"DescribeLimit\",\
          \"documentation\":\"<p>The maximum number of items returned. If you don't specify a value, the default maximum value of 50 items is used.</p>\"\
        }\
      }\
    },\
    \"DescribeDestinationsResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"destinations\":{\
          \"shape\":\"Destinations\",\
          \"documentation\":\"<p>The destinations.</p>\"\
        },\
        \"nextToken\":{\"shape\":\"NextToken\"}\
      }\
    },\
    \"DescribeExportTasksRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"taskId\":{\
          \"shape\":\"ExportTaskId\",\
          \"documentation\":\"<p>The ID of the export task. Specifying a task ID filters the results to one or zero export tasks.</p>\"\
        },\
        \"statusCode\":{\
          \"shape\":\"ExportTaskStatusCode\",\
          \"documentation\":\"<p>The status code of the export task. Specifying a status code filters the results to zero or more export tasks.</p>\"\
        },\
        \"nextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>The token for the next set of items to return. (You received this token from a previous call.)</p>\"\
        },\
        \"limit\":{\
          \"shape\":\"DescribeLimit\",\
          \"documentation\":\"<p>The maximum number of items returned. If you don't specify a value, the default is up to 50 items.</p>\"\
        }\
      }\
    },\
    \"DescribeExportTasksResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"exportTasks\":{\
          \"shape\":\"ExportTasks\",\
          \"documentation\":\"<p>The export tasks.</p>\"\
        },\
        \"nextToken\":{\"shape\":\"NextToken\"}\
      }\
    },\
    \"DescribeLimit\":{\
      \"type\":\"integer\",\
      \"max\":50,\
      \"min\":1\
    },\
    \"DescribeLogGroupsRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"accountIdentifiers\":{\
          \"shape\":\"AccountIds\",\
          \"documentation\":\"<p>When <code>includeLinkedAccounts</code> is set to <code>True</code>, use this parameter to specify the list of accounts to search. You can specify as many as 20 account IDs in the array. </p>\"\
        },\
        \"logGroupNamePrefix\":{\
          \"shape\":\"LogGroupName\",\
          \"documentation\":\"<p>The prefix to match.</p> <note> <p> <code>logGroupNamePrefix</code> and <code>logGroupNamePattern</code> are mutually exclusive. Only one of these parameters can be passed. </p> </note>\"\
        },\
        \"logGroupNamePattern\":{\
          \"shape\":\"LogGroupNamePattern\",\
          \"documentation\":\"<p>If you specify a string for this parameter, the operation returns only log groups that have names that match the string based on a case-sensitive substring search. For example, if you specify <code>Foo</code>, log groups named <code>FooBar</code>, <code>aws/Foo</code>, and <code>GroupFoo</code> would match, but <code>foo</code>, <code>F/o/o</code> and <code>Froo</code> would not match.</p> <p>If you specify <code>logGroupNamePattern</code> in your request, then only <code>arn</code>, <code>creationTime</code>, and <code>logGroupName</code> are included in the response. </p> <note> <p> <code>logGroupNamePattern</code> and <code>logGroupNamePrefix</code> are mutually exclusive. Only one of these parameters can be passed. </p> </note>\"\
        },\
        \"nextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>The token for the next set of items to return. (You received this token from a previous call.)</p>\"\
        },\
        \"limit\":{\
          \"shape\":\"DescribeLimit\",\
          \"documentation\":\"<p>The maximum number of items returned. If you don't specify a value, the default is up to 50 items.</p>\"\
        },\
        \"includeLinkedAccounts\":{\
          \"shape\":\"IncludeLinkedAccounts\",\
          \"documentation\":\"<p>If you are using a monitoring account, set this to <code>True</code> to have the operation return log groups in the accounts listed in <code>accountIdentifiers</code>.</p> <p>If this parameter is set to <code>true</code> and <code>accountIdentifiers</code> contains a null value, the operation returns all log groups in the monitoring account and all log groups in all source accounts that are linked to the monitoring account. </p>\"\
        },\
        \"logGroupClass\":{\
          \"shape\":\"LogGroupClass\",\
          \"documentation\":\"<p>Specifies the log group class for this log group. There are two classes:</p> <ul> <li> <p>The <code>Standard</code> log class supports all CloudWatch Logs features.</p> </li> <li> <p>The <code>Infrequent Access</code> log class supports a subset of CloudWatch Logs features and incurs lower costs.</p> </li> </ul> <p>For details about the features supported by each class, see <a href=\\\"https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/CloudWatch_Logs_Log_Classes.html\\\">Log classes</a> </p>\"\
        }\
      }\
    },\
    \"DescribeLogGroupsResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"logGroups\":{\
          \"shape\":\"LogGroups\",\
          \"documentation\":\"<p>The log groups.</p> <p>If the <code>retentionInDays</code> value is not included for a log group, then that log group's events do not expire.</p>\"\
        },\
        \"nextToken\":{\"shape\":\"NextToken\"}\
      }\
    },\
    \"DescribeLogStreamsRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"logGroupName\":{\
          \"shape\":\"LogGroupName\",\
          \"documentation\":\"<p>The name of the log group.</p> <note> <p> You must include either <code>logGroupIdentifier</code> or <code>logGroupName</code>, but not both. </p> </note>\"\
        },\
        \"logGroupIdentifier\":{\
          \"shape\":\"LogGroupIdentifier\",\
          \"documentation\":\"<p>Specify either the name or ARN of the log group to view. If the log group is in a source account and you are using a monitoring account, you must use the log group ARN.</p> <note> <p> You must include either <code>logGroupIdentifier</code> or <code>logGroupName</code>, but not both. </p> </note>\"\
        },\
        \"logStreamNamePrefix\":{\
          \"shape\":\"LogStreamName\",\
          \"documentation\":\"<p>The prefix to match.</p> <p>If <code>orderBy</code> is <code>LastEventTime</code>, you cannot specify this parameter.</p>\"\
        },\
        \"orderBy\":{\
          \"shape\":\"OrderBy\",\
          \"documentation\":\"<p>If the value is <code>LogStreamName</code>, the results are ordered by log stream name. If the value is <code>LastEventTime</code>, the results are ordered by the event time. The default value is <code>LogStreamName</code>.</p> <p>If you order the results by event time, you cannot specify the <code>logStreamNamePrefix</code> parameter.</p> <p> <code>lastEventTimestamp</code> represents the time of the most recent log event in the log stream in CloudWatch Logs. This number is expressed as the number of milliseconds after <code>Jan 1, 1970 00:00:00 UTC</code>. <code>lastEventTimestamp</code> updates on an eventual consistency basis. It typically updates in less than an hour from ingestion, but in rare situations might take longer.</p>\"\
        },\
        \"descending\":{\
          \"shape\":\"Descending\",\
          \"documentation\":\"<p>If the value is true, results are returned in descending order. If the value is to false, results are returned in ascending order. The default value is false.</p>\"\
        },\
        \"nextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>The token for the next set of items to return. (You received this token from a previous call.)</p>\"\
        },\
        \"limit\":{\
          \"shape\":\"DescribeLimit\",\
          \"documentation\":\"<p>The maximum number of items returned. If you don't specify a value, the default is up to 50 items.</p>\"\
        }\
      }\
    },\
    \"DescribeLogStreamsResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"logStreams\":{\
          \"shape\":\"LogStreams\",\
          \"documentation\":\"<p>The log streams.</p>\"\
        },\
        \"nextToken\":{\"shape\":\"NextToken\"}\
      }\
    },\
    \"DescribeMetricFiltersRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"logGroupName\":{\
          \"shape\":\"LogGroupName\",\
          \"documentation\":\"<p>The name of the log group.</p>\"\
        },\
        \"filterNamePrefix\":{\
          \"shape\":\"FilterName\",\
          \"documentation\":\"<p>The prefix to match. CloudWatch Logs uses the value that you set here only if you also include the <code>logGroupName</code> parameter in your request.</p>\"\
        },\
        \"nextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>The token for the next set of items to return. (You received this token from a previous call.)</p>\"\
        },\
        \"limit\":{\
          \"shape\":\"DescribeLimit\",\
          \"documentation\":\"<p>The maximum number of items returned. If you don't specify a value, the default is up to 50 items.</p>\"\
        },\
        \"metricName\":{\
          \"shape\":\"MetricName\",\
          \"documentation\":\"<p>Filters results to include only those with the specified metric name. If you include this parameter in your request, you must also include the <code>metricNamespace</code> parameter.</p>\"\
        },\
        \"metricNamespace\":{\
          \"shape\":\"MetricNamespace\",\
          \"documentation\":\"<p>Filters results to include only those in the specified namespace. If you include this parameter in your request, you must also include the <code>metricName</code> parameter.</p>\"\
        }\
      }\
    },\
    \"DescribeMetricFiltersResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"metricFilters\":{\
          \"shape\":\"MetricFilters\",\
          \"documentation\":\"<p>The metric filters.</p>\"\
        },\
        \"nextToken\":{\"shape\":\"NextToken\"}\
      }\
    },\
    \"DescribeQueriesMaxResults\":{\
      \"type\":\"integer\",\
      \"max\":1000,\
      \"min\":1\
    },\
    \"DescribeQueriesRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"logGroupName\":{\
          \"shape\":\"LogGroupName\",\
          \"documentation\":\"<p>Limits the returned queries to only those for the specified log group.</p>\"\
        },\
        \"status\":{\
          \"shape\":\"QueryStatus\",\
          \"documentation\":\"<p>Limits the returned queries to only those that have the specified status. Valid values are <code>Cancelled</code>, <code>Complete</code>, <code>Failed</code>, <code>Running</code>, and <code>Scheduled</code>.</p>\"\
        },\
        \"maxResults\":{\
          \"shape\":\"DescribeQueriesMaxResults\",\
          \"documentation\":\"<p>Limits the number of returned queries to the specified number.</p>\"\
        },\
        \"nextToken\":{\"shape\":\"NextToken\"}\
      }\
    },\
    \"DescribeQueriesResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"queries\":{\
          \"shape\":\"QueryInfoList\",\
          \"documentation\":\"<p>The list of queries that match the request.</p>\"\
        },\
        \"nextToken\":{\"shape\":\"NextToken\"}\
      }\
    },\
    \"DescribeQueryDefinitionsRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"queryDefinitionNamePrefix\":{\
          \"shape\":\"QueryDefinitionName\",\
          \"documentation\":\"<p>Use this parameter to filter your results to only the query definitions that have names that start with the prefix you specify.</p>\"\
        },\
        \"maxResults\":{\
          \"shape\":\"QueryListMaxResults\",\
          \"documentation\":\"<p>Limits the number of returned query definitions to the specified number.</p>\"\
        },\
        \"nextToken\":{\"shape\":\"NextToken\"}\
      }\
    },\
    \"DescribeQueryDefinitionsResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"queryDefinitions\":{\
          \"shape\":\"QueryDefinitionList\",\
          \"documentation\":\"<p>The list of query definitions that match your request.</p>\"\
        },\
        \"nextToken\":{\"shape\":\"NextToken\"}\
      }\
    },\
    \"DescribeResourcePoliciesRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"nextToken\":{\"shape\":\"NextToken\"},\
        \"limit\":{\
          \"shape\":\"DescribeLimit\",\
          \"documentation\":\"<p>The maximum number of resource policies to be displayed with one call of this API.</p>\"\
        }\
      }\
    },\
    \"DescribeResourcePoliciesResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"resourcePolicies\":{\
          \"shape\":\"ResourcePolicies\",\
          \"documentation\":\"<p>The resource policies that exist in this account.</p>\"\
        },\
        \"nextToken\":{\"shape\":\"NextToken\"}\
      }\
    },\
    \"DescribeSubscriptionFiltersRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"logGroupName\"],\
      \"members\":{\
        \"logGroupName\":{\
          \"shape\":\"LogGroupName\",\
          \"documentation\":\"<p>The name of the log group.</p>\"\
        },\
        \"filterNamePrefix\":{\
          \"shape\":\"FilterName\",\
          \"documentation\":\"<p>The prefix to match. If you don't specify a value, no prefix filter is applied.</p>\"\
        },\
        \"nextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>The token for the next set of items to return. (You received this token from a previous call.)</p>\"\
        },\
        \"limit\":{\
          \"shape\":\"DescribeLimit\",\
          \"documentation\":\"<p>The maximum number of items returned. If you don't specify a value, the default is up to 50 items.</p>\"\
        }\
      }\
    },\
    \"DescribeSubscriptionFiltersResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"subscriptionFilters\":{\
          \"shape\":\"SubscriptionFilters\",\
          \"documentation\":\"<p>The subscription filters.</p>\"\
        },\
        \"nextToken\":{\"shape\":\"NextToken\"}\
      }\
    },\
    \"Description\":{\
      \"type\":\"string\",\
      \"min\":1\
    },\
    \"Destination\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"destinationName\":{\
          \"shape\":\"DestinationName\",\
          \"documentation\":\"<p>The name of the destination.</p>\"\
        },\
        \"targetArn\":{\
          \"shape\":\"TargetArn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the physical target where the log events are delivered (for example, a Kinesis stream).</p>\"\
        },\
        \"roleArn\":{\
          \"shape\":\"RoleArn\",\
          \"documentation\":\"<p>A role for impersonation, used when delivering log events to the target.</p>\"\
        },\
        \"accessPolicy\":{\
          \"shape\":\"AccessPolicy\",\
          \"documentation\":\"<p>An IAM policy document that governs which Amazon Web Services accounts can create subscription filters against this destination.</p>\"\
        },\
        \"arn\":{\
          \"shape\":\"Arn\",\
          \"documentation\":\"<p>The ARN of this destination.</p>\"\
        },\
        \"creationTime\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The creation time of the destination, expressed as the number of milliseconds after Jan 1, 1970 00:00:00 UTC.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Represents a cross-account destination that receives subscription log events.</p>\"\
    },\
    \"DestinationArn\":{\
      \"type\":\"string\",\
      \"min\":1\
    },\
    \"DestinationName\":{\
      \"type\":\"string\",\
      \"max\":512,\
      \"min\":1,\
      \"pattern\":\"[^:*]*\"\
    },\
    \"Destinations\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"Destination\"}\
    },\
    \"DetectorName\":{\
      \"type\":\"string\",\
      \"min\":1\
    },\
    \"Dimensions\":{\
      \"type\":\"map\",\
      \"key\":{\"shape\":\"DimensionsKey\"},\
      \"value\":{\"shape\":\"DimensionsValue\"}\
    },\
    \"DimensionsKey\":{\
      \"type\":\"string\",\
      \"max\":255\
    },\
    \"DimensionsValue\":{\
      \"type\":\"string\",\
      \"max\":255\
    },\
    \"DisassociateKmsKeyRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"logGroupName\":{\
          \"shape\":\"LogGroupName\",\
          \"documentation\":\"<p>The name of the log group.</p> <p>In your <code>DisassociateKmsKey</code> operation, you must specify either the <code>resourceIdentifier</code> parameter or the <code>logGroup</code> parameter, but you can't specify both.</p>\"\
        },\
        \"resourceIdentifier\":{\
          \"shape\":\"ResourceIdentifier\",\
          \"documentation\":\"<p>Specifies the target for this operation. You must specify one of the following:</p> <ul> <li> <p>Specify the ARN of a log group to stop having CloudWatch Logs use the KMS key to encrypt log events that are ingested and stored by that log group. After you run this operation, CloudWatch Logs encrypts ingested log events with the default CloudWatch Logs method. The log group ARN must be in the following format. Replace <i>REGION</i> and <i>ACCOUNT_ID</i> with your Region and account ID.</p> <p> <code>arn:aws:logs:<i>REGION</i>:<i>ACCOUNT_ID</i>:log-group:<i>LOG_GROUP_NAME</i> </code> </p> </li> <li> <p>Specify the following ARN to stop using this key to encrypt the results of future <a href=\\\"https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_StartQuery.html\\\">StartQuery</a> operations in this account. Replace <i>REGION</i> and <i>ACCOUNT_ID</i> with your Region and account ID.</p> <p> <code>arn:aws:logs:<i>REGION</i>:<i>ACCOUNT_ID</i>:query-result:*</code> </p> </li> </ul> <p>In your <code>DisssociateKmsKey</code> operation, you must specify either the <code>resourceIdentifier</code> parameter or the <code>logGroup</code> parameter, but you can't specify both.</p>\"\
        }\
      }\
    },\
    \"Distribution\":{\
      \"type\":\"string\",\
      \"documentation\":\"<p>The method used to distribute log data to the destination, which can be either random or grouped by log stream.</p>\",\
      \"enum\":[\
        \"Random\",\
        \"ByLogStream\"\
      ]\
    },\
    \"DynamicTokenPosition\":{\"type\":\"integer\"},\
    \"EncryptionKey\":{\
      \"type\":\"string\",\
      \"max\":256\
    },\
    \"Enumerations\":{\
      \"type\":\"map\",\
      \"key\":{\"shape\":\"TokenString\"},\
      \"value\":{\"shape\":\"TokenValue\"}\
    },\
    \"EpochMillis\":{\
      \"type\":\"long\",\
      \"min\":0\
    },\
    \"EvaluationFrequency\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"ONE_MIN\",\
        \"FIVE_MIN\",\
        \"TEN_MIN\",\
        \"FIFTEEN_MIN\",\
        \"THIRTY_MIN\",\
        \"ONE_HOUR\"\
      ]\
    },\
    \"EventId\":{\"type\":\"string\"},\
    \"EventMessage\":{\
      \"type\":\"string\",\
      \"min\":1\
    },\
    \"EventNumber\":{\"type\":\"long\"},\
    \"EventsLimit\":{\
      \"type\":\"integer\",\
      \"max\":10000,\
      \"min\":1\
    },\
    \"ExportDestinationBucket\":{\
      \"type\":\"string\",\
      \"max\":512,\
      \"min\":1\
    },\
    \"ExportDestinationPrefix\":{\"type\":\"string\"},\
    \"ExportTask\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"taskId\":{\
          \"shape\":\"ExportTaskId\",\
          \"documentation\":\"<p>The ID of the export task.</p>\"\
        },\
        \"taskName\":{\
          \"shape\":\"ExportTaskName\",\
          \"documentation\":\"<p>The name of the export task.</p>\"\
        },\
        \"logGroupName\":{\
          \"shape\":\"LogGroupName\",\
          \"documentation\":\"<p>The name of the log group from which logs data was exported.</p>\"\
        },\
        \"from\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The start time, expressed as the number of milliseconds after <code>Jan 1, 1970 00:00:00 UTC</code>. Events with a timestamp before this time are not exported.</p>\"\
        },\
        \"to\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The end time, expressed as the number of milliseconds after <code>Jan 1, 1970 00:00:00 UTC</code>. Events with a timestamp later than this time are not exported.</p>\"\
        },\
        \"destination\":{\
          \"shape\":\"ExportDestinationBucket\",\
          \"documentation\":\"<p>The name of the S3 bucket to which the log data was exported.</p>\"\
        },\
        \"destinationPrefix\":{\
          \"shape\":\"ExportDestinationPrefix\",\
          \"documentation\":\"<p>The prefix that was used as the start of Amazon S3 key for every object exported.</p>\"\
        },\
        \"status\":{\
          \"shape\":\"ExportTaskStatus\",\
          \"documentation\":\"<p>The status of the export task.</p>\"\
        },\
        \"executionInfo\":{\
          \"shape\":\"ExportTaskExecutionInfo\",\
          \"documentation\":\"<p>Execution information about the export task.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Represents an export task.</p>\"\
    },\
    \"ExportTaskExecutionInfo\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"creationTime\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The creation time of the export task, expressed as the number of milliseconds after <code>Jan 1, 1970 00:00:00 UTC</code>.</p>\"\
        },\
        \"completionTime\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The completion time of the export task, expressed as the number of milliseconds after <code>Jan 1, 1970 00:00:00 UTC</code>.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Represents the status of an export task.</p>\"\
    },\
    \"ExportTaskId\":{\
      \"type\":\"string\",\
      \"max\":512,\
      \"min\":1\
    },\
    \"ExportTaskName\":{\
      \"type\":\"string\",\
      \"max\":512,\
      \"min\":1\
    },\
    \"ExportTaskStatus\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"code\":{\
          \"shape\":\"ExportTaskStatusCode\",\
          \"documentation\":\"<p>The status code of the export task.</p>\"\
        },\
        \"message\":{\
          \"shape\":\"ExportTaskStatusMessage\",\
          \"documentation\":\"<p>The status message related to the status code.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Represents the status of an export task.</p>\"\
    },\
    \"ExportTaskStatusCode\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"CANCELLED\",\
        \"COMPLETED\",\
        \"FAILED\",\
        \"PENDING\",\
        \"PENDING_CANCEL\",\
        \"RUNNING\"\
      ]\
    },\
    \"ExportTaskStatusMessage\":{\"type\":\"string\"},\
    \"ExportTasks\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"ExportTask\"}\
    },\
    \"ExtractedValues\":{\
      \"type\":\"map\",\
      \"key\":{\"shape\":\"Token\"},\
      \"value\":{\"shape\":\"Value\"}\
    },\
    \"Field\":{\"type\":\"string\"},\
    \"FilterCount\":{\"type\":\"integer\"},\
    \"FilterLogEventsRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"logGroupName\":{\
          \"shape\":\"LogGroupName\",\
          \"documentation\":\"<p>The name of the log group to search.</p> <note> <p> You must include either <code>logGroupIdentifier</code> or <code>logGroupName</code>, but not both. </p> </note>\"\
        },\
        \"logGroupIdentifier\":{\
          \"shape\":\"LogGroupIdentifier\",\
          \"documentation\":\"<p>Specify either the name or ARN of the log group to view log events from. If the log group is in a source account and you are using a monitoring account, you must use the log group ARN.</p> <note> <p> You must include either <code>logGroupIdentifier</code> or <code>logGroupName</code>, but not both. </p> </note>\"\
        },\
        \"logStreamNames\":{\
          \"shape\":\"InputLogStreamNames\",\
          \"documentation\":\"<p>Filters the results to only logs from the log streams in this list.</p> <p>If you specify a value for both <code>logStreamNamePrefix</code> and <code>logStreamNames</code>, the action returns an <code>InvalidParameterException</code> error.</p>\"\
        },\
        \"logStreamNamePrefix\":{\
          \"shape\":\"LogStreamName\",\
          \"documentation\":\"<p>Filters the results to include only events from log streams that have names starting with this prefix.</p> <p>If you specify a value for both <code>logStreamNamePrefix</code> and <code>logStreamNames</code>, but the value for <code>logStreamNamePrefix</code> does not match any log stream names specified in <code>logStreamNames</code>, the action returns an <code>InvalidParameterException</code> error.</p>\"\
        },\
        \"startTime\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The start of the time range, expressed as the number of milliseconds after <code>Jan 1, 1970 00:00:00 UTC</code>. Events with a timestamp before this time are not returned.</p>\"\
        },\
        \"endTime\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The end of the time range, expressed as the number of milliseconds after <code>Jan 1, 1970 00:00:00 UTC</code>. Events with a timestamp later than this time are not returned.</p>\"\
        },\
        \"filterPattern\":{\
          \"shape\":\"FilterPattern\",\
          \"documentation\":\"<p>The filter pattern to use. For more information, see <a href=\\\"https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/FilterAndPatternSyntax.html\\\">Filter and Pattern Syntax</a>.</p> <p>If not provided, all the events are matched.</p>\"\
        },\
        \"nextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>The token for the next set of events to return. (You received this token from a previous call.)</p>\"\
        },\
        \"limit\":{\
          \"shape\":\"EventsLimit\",\
          \"documentation\":\"<p>The maximum number of events to return. The default is 10,000 events.</p>\"\
        },\
        \"interleaved\":{\
          \"shape\":\"Interleaved\",\
          \"documentation\":\"<p>If the value is true, the operation attempts to provide responses that contain events from multiple log streams within the log group, interleaved in a single response. If the value is false, all the matched log events in the first log stream are searched first, then those in the next log stream, and so on.</p> <p> <b>Important</b> As of June 17, 2019, this parameter is ignored and the value is assumed to be true. The response from this operation always interleaves events from multiple log streams within a log group.</p>\",\
          \"deprecated\":true,\
          \"deprecatedMessage\":\"Starting on June 17, 2019, this parameter will be ignored and the value will be assumed to be true. The response from this operation will always interleave events from multiple log streams within a log group.\"\
        },\
        \"unmask\":{\
          \"shape\":\"Unmask\",\
          \"documentation\":\"<p>Specify <code>true</code> to display the log event fields with all sensitive data unmasked and visible. The default is <code>false</code>.</p> <p>To use this operation with this parameter, you must be signed into an account with the <code>logs:Unmask</code> permission.</p>\"\
        }\
      }\
    },\
    \"FilterLogEventsResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"events\":{\
          \"shape\":\"FilteredLogEvents\",\
          \"documentation\":\"<p>The matched events.</p>\"\
        },\
        \"searchedLogStreams\":{\
          \"shape\":\"SearchedLogStreams\",\
          \"documentation\":\"<p> <b>Important</b> As of May 15, 2020, this parameter is no longer supported. This parameter returns an empty list.</p> <p>Indicates which log streams have been searched and whether each has been searched completely.</p>\"\
        },\
        \"nextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>The token to use when requesting the next set of items. The token expires after 24 hours.</p>\"\
        }\
      }\
    },\
    \"FilterName\":{\
      \"type\":\"string\",\
      \"max\":512,\
      \"min\":1,\
      \"pattern\":\"[^:*]*\"\
    },\
    \"FilterPattern\":{\
      \"type\":\"string\",\
      \"documentation\":\"<p>A symbolic description of how CloudWatch Logs should interpret the data in each log event. For example, a log event can contain timestamps, IP addresses, strings, and so on. You use the filter pattern to specify what to look for in the log event message.</p>\",\
      \"max\":1024,\
      \"min\":0\
    },\
    \"FilteredLogEvent\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"logStreamName\":{\
          \"shape\":\"LogStreamName\",\
          \"documentation\":\"<p>The name of the log stream to which this event belongs.</p>\"\
        },\
        \"timestamp\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The time the event occurred, expressed as the number of milliseconds after <code>Jan 1, 1970 00:00:00 UTC</code>.</p>\"\
        },\
        \"message\":{\
          \"shape\":\"EventMessage\",\
          \"documentation\":\"<p>The data contained in the log event.</p>\"\
        },\
        \"ingestionTime\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The time the event was ingested, expressed as the number of milliseconds after <code>Jan 1, 1970 00:00:00 UTC</code>.</p>\"\
        },\
        \"eventId\":{\
          \"shape\":\"EventId\",\
          \"documentation\":\"<p>The ID of the event.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Represents a matched event.</p>\"\
    },\
    \"FilteredLogEvents\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"FilteredLogEvent\"}\
    },\
    \"ForceUpdate\":{\"type\":\"boolean\"},\
    \"GetDataProtectionPolicyRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"logGroupIdentifier\"],\
      \"members\":{\
        \"logGroupIdentifier\":{\
          \"shape\":\"LogGroupIdentifier\",\
          \"documentation\":\"<p>The name or ARN of the log group that contains the data protection policy that you want to see.</p>\"\
        }\
      }\
    },\
    \"GetDataProtectionPolicyResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"logGroupIdentifier\":{\
          \"shape\":\"LogGroupIdentifier\",\
          \"documentation\":\"<p>The log group name or ARN that you specified in your request.</p>\"\
        },\
        \"policyDocument\":{\
          \"shape\":\"DataProtectionPolicyDocument\",\
          \"documentation\":\"<p>The data protection policy document for this log group.</p>\"\
        },\
        \"lastUpdatedTime\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The date and time that this policy was most recently updated.</p>\"\
        }\
      }\
    },\
    \"GetDeliveryDestinationPolicyRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"deliveryDestinationName\"],\
      \"members\":{\
        \"deliveryDestinationName\":{\
          \"shape\":\"DeliveryDestinationName\",\
          \"documentation\":\"<p>The name of the delivery destination that you want to retrieve the policy of.</p>\"\
        }\
      }\
    },\
    \"GetDeliveryDestinationPolicyResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"policy\":{\
          \"shape\":\"Policy\",\
          \"documentation\":\"<p>The IAM policy for this delivery destination.</p>\"\
        }\
      }\
    },\
    \"GetDeliveryDestinationRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"name\"],\
      \"members\":{\
        \"name\":{\
          \"shape\":\"DeliveryDestinationName\",\
          \"documentation\":\"<p>The name of the delivery destination that you want to retrieve.</p>\"\
        }\
      }\
    },\
    \"GetDeliveryDestinationResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"deliveryDestination\":{\
          \"shape\":\"DeliveryDestination\",\
          \"documentation\":\"<p>A structure containing information about the delivery destination.</p>\"\
        }\
      }\
    },\
    \"GetDeliveryRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"id\"],\
      \"members\":{\
        \"id\":{\
          \"shape\":\"DeliveryId\",\
          \"documentation\":\"<p>The ID of the delivery that you want to retrieve.</p>\"\
        }\
      }\
    },\
    \"GetDeliveryResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"delivery\":{\
          \"shape\":\"Delivery\",\
          \"documentation\":\"<p>A structure that contains information about the delivery.</p>\"\
        }\
      }\
    },\
    \"GetDeliverySourceRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"name\"],\
      \"members\":{\
        \"name\":{\
          \"shape\":\"DeliverySourceName\",\
          \"documentation\":\"<p>The name of the delivery source that you want to retrieve.</p>\"\
        }\
      }\
    },\
    \"GetDeliverySourceResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"deliverySource\":{\
          \"shape\":\"DeliverySource\",\
          \"documentation\":\"<p>A structure containing information about the delivery source.</p>\"\
        }\
      }\
    },\
    \"GetLogAnomalyDetectorRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"anomalyDetectorArn\"],\
      \"members\":{\
        \"anomalyDetectorArn\":{\
          \"shape\":\"AnomalyDetectorArn\",\
          \"documentation\":\"<p>The ARN of the anomaly detector to retrieve information about. You can find the ARNs of log anomaly detectors in your account by using the <a href=\\\"https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_ListLogAnomalyDetectors.html\\\">ListLogAnomalyDetectors</a> operation.</p>\"\
        }\
      }\
    },\
    \"GetLogAnomalyDetectorResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"detectorName\":{\
          \"shape\":\"DetectorName\",\
          \"documentation\":\"<p>The name of the log anomaly detector</p>\"\
        },\
        \"logGroupArnList\":{\
          \"shape\":\"LogGroupArnList\",\
          \"documentation\":\"<p>An array of structures, where each structure contains the ARN of a log group associated with this anomaly detector.</p>\"\
        },\
        \"evaluationFrequency\":{\
          \"shape\":\"EvaluationFrequency\",\
          \"documentation\":\"<p>Specifies how often the anomaly detector runs and look for anomalies. Set this value according to the frequency that the log group receives new logs. For example, if the log group receives new log events every 10 minutes, then setting <code>evaluationFrequency</code> to <code>FIFTEEN_MIN</code> might be appropriate.</p>\"\
        },\
        \"filterPattern\":{\"shape\":\"FilterPattern\"},\
        \"anomalyDetectorStatus\":{\
          \"shape\":\"AnomalyDetectorStatus\",\
          \"documentation\":\"<p>Specifies whether the anomaly detector is currently active. To change its status, use the <code>enabled</code> parameter in the <a href=\\\"https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_UpdateLogAnomalyDetector.html\\\">UpdateLogAnomalyDetector</a> operation.</p>\"\
        },\
        \"kmsKeyId\":{\
          \"shape\":\"KmsKeyId\",\
          \"documentation\":\"<p>The ID of the KMS key assigned to this anomaly detector, if any.</p>\"\
        },\
        \"creationTimeStamp\":{\
          \"shape\":\"EpochMillis\",\
          \"documentation\":\"<p>The date and time when this anomaly detector was created.</p>\"\
        },\
        \"lastModifiedTimeStamp\":{\
          \"shape\":\"EpochMillis\",\
          \"documentation\":\"<p>The date and time when this anomaly detector was most recently modified.</p>\"\
        },\
        \"anomalyVisibilityTime\":{\
          \"shape\":\"AnomalyVisibilityTime\",\
          \"documentation\":\"<p>The number of days used as the life cycle of anomalies. After this time, anomalies are automatically baselined and the anomaly detector model will treat new occurrences of similar event as normal. </p>\"\
        }\
      }\
    },\
    \"GetLogEventsRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"logStreamName\"],\
      \"members\":{\
        \"logGroupName\":{\
          \"shape\":\"LogGroupName\",\
          \"documentation\":\"<p>The name of the log group.</p> <note> <p> You must include either <code>logGroupIdentifier</code> or <code>logGroupName</code>, but not both. </p> </note>\"\
        },\
        \"logGroupIdentifier\":{\
          \"shape\":\"LogGroupIdentifier\",\
          \"documentation\":\"<p>Specify either the name or ARN of the log group to view events from. If the log group is in a source account and you are using a monitoring account, you must use the log group ARN.</p> <note> <p> You must include either <code>logGroupIdentifier</code> or <code>logGroupName</code>, but not both. </p> </note>\"\
        },\
        \"logStreamName\":{\
          \"shape\":\"LogStreamName\",\
          \"documentation\":\"<p>The name of the log stream.</p>\"\
        },\
        \"startTime\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The start of the time range, expressed as the number of milliseconds after <code>Jan 1, 1970 00:00:00 UTC</code>. Events with a timestamp equal to this time or later than this time are included. Events with a timestamp earlier than this time are not included.</p>\"\
        },\
        \"endTime\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The end of the time range, expressed as the number of milliseconds after <code>Jan 1, 1970 00:00:00 UTC</code>. Events with a timestamp equal to or later than this time are not included.</p>\"\
        },\
        \"nextToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>The token for the next set of items to return. (You received this token from a previous call.)</p>\"\
        },\
        \"limit\":{\
          \"shape\":\"EventsLimit\",\
          \"documentation\":\"<p>The maximum number of log events returned. If you don't specify a limit, the default is as many log events as can fit in a response size of 1 MB (up to 10,000 log events).</p>\"\
        },\
        \"startFromHead\":{\
          \"shape\":\"StartFromHead\",\
          \"documentation\":\"<p>If the value is true, the earliest log events are returned first. If the value is false, the latest log events are returned first. The default value is false.</p> <p>If you are using a previous <code>nextForwardToken</code> value as the <code>nextToken</code> in this operation, you must specify <code>true</code> for <code>startFromHead</code>.</p>\"\
        },\
        \"unmask\":{\
          \"shape\":\"Unmask\",\
          \"documentation\":\"<p>Specify <code>true</code> to display the log event fields with all sensitive data unmasked and visible. The default is <code>false</code>.</p> <p>To use this operation with this parameter, you must be signed into an account with the <code>logs:Unmask</code> permission.</p>\"\
        }\
      }\
    },\
    \"GetLogEventsResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"events\":{\
          \"shape\":\"OutputLogEvents\",\
          \"documentation\":\"<p>The events.</p>\"\
        },\
        \"nextForwardToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>The token for the next set of items in the forward direction. The token expires after 24 hours. If you have reached the end of the stream, it returns the same token you passed in.</p>\"\
        },\
        \"nextBackwardToken\":{\
          \"shape\":\"NextToken\",\
          \"documentation\":\"<p>The token for the next set of items in the backward direction. The token expires after 24 hours. This token is not null. If you have reached the end of the stream, it returns the same token you passed in.</p>\"\
        }\
      }\
    },\
    \"GetLogGroupFieldsRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"logGroupName\":{\
          \"shape\":\"LogGroupName\",\
          \"documentation\":\"<p>The name of the log group to search.</p> <note> <p> You must include either <code>logGroupIdentifier</code> or <code>logGroupName</code>, but not both. </p> </note>\"\
        },\
        \"time\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The time to set as the center of the query. If you specify <code>time</code>, the 8 minutes before and 8 minutes after this time are searched. If you omit <code>time</code>, the most recent 15 minutes up to the current time are searched.</p> <p>The <code>time</code> value is specified as epoch time, which is the number of seconds since <code>January 1, 1970, 00:00:00 UTC</code>.</p>\"\
        },\
        \"logGroupIdentifier\":{\
          \"shape\":\"LogGroupIdentifier\",\
          \"documentation\":\"<p>Specify either the name or ARN of the log group to view. If the log group is in a source account and you are using a monitoring account, you must specify the ARN.</p> <note> <p> You must include either <code>logGroupIdentifier</code> or <code>logGroupName</code>, but not both. </p> </note>\"\
        }\
      }\
    },\
    \"GetLogGroupFieldsResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"logGroupFields\":{\
          \"shape\":\"LogGroupFieldList\",\
          \"documentation\":\"<p>The array of fields found in the query. Each object in the array contains the name of the field, along with the percentage of time it appeared in the log events that were queried.</p>\"\
        }\
      }\
    },\
    \"GetLogRecordRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"logRecordPointer\"],\
      \"members\":{\
        \"logRecordPointer\":{\
          \"shape\":\"LogRecordPointer\",\
          \"documentation\":\"<p>The pointer corresponding to the log event record you want to retrieve. You get this from the response of a <code>GetQueryResults</code> operation. In that response, the value of the <code>@ptr</code> field for a log event is the value to use as <code>logRecordPointer</code> to retrieve that complete log event record.</p>\"\
        },\
        \"unmask\":{\
          \"shape\":\"Unmask\",\
          \"documentation\":\"<p>Specify <code>true</code> to display the log event fields with all sensitive data unmasked and visible. The default is <code>false</code>.</p> <p>To use this operation with this parameter, you must be signed into an account with the <code>logs:Unmask</code> permission.</p>\"\
        }\
      }\
    },\
    \"GetLogRecordResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"logRecord\":{\
          \"shape\":\"LogRecord\",\
          \"documentation\":\"<p>The requested log event, as a JSON string.</p>\"\
        }\
      }\
    },\
    \"GetQueryResultsRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"queryId\"],\
      \"members\":{\
        \"queryId\":{\
          \"shape\":\"QueryId\",\
          \"documentation\":\"<p>The ID number of the query.</p>\"\
        }\
      }\
    },\
    \"GetQueryResultsResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"results\":{\
          \"shape\":\"QueryResults\",\
          \"documentation\":\"<p>The log events that matched the query criteria during the most recent time it ran.</p> <p>The <code>results</code> value is an array of arrays. Each log event is one object in the top-level array. Each of these log event objects is an array of <code>field</code>/<code>value</code> pairs.</p>\"\
        },\
        \"statistics\":{\
          \"shape\":\"QueryStatistics\",\
          \"documentation\":\"<p>Includes the number of log events scanned by the query, the number of log events that matched the query criteria, and the total number of bytes in the scanned log events. These values reflect the full raw results of the query.</p>\"\
        },\
        \"status\":{\
          \"shape\":\"QueryStatus\",\
          \"documentation\":\"<p>The status of the most recent running of the query. Possible values are <code>Cancelled</code>, <code>Complete</code>, <code>Failed</code>, <code>Running</code>, <code>Scheduled</code>, <code>Timeout</code>, and <code>Unknown</code>.</p> <p>Queries time out after 60 minutes of runtime. To avoid having your queries time out, reduce the time range being searched or partition your query into a number of queries.</p>\"\
        },\
        \"encryptionKey\":{\
          \"shape\":\"EncryptionKey\",\
          \"documentation\":\"<p>If you associated an KMS key with the CloudWatch Logs Insights query results in this account, this field displays the ARN of the key that's used to encrypt the query results when <a href=\\\"https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_StartQuery.html\\\">StartQuery</a> stores them.</p>\"\
        }\
      }\
    },\
    \"Histogram\":{\
      \"type\":\"map\",\
      \"key\":{\"shape\":\"Time\"},\
      \"value\":{\"shape\":\"Count\"}\
    },\
    \"IncludeLinkedAccounts\":{\"type\":\"boolean\"},\
    \"InheritedProperties\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"InheritedProperty\"}\
    },\
    \"InheritedProperty\":{\
      \"type\":\"string\",\
      \"enum\":[\"ACCOUNT_DATA_PROTECTION\"]\
    },\
    \"InputLogEvent\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"timestamp\",\
        \"message\"\
      ],\
      \"members\":{\
        \"timestamp\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The time the event occurred, expressed as the number of milliseconds after <code>Jan 1, 1970 00:00:00 UTC</code>.</p>\"\
        },\
        \"message\":{\
          \"shape\":\"EventMessage\",\
          \"documentation\":\"<p>The raw event message. Each log event can be no larger than 256 KB.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Represents a log event, which is a record of activity that was recorded by the application or resource being monitored.</p>\"\
    },\
    \"InputLogEvents\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"InputLogEvent\"},\
      \"max\":10000,\
      \"min\":1\
    },\
    \"InputLogStreamNames\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"LogStreamName\"},\
      \"max\":100,\
      \"min\":1\
    },\
    \"Integer\":{\"type\":\"integer\"},\
    \"Interleaved\":{\"type\":\"boolean\"},\
    \"InvalidOperationException\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p>The operation is not valid on the specified resource.</p>\",\
      \"exception\":true\
    },\
    \"InvalidParameterException\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p>A parameter is specified incorrectly.</p>\",\
      \"exception\":true\
    },\
    \"InvalidSequenceTokenException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"expectedSequenceToken\":{\"shape\":\"SequenceToken\"}\
      },\
      \"documentation\":\"<p>The sequence token is not valid. You can get the correct sequence token in the <code>expectedSequenceToken</code> field in the <code>InvalidSequenceTokenException</code> message. </p> <important> <p> <code>PutLogEvents</code> actions are now always accepted and never return <code>InvalidSequenceTokenException</code> regardless of receiving an invalid sequence token. </p> </important>\",\
      \"exception\":true\
    },\
    \"IsSampled\":{\"type\":\"boolean\"},\
    \"KmsKeyId\":{\
      \"type\":\"string\",\
      \"max\":256\
    },\
    \"LimitExceededException\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p>You have reached the maximum number of resources that can be created.</p>\",\
      \"exception\":true\
    },\
    \"ListAnomaliesLimit\":{\
      \"type\":\"integer\",\
      \"max\":50,\
      \"min\":1\
    },\
    \"ListAnomaliesRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"anomalyDetectorArn\":{\
          \"shape\":\"AnomalyDetectorArn\",\
          \"documentation\":\"<p>Use this to optionally limit the results to only the anomalies found by a certain anomaly detector.</p>\"\
        },\
        \"suppressionState\":{\
          \"shape\":\"SuppressionState\",\
          \"documentation\":\"<p>You can specify this parameter if you want to the operation to return only anomalies that are currently either suppressed or unsuppressed.</p>\"\
        },\
        \"limit\":{\
          \"shape\":\"ListAnomaliesLimit\",\
          \"documentation\":\"<p>The maximum number of items to return. If you don't specify a value, the default maximum value of 50 items is used.</p>\"\
        },\
        \"nextToken\":{\"shape\":\"NextToken\"}\
      }\
    },\
    \"ListAnomaliesResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"anomalies\":{\
          \"shape\":\"Anomalies\",\
          \"documentation\":\"<p>An array of structures, where each structure contains information about one anomaly that a log anomaly detector has found.</p>\"\
        },\
        \"nextToken\":{\"shape\":\"NextToken\"}\
      }\
    },\
    \"ListLogAnomalyDetectorsLimit\":{\
      \"type\":\"integer\",\
      \"max\":50,\
      \"min\":1\
    },\
    \"ListLogAnomalyDetectorsRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"filterLogGroupArn\":{\
          \"shape\":\"LogGroupArn\",\
          \"documentation\":\"<p>Use this to optionally filter the results to only include anomaly detectors that are associated with the specified log group.</p>\"\
        },\
        \"limit\":{\
          \"shape\":\"ListLogAnomalyDetectorsLimit\",\
          \"documentation\":\"<p>The maximum number of items to return. If you don't specify a value, the default maximum value of 50 items is used.</p>\"\
        },\
        \"nextToken\":{\"shape\":\"NextToken\"}\
      }\
    },\
    \"ListLogAnomalyDetectorsResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"anomalyDetectors\":{\
          \"shape\":\"AnomalyDetectors\",\
          \"documentation\":\"<p>An array of structures, where each structure in the array contains information about one anomaly detector.</p>\"\
        },\
        \"nextToken\":{\"shape\":\"NextToken\"}\
      }\
    },\
    \"ListTagsForResourceRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"resourceArn\"],\
      \"members\":{\
        \"resourceArn\":{\
          \"shape\":\"AmazonResourceName\",\
          \"documentation\":\"<p>The ARN of the resource that you want to view tags for.</p> <p>The ARN format of a log group is <code>arn:aws:logs:<i>Region</i>:<i>account-id</i>:log-group:<i>log-group-name</i> </code> </p> <p>The ARN format of a destination is <code>arn:aws:logs:<i>Region</i>:<i>account-id</i>:destination:<i>destination-name</i> </code> </p> <p>For more information about ARN format, see <a href=\\\"https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/iam-access-control-overview-cwl.html\\\">CloudWatch Logs resources and operations</a>.</p>\"\
        }\
      }\
    },\
    \"ListTagsForResourceResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"tags\":{\
          \"shape\":\"Tags\",\
          \"documentation\":\"<p>The list of tags associated with the requested resource.&gt;</p>\"\
        }\
      }\
    },\
    \"ListTagsLogGroupRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"logGroupName\"],\
      \"members\":{\
        \"logGroupName\":{\
          \"shape\":\"LogGroupName\",\
          \"documentation\":\"<p>The name of the log group.</p>\"\
        }\
      },\
      \"deprecated\":true,\
      \"deprecatedMessage\":\"Please use the generic tagging API model ListTagsForResourceRequest and ListTagsForResourceResponse\"\
    },\
    \"ListTagsLogGroupResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"tags\":{\
          \"shape\":\"Tags\",\
          \"documentation\":\"<p>The tags for the log group.</p>\"\
        }\
      },\
      \"deprecated\":true,\
      \"deprecatedMessage\":\"Please use the generic tagging API model ListTagsForResourceRequest and ListTagsForResourceResponse\"\
    },\
    \"LiveTailSessionLogEvent\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"logStreamName\":{\
          \"shape\":\"LogStreamName\",\
          \"documentation\":\"<p>The name of the log stream that ingested this log event.</p>\"\
        },\
        \"logGroupIdentifier\":{\
          \"shape\":\"LogGroupIdentifier\",\
          \"documentation\":\"<p>The name or ARN of the log group that ingested this log event.</p>\"\
        },\
        \"message\":{\
          \"shape\":\"EventMessage\",\
          \"documentation\":\"<p>The log event message text.</p>\"\
        },\
        \"timestamp\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The timestamp specifying when this log event was created.</p>\"\
        },\
        \"ingestionTime\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The timestamp specifying when this log event was ingested into the log group.</p>\"\
        }\
      },\
      \"documentation\":\"<p>This object contains the information for one log event returned in a Live Tail stream.</p>\"\
    },\
    \"LiveTailSessionMetadata\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"sampled\":{\
          \"shape\":\"IsSampled\",\
          \"documentation\":\"<p>If this is <code>true</code>, then more than 500 log events matched the request for this update, and the <code>sessionResults</code> includes a sample of 500 of those events.</p> <p>If this is <code>false</code>, then 500 or fewer log events matched the request for this update, so no sampling was necessary. In this case, the <code>sessionResults</code> array includes all log events that matched your request during this time.</p>\"\
        }\
      },\
      \"documentation\":\"<p>This object contains the metadata for one <code>LiveTailSessionUpdate</code> structure. It indicates whether that update includes only a sample of 500 log events out of a larger number of ingested log events, or if it contains all of the matching log events ingested during that second of time.</p>\"\
    },\
    \"LiveTailSessionResults\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"LiveTailSessionLogEvent\"}\
    },\
    \"LiveTailSessionStart\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"requestId\":{\
          \"shape\":\"RequestId\",\
          \"documentation\":\"<p>The unique ID generated by CloudWatch Logs to identify this Live Tail session request.</p>\"\
        },\
        \"sessionId\":{\
          \"shape\":\"SessionId\",\
          \"documentation\":\"<p>The unique ID generated by CloudWatch Logs to identify this Live Tail session.</p>\"\
        },\
        \"logGroupIdentifiers\":{\
          \"shape\":\"StartLiveTailLogGroupIdentifiers\",\
          \"documentation\":\"<p>An array of the names and ARNs of the log groups included in this Live Tail session.</p>\"\
        },\
        \"logStreamNames\":{\
          \"shape\":\"InputLogStreamNames\",\
          \"documentation\":\"<p>If your StartLiveTail operation request included a <code>logStreamNames</code> parameter that filtered the session to only include certain log streams, these streams are listed here.</p>\"\
        },\
        \"logStreamNamePrefixes\":{\
          \"shape\":\"InputLogStreamNames\",\
          \"documentation\":\"<p>If your StartLiveTail operation request included a <code>logStreamNamePrefixes</code> parameter that filtered the session to only include log streams that have names that start with certain prefixes, these prefixes are listed here.</p>\"\
        },\
        \"logEventFilterPattern\":{\
          \"shape\":\"FilterPattern\",\
          \"documentation\":\"<p>An optional pattern to filter the results to include only log events that match the pattern. For example, a filter pattern of <code>error 404</code> displays only log events that include both <code>error</code> and <code>404</code>.</p> <p>For more information about filter pattern syntax, see <a href=\\\"https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/FilterAndPatternSyntax.html\\\">Filter and Pattern Syntax</a>.</p>\"\
        }\
      },\
      \"documentation\":\"<p>This object contains information about this Live Tail session, including the log groups included and the log stream filters, if any.</p>\",\
      \"event\":true\
    },\
    \"LiveTailSessionUpdate\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"sessionMetadata\":{\
          \"shape\":\"LiveTailSessionMetadata\",\
          \"documentation\":\"<p>This object contains the session metadata for a Live Tail session.</p>\"\
        },\
        \"sessionResults\":{\
          \"shape\":\"LiveTailSessionResults\",\
          \"documentation\":\"<p>An array, where each member of the array includes the information for one log event in the Live Tail session.</p> <p>A <code>sessionResults</code> array can include as many as 500 log events. If the number of log events matching the request exceeds 500 per second, the log events are sampled down to 500 log events to be included in each <code>sessionUpdate</code> structure.</p>\"\
        }\
      },\
      \"documentation\":\"<p>This object contains the log events and metadata for a Live Tail session.</p>\",\
      \"event\":true\
    },\
    \"LogEvent\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"timestamp\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The time stamp of the log event.</p>\"\
        },\
        \"message\":{\
          \"shape\":\"EventMessage\",\
          \"documentation\":\"<p>The message content of the log event.</p>\"\
        }\
      },\
      \"documentation\":\"<p>This structure contains the information for one sample log event that is associated with an anomaly found by a log anomaly detector.</p>\"\
    },\
    \"LogEventIndex\":{\"type\":\"integer\"},\
    \"LogGroup\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"logGroupName\":{\
          \"shape\":\"LogGroupName\",\
          \"documentation\":\"<p>The name of the log group.</p>\"\
        },\
        \"creationTime\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The creation time of the log group, expressed as the number of milliseconds after Jan 1, 1970 00:00:00 UTC.</p>\"\
        },\
        \"retentionInDays\":{\"shape\":\"Days\"},\
        \"metricFilterCount\":{\
          \"shape\":\"FilterCount\",\
          \"documentation\":\"<p>The number of metric filters.</p>\"\
        },\
        \"arn\":{\
          \"shape\":\"Arn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the log group. This version of the ARN includes a trailing <code>:*</code> after the log group name. </p> <p>Use this version to refer to the ARN in IAM policies when specifying permissions for most API actions. The exception is when specifying permissions for <a href=\\\"https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_TagResource.html\\\">TagResource</a>, <a href=\\\"https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_UntagResource.html\\\">UntagResource</a>, and <a href=\\\"https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_ListTagsForResource.html\\\">ListTagsForResource</a>. The permissions for those three actions require the ARN version that doesn't include a trailing <code>:*</code>.</p>\"\
        },\
        \"storedBytes\":{\
          \"shape\":\"StoredBytes\",\
          \"documentation\":\"<p>The number of bytes stored.</p>\"\
        },\
        \"kmsKeyId\":{\
          \"shape\":\"KmsKeyId\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the KMS key to use when encrypting log data.</p>\"\
        },\
        \"dataProtectionStatus\":{\
          \"shape\":\"DataProtectionStatus\",\
          \"documentation\":\"<p>Displays whether this log group has a protection policy, or whether it had one in the past. For more information, see <a href=\\\"https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_PutDataProtectionPolicy.html\\\">PutDataProtectionPolicy</a>.</p>\"\
        },\
        \"inheritedProperties\":{\
          \"shape\":\"InheritedProperties\",\
          \"documentation\":\"<p>Displays all the properties that this log group has inherited from account-level settings.</p>\"\
        },\
        \"logGroupClass\":{\
          \"shape\":\"LogGroupClass\",\
          \"documentation\":\"<p>This specifies the log group class for this log group. There are two classes:</p> <ul> <li> <p>The <code>Standard</code> log class supports all CloudWatch Logs features.</p> </li> <li> <p>The <code>Infrequent Access</code> log class supports a subset of CloudWatch Logs features and incurs lower costs.</p> </li> </ul> <p>For details about the features supported by each class, see <a href=\\\"https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/CloudWatch_Logs_Log_Classes.html\\\">Log classes</a> </p>\"\
        },\
        \"logGroupArn\":{\
          \"shape\":\"Arn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the log group. This version of the ARN doesn't include a trailing <code>:*</code> after the log group name. </p> <p>Use this version to refer to the ARN in the following situations:</p> <ul> <li> <p>In the <code>logGroupIdentifier</code> input field in many CloudWatch Logs APIs.</p> </li> <li> <p>In the <code>resourceArn</code> field in tagging APIs</p> </li> <li> <p>In IAM policies, when specifying permissions for <a href=\\\"https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_TagResource.html\\\">TagResource</a>, <a href=\\\"https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_UntagResource.html\\\">UntagResource</a>, and <a href=\\\"https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_ListTagsForResource.html\\\">ListTagsForResource</a>.</p> </li> </ul>\"\
        }\
      },\
      \"documentation\":\"<p>Represents a log group.</p>\"\
    },\
    \"LogGroupArn\":{\
      \"type\":\"string\",\
      \"max\":2048,\
      \"min\":1,\
      \"pattern\":\"[\\\\w#+=/:,.@-]*\"\
    },\
    \"LogGroupArnList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"LogGroupArn\"}\
    },\
    \"LogGroupClass\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"STANDARD\",\
        \"INFREQUENT_ACCESS\"\
      ]\
    },\
    \"LogGroupField\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"name\":{\
          \"shape\":\"Field\",\
          \"documentation\":\"<p>The name of a log field.</p>\"\
        },\
        \"percent\":{\
          \"shape\":\"Percentage\",\
          \"documentation\":\"<p>The percentage of log events queried that contained the field.</p>\"\
        }\
      },\
      \"documentation\":\"<p>The fields contained in log events found by a <code>GetLogGroupFields</code> operation, along with the percentage of queried log events in which each field appears.</p>\"\
    },\
    \"LogGroupFieldList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"LogGroupField\"}\
    },\
    \"LogGroupIdentifier\":{\
      \"type\":\"string\",\
      \"max\":2048,\
      \"min\":1,\
      \"pattern\":\"[\\\\w#+=/:,.@-]*\"\
    },\
    \"LogGroupIdentifiers\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"LogGroupIdentifier\"}\
    },\
    \"LogGroupName\":{\
      \"type\":\"string\",\
      \"max\":512,\
      \"min\":1,\
      \"pattern\":\"[\\\\.\\\\-_/#A-Za-z0-9]+\"\
    },\
    \"LogGroupNamePattern\":{\
      \"type\":\"string\",\
      \"max\":512,\
      \"min\":0,\
      \"pattern\":\"[\\\\.\\\\-_/#A-Za-z0-9]*\"\
    },\
    \"LogGroupNames\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"LogGroupName\"}\
    },\
    \"LogGroups\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"LogGroup\"}\
    },\
    \"LogRecord\":{\
      \"type\":\"map\",\
      \"key\":{\"shape\":\"Field\"},\
      \"value\":{\"shape\":\"Value\"}\
    },\
    \"LogRecordPointer\":{\"type\":\"string\"},\
    \"LogSamples\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"LogEvent\"}\
    },\
    \"LogStream\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"logStreamName\":{\
          \"shape\":\"LogStreamName\",\
          \"documentation\":\"<p>The name of the log stream.</p>\"\
        },\
        \"creationTime\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The creation time of the stream, expressed as the number of milliseconds after <code>Jan 1, 1970 00:00:00 UTC</code>.</p>\"\
        },\
        \"firstEventTimestamp\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The time of the first event, expressed as the number of milliseconds after <code>Jan 1, 1970 00:00:00 UTC</code>.</p>\"\
        },\
        \"lastEventTimestamp\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The time of the most recent log event in the log stream in CloudWatch Logs. This number is expressed as the number of milliseconds after <code>Jan 1, 1970 00:00:00 UTC</code>. The <code>lastEventTime</code> value updates on an eventual consistency basis. It typically updates in less than an hour from ingestion, but in rare situations might take longer.</p>\"\
        },\
        \"lastIngestionTime\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The ingestion time, expressed as the number of milliseconds after <code>Jan 1, 1970 00:00:00 UTC</code> The <code>lastIngestionTime</code> value updates on an eventual consistency basis. It typically updates in less than an hour after ingestion, but in rare situations might take longer.</p>\"\
        },\
        \"uploadSequenceToken\":{\
          \"shape\":\"SequenceToken\",\
          \"documentation\":\"<p>The sequence token.</p> <important> <p>The sequence token is now ignored in <code>PutLogEvents</code> actions. <code>PutLogEvents</code> actions are always accepted regardless of receiving an invalid sequence token. You don't need to obtain <code>uploadSequenceToken</code> to use a <code>PutLogEvents</code> action.</p> </important>\"\
        },\
        \"arn\":{\
          \"shape\":\"Arn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the log stream.</p>\"\
        },\
        \"storedBytes\":{\
          \"shape\":\"StoredBytes\",\
          \"documentation\":\"<p>The number of bytes stored.</p> <p> <b>Important:</b> As of June 17, 2019, this parameter is no longer supported for log streams, and is always reported as zero. This change applies only to log streams. The <code>storedBytes</code> parameter for log groups is not affected.</p>\",\
          \"deprecated\":true,\
          \"deprecatedMessage\":\"Starting on June 17, 2019, this parameter will be deprecated for log streams, and will be reported as zero. This change applies only to log streams. The storedBytes parameter for log groups is not affected.\"\
        }\
      },\
      \"documentation\":\"<p>Represents a log stream, which is a sequence of log events from a single emitter of logs.</p>\"\
    },\
    \"LogStreamName\":{\
      \"type\":\"string\",\
      \"max\":512,\
      \"min\":1,\
      \"pattern\":\"[^:*]*\"\
    },\
    \"LogStreamSearchedCompletely\":{\"type\":\"boolean\"},\
    \"LogStreams\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"LogStream\"}\
    },\
    \"LogType\":{\
      \"type\":\"string\",\
      \"max\":255,\
      \"min\":1,\
      \"pattern\":\"[\\\\w]*\"\
    },\
    \"MalformedQueryException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"queryCompileError\":{\"shape\":\"QueryCompileError\"}\
      },\
      \"documentation\":\"<p>The query string is not valid. Details about this error are displayed in a <code>QueryCompileError</code> object. For more information, see <a href=\\\"https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_QueryCompileError.html\\\">QueryCompileError</a>.</p> <p>For more information about valid query syntax, see <a href=\\\"https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/CWL_QuerySyntax.html\\\">CloudWatch Logs Insights Query Syntax</a>.</p>\",\
      \"exception\":true\
    },\
    \"Message\":{\"type\":\"string\"},\
    \"MetricFilter\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"filterName\":{\
          \"shape\":\"FilterName\",\
          \"documentation\":\"<p>The name of the metric filter.</p>\"\
        },\
        \"filterPattern\":{\"shape\":\"FilterPattern\"},\
        \"metricTransformations\":{\
          \"shape\":\"MetricTransformations\",\
          \"documentation\":\"<p>The metric transformations.</p>\"\
        },\
        \"creationTime\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The creation time of the metric filter, expressed as the number of milliseconds after <code>Jan 1, 1970 00:00:00 UTC</code>.</p>\"\
        },\
        \"logGroupName\":{\
          \"shape\":\"LogGroupName\",\
          \"documentation\":\"<p>The name of the log group.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Metric filters express how CloudWatch Logs would extract metric observations from ingested log events and transform them into metric data in a CloudWatch metric.</p>\"\
    },\
    \"MetricFilterMatchRecord\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"eventNumber\":{\
          \"shape\":\"EventNumber\",\
          \"documentation\":\"<p>The event number.</p>\"\
        },\
        \"eventMessage\":{\
          \"shape\":\"EventMessage\",\
          \"documentation\":\"<p>The raw event data.</p>\"\
        },\
        \"extractedValues\":{\
          \"shape\":\"ExtractedValues\",\
          \"documentation\":\"<p>The values extracted from the event data by the filter.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Represents a matched event.</p>\"\
    },\
    \"MetricFilterMatches\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"MetricFilterMatchRecord\"}\
    },\
    \"MetricFilters\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"MetricFilter\"}\
    },\
    \"MetricName\":{\
      \"type\":\"string\",\
      \"documentation\":\"<p>The name of the CloudWatch metric to which the monitored log information should be published. For example, you might publish to a metric named ErrorCount.</p>\",\
      \"max\":255,\
      \"pattern\":\"[^:*$]*\"\
    },\
    \"MetricNamespace\":{\
      \"type\":\"string\",\
      \"max\":255,\
      \"pattern\":\"[^:*$]*\"\
    },\
    \"MetricTransformation\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"metricName\",\
        \"metricNamespace\",\
        \"metricValue\"\
      ],\
      \"members\":{\
        \"metricName\":{\
          \"shape\":\"MetricName\",\
          \"documentation\":\"<p>The name of the CloudWatch metric.</p>\"\
        },\
        \"metricNamespace\":{\
          \"shape\":\"MetricNamespace\",\
          \"documentation\":\"<p>A custom namespace to contain your metric in CloudWatch. Use namespaces to group together metrics that are similar. For more information, see <a href=\\\"https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/cloudwatch_concepts.html#Namespace\\\">Namespaces</a>.</p>\"\
        },\
        \"metricValue\":{\
          \"shape\":\"MetricValue\",\
          \"documentation\":\"<p>The value to publish to the CloudWatch metric when a filter pattern matches a log event.</p>\"\
        },\
        \"defaultValue\":{\
          \"shape\":\"DefaultValue\",\
          \"documentation\":\"<p>(Optional) The value to emit when a filter pattern does not match a log event. This value can be null.</p>\"\
        },\
        \"dimensions\":{\
          \"shape\":\"Dimensions\",\
          \"documentation\":\"<p>The fields to use as dimensions for the metric. One metric filter can include as many as three dimensions.</p> <important> <p>Metrics extracted from log events are charged as custom metrics. To prevent unexpected high charges, do not specify high-cardinality fields such as <code>IPAddress</code> or <code>requestID</code> as dimensions. Each different value found for a dimension is treated as a separate metric and accrues charges as a separate custom metric. </p> <p>CloudWatch Logs disables a metric filter if it generates 1000 different name/value pairs for your specified dimensions within a certain amount of time. This helps to prevent accidental high charges.</p> <p>You can also set up a billing alarm to alert you if your charges are higher than expected. For more information, see <a href=\\\"https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/monitor_estimated_charges_with_cloudwatch.html\\\"> Creating a Billing Alarm to Monitor Your Estimated Amazon Web Services Charges</a>. </p> </important>\"\
        },\
        \"unit\":{\
          \"shape\":\"StandardUnit\",\
          \"documentation\":\"<p>The unit to assign to the metric. If you omit this, the unit is set as <code>None</code>.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Indicates how to transform ingested log events to metric data in a CloudWatch metric.</p>\"\
    },\
    \"MetricTransformations\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"MetricTransformation\"},\
      \"max\":1,\
      \"min\":1\
    },\
    \"MetricValue\":{\
      \"type\":\"string\",\
      \"documentation\":\"<p>The value to publish to the CloudWatch metric. For example, if you're counting the occurrences of a term like <code>Error</code>, the value is <code>1</code> for each occurrence. If you're counting the bytes transferred, the value is the value in the log event.</p>\",\
      \"max\":100\
    },\
    \"NextToken\":{\
      \"type\":\"string\",\
      \"documentation\":\"<p>The token for the next set of items to return. The token expires after 24 hours.</p>\",\
      \"min\":1\
    },\
    \"OperationAbortedException\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p>Multiple concurrent requests to update the same resource were in conflict.</p>\",\
      \"exception\":true\
    },\
    \"OrderBy\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"LogStreamName\",\
        \"LastEventTime\"\
      ]\
    },\
    \"OutputFormat\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"json\",\
        \"plain\",\
        \"w3c\",\
        \"raw\",\
        \"parquet\"\
      ]\
    },\
    \"OutputLogEvent\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"timestamp\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The time the event occurred, expressed as the number of milliseconds after <code>Jan 1, 1970 00:00:00 UTC</code>.</p>\"\
        },\
        \"message\":{\
          \"shape\":\"EventMessage\",\
          \"documentation\":\"<p>The data contained in the log event.</p>\"\
        },\
        \"ingestionTime\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The time the event was ingested, expressed as the number of milliseconds after <code>Jan 1, 1970 00:00:00 UTC</code>.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Represents a log event.</p>\"\
    },\
    \"OutputLogEvents\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"OutputLogEvent\"}\
    },\
    \"PatternId\":{\
      \"type\":\"string\",\
      \"max\":32,\
      \"min\":32\
    },\
    \"PatternRegex\":{\
      \"type\":\"string\",\
      \"min\":1\
    },\
    \"PatternString\":{\
      \"type\":\"string\",\
      \"min\":1\
    },\
    \"PatternToken\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"dynamicTokenPosition\":{\
          \"shape\":\"DynamicTokenPosition\",\
          \"documentation\":\"<p>For a dynamic token, this indicates where in the pattern that this token appears, related to other dynamic tokens. The dynamic token that appears first has a value of <code>1</code>, the one that appears second is <code>2</code>, and so on.</p>\"\
        },\
        \"isDynamic\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Specifies whether this is a dynamic token.</p>\"\
        },\
        \"tokenString\":{\
          \"shape\":\"TokenString\",\
          \"documentation\":\"<p>The string represented by this token. If this is a dynamic token, the value will be <code>&lt;*&gt;</code> </p>\"\
        },\
        \"enumerations\":{\
          \"shape\":\"Enumerations\",\
          \"documentation\":\"<p>Contains the values found for a dynamic token, and the number of times each value was found.</p>\"\
        }\
      },\
      \"documentation\":\"<p>A tructures that contains information about one pattern token related to an anomaly.</p> <p>For more information about patterns and tokens, see <a href=\\\"https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_CreateLogAnomalyDetector.html\\\">CreateLogAnomalyDetector</a>. </p>\"\
    },\
    \"PatternTokens\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"PatternToken\"}\
    },\
    \"Percentage\":{\
      \"type\":\"integer\",\
      \"max\":100,\
      \"min\":0\
    },\
    \"Policy\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"deliveryDestinationPolicy\":{\
          \"shape\":\"DeliveryDestinationPolicy\",\
          \"documentation\":\"<p>The contents of the delivery destination policy.</p>\"\
        }\
      },\
      \"documentation\":\"<p>A structure that contains information about one delivery destination policy.</p>\"\
    },\
    \"PolicyDocument\":{\
      \"type\":\"string\",\
      \"max\":5120,\
      \"min\":1\
    },\
    \"PolicyName\":{\"type\":\"string\"},\
    \"PolicyType\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"DATA_PROTECTION_POLICY\",\
        \"SUBSCRIPTION_FILTER_POLICY\"\
      ]\
    },\
    \"Priority\":{\
      \"type\":\"string\",\
      \"min\":1\
    },\
    \"PutAccountPolicyRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"policyName\",\
        \"policyDocument\",\
        \"policyType\"\
      ],\
      \"members\":{\
        \"policyName\":{\
          \"shape\":\"PolicyName\",\
          \"documentation\":\"<p>A name for the policy. This must be unique within the account.</p>\"\
        },\
        \"policyDocument\":{\
          \"shape\":\"AccountPolicyDocument\",\
          \"documentation\":\"<p>Specify the policy, in JSON.</p> <p> <b>Data protection policy</b> </p> <p>A data protection policy must include two JSON blocks:</p> <ul> <li> <p>The first block must include both a <code>DataIdentifer</code> array and an <code>Operation</code> property with an <code>Audit</code> action. The <code>DataIdentifer</code> array lists the types of sensitive data that you want to mask. For more information about the available options, see <a href=\\\"https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/mask-sensitive-log-data-types.html\\\">Types of data that you can mask</a>.</p> <p>The <code>Operation</code> property with an <code>Audit</code> action is required to find the sensitive data terms. This <code>Audit</code> action must contain a <code>FindingsDestination</code> object. You can optionally use that <code>FindingsDestination</code> object to list one or more destinations to send audit findings to. If you specify destinations such as log groups, Firehose streams, and S3 buckets, they must already exist.</p> </li> <li> <p>The second block must include both a <code>DataIdentifer</code> array and an <code>Operation</code> property with an <code>Deidentify</code> action. The <code>DataIdentifer</code> array must exactly match the <code>DataIdentifer</code> array in the first block of the policy.</p> <p>The <code>Operation</code> property with the <code>Deidentify</code> action is what actually masks the data, and it must contain the <code> \\\"MaskConfig\\\": {}</code> object. The <code> \\\"MaskConfig\\\": {}</code> object must be empty.</p> </li> </ul> <p>For an example data protection policy, see the <b>Examples</b> section on this page.</p> <important> <p>The contents of the two <code>DataIdentifer</code> arrays must match exactly.</p> </important> <p>In addition to the two JSON blocks, the <code>policyDocument</code> can also include <code>Name</code>, <code>Description</code>, and <code>Version</code> fields. The <code>Name</code> is different than the operation's <code>policyName</code> parameter, and is used as a dimension when CloudWatch Logs reports audit findings metrics to CloudWatch.</p> <p>The JSON specified in <code>policyDocument</code> can be up to 30,720 characters long.</p> <p> <b>Subscription filter policy</b> </p> <p>A subscription filter policy can include the following attributes in a JSON block:</p> <ul> <li> <p> <b>DestinationArn</b> The ARN of the destination to deliver log events to. Supported destinations are:</p> <ul> <li> <p>An Kinesis Data Streams data stream in the same account as the subscription policy, for same-account delivery.</p> </li> <li> <p>An Firehose data stream in the same account as the subscription policy, for same-account delivery.</p> </li> <li> <p>A Lambda function in the same account as the subscription policy, for same-account delivery.</p> </li> <li> <p>A logical destination in a different account created with <a href=\\\"https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_PutDestination.html\\\">PutDestination</a>, for cross-account delivery. Kinesis Data Streams and Firehose are supported as logical destinations.</p> </li> </ul> </li> <li> <p> <b>RoleArn</b> The ARN of an IAM role that grants CloudWatch Logs permissions to deliver ingested log events to the destination stream. You don't need to provide the ARN when you are working with a logical destination for cross-account delivery.</p> </li> <li> <p> <b>FilterPattern</b> A filter pattern for subscribing to a filtered stream of log events.</p> </li> <li> <p> <b>Distribution</b>The method used to distribute log data to the destination. By default, log data is grouped by log stream, but the grouping can be set to <code>Random</code> for a more even distribution. This property is only applicable when the destination is an Kinesis Data Streams data stream.</p> </li> </ul>\"\
        },\
        \"policyType\":{\
          \"shape\":\"PolicyType\",\
          \"documentation\":\"<p>The type of policy that you're creating or updating.</p>\"\
        },\
        \"scope\":{\
          \"shape\":\"Scope\",\
          \"documentation\":\"<p>Currently the only valid value for this parameter is <code>ALL</code>, which specifies that the data protection policy applies to all log groups in the account. If you omit this parameter, the default of <code>ALL</code> is used.</p>\"\
        },\
        \"selectionCriteria\":{\
          \"shape\":\"SelectionCriteria\",\
          \"documentation\":\"<p>Use this parameter to apply the subscription filter policy to a subset of log groups in the account. Currently, the only supported filter is <code>LogGroupName NOT IN []</code>. The <code>selectionCriteria</code> string can be up to 25KB in length. The length is determined by using its UTF-8 bytes.</p> <p>Using the <code>selectionCriteria</code> parameter is useful to help prevent infinite loops. For more information, see <a href=\\\"https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/Subscriptions-recursion-prevention.html\\\">Log recursion prevention</a>.</p> <p>Specifing <code>selectionCriteria</code> is valid only when you specify <code> SUBSCRIPTION_FILTER_POLICY</code> for <code>policyType</code>.</p>\"\
        }\
      }\
    },\
    \"PutAccountPolicyResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"accountPolicy\":{\
          \"shape\":\"AccountPolicy\",\
          \"documentation\":\"<p>The account policy that you created.</p>\"\
        }\
      }\
    },\
    \"PutDataProtectionPolicyRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"logGroupIdentifier\",\
        \"policyDocument\"\
      ],\
      \"members\":{\
        \"logGroupIdentifier\":{\
          \"shape\":\"LogGroupIdentifier\",\
          \"documentation\":\"<p>Specify either the log group name or log group ARN.</p>\"\
        },\
        \"policyDocument\":{\
          \"shape\":\"DataProtectionPolicyDocument\",\
          \"documentation\":\"<p>Specify the data protection policy, in JSON.</p> <p>This policy must include two JSON blocks:</p> <ul> <li> <p>The first block must include both a <code>DataIdentifer</code> array and an <code>Operation</code> property with an <code>Audit</code> action. The <code>DataIdentifer</code> array lists the types of sensitive data that you want to mask. For more information about the available options, see <a href=\\\"https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/mask-sensitive-log-data-types.html\\\">Types of data that you can mask</a>.</p> <p>The <code>Operation</code> property with an <code>Audit</code> action is required to find the sensitive data terms. This <code>Audit</code> action must contain a <code>FindingsDestination</code> object. You can optionally use that <code>FindingsDestination</code> object to list one or more destinations to send audit findings to. If you specify destinations such as log groups, Firehose streams, and S3 buckets, they must already exist.</p> </li> <li> <p>The second block must include both a <code>DataIdentifer</code> array and an <code>Operation</code> property with an <code>Deidentify</code> action. The <code>DataIdentifer</code> array must exactly match the <code>DataIdentifer</code> array in the first block of the policy.</p> <p>The <code>Operation</code> property with the <code>Deidentify</code> action is what actually masks the data, and it must contain the <code> \\\"MaskConfig\\\": {}</code> object. The <code> \\\"MaskConfig\\\": {}</code> object must be empty.</p> </li> </ul> <p>For an example data protection policy, see the <b>Examples</b> section on this page.</p> <important> <p>The contents of the two <code>DataIdentifer</code> arrays must match exactly.</p> </important> <p>In addition to the two JSON blocks, the <code>policyDocument</code> can also include <code>Name</code>, <code>Description</code>, and <code>Version</code> fields. The <code>Name</code> is used as a dimension when CloudWatch Logs reports audit findings metrics to CloudWatch.</p> <p>The JSON specified in <code>policyDocument</code> can be up to 30,720 characters.</p>\"\
        }\
      }\
    },\
    \"PutDataProtectionPolicyResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"logGroupIdentifier\":{\
          \"shape\":\"LogGroupIdentifier\",\
          \"documentation\":\"<p>The log group name or ARN that you specified in your request.</p>\"\
        },\
        \"policyDocument\":{\
          \"shape\":\"DataProtectionPolicyDocument\",\
          \"documentation\":\"<p>The data protection policy used for this log group.</p>\"\
        },\
        \"lastUpdatedTime\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The date and time that this policy was most recently updated.</p>\"\
        }\
      }\
    },\
    \"PutDeliveryDestinationPolicyRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"deliveryDestinationName\",\
        \"deliveryDestinationPolicy\"\
      ],\
      \"members\":{\
        \"deliveryDestinationName\":{\
          \"shape\":\"DeliveryDestinationName\",\
          \"documentation\":\"<p>The name of the delivery destination to assign this policy to.</p>\"\
        },\
        \"deliveryDestinationPolicy\":{\
          \"shape\":\"DeliveryDestinationPolicy\",\
          \"documentation\":\"<p>The contents of the policy.</p>\"\
        }\
      }\
    },\
    \"PutDeliveryDestinationPolicyResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"policy\":{\
          \"shape\":\"Policy\",\
          \"documentation\":\"<p>The contents of the policy that you just created.</p>\"\
        }\
      }\
    },\
    \"PutDeliveryDestinationRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"name\",\
        \"deliveryDestinationConfiguration\"\
      ],\
      \"members\":{\
        \"name\":{\
          \"shape\":\"DeliveryDestinationName\",\
          \"documentation\":\"<p>A name for this delivery destination. This name must be unique for all delivery destinations in your account.</p>\"\
        },\
        \"outputFormat\":{\
          \"shape\":\"OutputFormat\",\
          \"documentation\":\"<p>The format for the logs that this delivery destination will receive.</p>\"\
        },\
        \"deliveryDestinationConfiguration\":{\
          \"shape\":\"DeliveryDestinationConfiguration\",\
          \"documentation\":\"<p>A structure that contains the ARN of the Amazon Web Services resource that will receive the logs.</p>\"\
        },\
        \"tags\":{\
          \"shape\":\"Tags\",\
          \"documentation\":\"<p>An optional list of key-value pairs to associate with the resource.</p> <p>For more information about tagging, see <a href=\\\"https://docs.aws.amazon.com/general/latest/gr/aws_tagging.html\\\">Tagging Amazon Web Services resources</a> </p>\"\
        }\
      }\
    },\
    \"PutDeliveryDestinationResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"deliveryDestination\":{\
          \"shape\":\"DeliveryDestination\",\
          \"documentation\":\"<p>A structure containing information about the delivery destination that you just created or updated.</p>\"\
        }\
      }\
    },\
    \"PutDeliverySourceRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"name\",\
        \"resourceArn\",\
        \"logType\"\
      ],\
      \"members\":{\
        \"name\":{\
          \"shape\":\"DeliverySourceName\",\
          \"documentation\":\"<p>A name for this delivery source. This name must be unique for all delivery sources in your account.</p>\"\
        },\
        \"resourceArn\":{\
          \"shape\":\"Arn\",\
          \"documentation\":\"<p>The ARN of the Amazon Web Services resource that is generating and sending logs. For example, <code>arn:aws:workmail:us-east-1:123456789012:organization/m-1234EXAMPLEabcd1234abcd1234abcd1234</code> </p>\"\
        },\
        \"logType\":{\
          \"shape\":\"LogType\",\
          \"documentation\":\"<p>Defines the type of log that the source is sending.</p> <ul> <li> <p>For Amazon CodeWhisperer, the valid value is <code>EVENT_LOGS</code>.</p> </li> <li> <p>For IAM Identity Centerr, the valid value is <code>ERROR_LOGS</code>.</p> </li> <li> <p>For Amazon WorkMail, the valid values are <code>ACCESS_CONTROL_LOGS</code>, <code>AUTHENTICATION_LOGS</code>, <code>WORKMAIL_AVAILABILITY_PROVIDER_LOGS</code>, and <code>WORKMAIL_MAILBOX_ACCESS_LOGS</code>.</p> </li> </ul>\"\
        },\
        \"tags\":{\
          \"shape\":\"Tags\",\
          \"documentation\":\"<p>An optional list of key-value pairs to associate with the resource.</p> <p>For more information about tagging, see <a href=\\\"https://docs.aws.amazon.com/general/latest/gr/aws_tagging.html\\\">Tagging Amazon Web Services resources</a> </p>\"\
        }\
      }\
    },\
    \"PutDeliverySourceResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"deliverySource\":{\
          \"shape\":\"DeliverySource\",\
          \"documentation\":\"<p>A structure containing information about the delivery source that was just created or updated.</p>\"\
        }\
      }\
    },\
    \"PutDestinationPolicyRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"destinationName\",\
        \"accessPolicy\"\
      ],\
      \"members\":{\
        \"destinationName\":{\
          \"shape\":\"DestinationName\",\
          \"documentation\":\"<p>A name for an existing destination.</p>\"\
        },\
        \"accessPolicy\":{\
          \"shape\":\"AccessPolicy\",\
          \"documentation\":\"<p>An IAM policy document that authorizes cross-account users to deliver their log events to the associated destination. This can be up to 5120 bytes.</p>\"\
        },\
        \"forceUpdate\":{\
          \"shape\":\"ForceUpdate\",\
          \"documentation\":\"<p>Specify true if you are updating an existing destination policy to grant permission to an organization ID instead of granting permission to individual Amazon Web Services accounts. Before you update a destination policy this way, you must first update the subscription filters in the accounts that send logs to this destination. If you do not, the subscription filters might stop working. By specifying <code>true</code> for <code>forceUpdate</code>, you are affirming that you have already updated the subscription filters. For more information, see <a href=\\\"https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/Cross-Account-Log_Subscription-Update.html\\\"> Updating an existing cross-account subscription</a> </p> <p>If you omit this parameter, the default of <code>false</code> is used.</p>\"\
        }\
      }\
    },\
    \"PutDestinationRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"destinationName\",\
        \"targetArn\",\
        \"roleArn\"\
      ],\
      \"members\":{\
        \"destinationName\":{\
          \"shape\":\"DestinationName\",\
          \"documentation\":\"<p>A name for the destination.</p>\"\
        },\
        \"targetArn\":{\
          \"shape\":\"TargetArn\",\
          \"documentation\":\"<p>The ARN of an Amazon Kinesis stream to which to deliver matching log events.</p>\"\
        },\
        \"roleArn\":{\
          \"shape\":\"RoleArn\",\
          \"documentation\":\"<p>The ARN of an IAM role that grants CloudWatch Logs permissions to call the Amazon Kinesis <code>PutRecord</code> operation on the destination stream.</p>\"\
        },\
        \"tags\":{\
          \"shape\":\"Tags\",\
          \"documentation\":\"<p>An optional list of key-value pairs to associate with the resource.</p> <p>For more information about tagging, see <a href=\\\"https://docs.aws.amazon.com/general/latest/gr/aws_tagging.html\\\">Tagging Amazon Web Services resources</a> </p>\"\
        }\
      }\
    },\
    \"PutDestinationResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"destination\":{\
          \"shape\":\"Destination\",\
          \"documentation\":\"<p>The destination.</p>\"\
        }\
      }\
    },\
    \"PutLogEventsRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"logGroupName\",\
        \"logStreamName\",\
        \"logEvents\"\
      ],\
      \"members\":{\
        \"logGroupName\":{\
          \"shape\":\"LogGroupName\",\
          \"documentation\":\"<p>The name of the log group.</p>\"\
        },\
        \"logStreamName\":{\
          \"shape\":\"LogStreamName\",\
          \"documentation\":\"<p>The name of the log stream.</p>\"\
        },\
        \"logEvents\":{\
          \"shape\":\"InputLogEvents\",\
          \"documentation\":\"<p>The log events.</p>\"\
        },\
        \"sequenceToken\":{\
          \"shape\":\"SequenceToken\",\
          \"documentation\":\"<p>The sequence token obtained from the response of the previous <code>PutLogEvents</code> call.</p> <important> <p>The <code>sequenceToken</code> parameter is now ignored in <code>PutLogEvents</code> actions. <code>PutLogEvents</code> actions are now accepted and never return <code>InvalidSequenceTokenException</code> or <code>DataAlreadyAcceptedException</code> even if the sequence token is not valid.</p> </important>\"\
        }\
      }\
    },\
    \"PutLogEventsResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"nextSequenceToken\":{\
          \"shape\":\"SequenceToken\",\
          \"documentation\":\"<p>The next sequence token.</p> <important> <p>This field has been deprecated.</p> <p>The sequence token is now ignored in <code>PutLogEvents</code> actions. <code>PutLogEvents</code> actions are always accepted even if the sequence token is not valid. You can use parallel <code>PutLogEvents</code> actions on the same log stream and you do not need to wait for the response of a previous <code>PutLogEvents</code> action to obtain the <code>nextSequenceToken</code> value.</p> </important>\"\
        },\
        \"rejectedLogEventsInfo\":{\
          \"shape\":\"RejectedLogEventsInfo\",\
          \"documentation\":\"<p>The rejected events.</p>\"\
        }\
      }\
    },\
    \"PutMetricFilterRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"logGroupName\",\
        \"filterName\",\
        \"filterPattern\",\
        \"metricTransformations\"\
      ],\
      \"members\":{\
        \"logGroupName\":{\
          \"shape\":\"LogGroupName\",\
          \"documentation\":\"<p>The name of the log group.</p>\"\
        },\
        \"filterName\":{\
          \"shape\":\"FilterName\",\
          \"documentation\":\"<p>A name for the metric filter.</p>\"\
        },\
        \"filterPattern\":{\
          \"shape\":\"FilterPattern\",\
          \"documentation\":\"<p>A filter pattern for extracting metric data out of ingested log events.</p>\"\
        },\
        \"metricTransformations\":{\
          \"shape\":\"MetricTransformations\",\
          \"documentation\":\"<p>A collection of information that defines how metric data gets emitted.</p>\"\
        }\
      }\
    },\
    \"PutQueryDefinitionRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"name\",\
        \"queryString\"\
      ],\
      \"members\":{\
        \"name\":{\
          \"shape\":\"QueryDefinitionName\",\
          \"documentation\":\"<p>A name for the query definition. If you are saving numerous query definitions, we recommend that you name them. This way, you can find the ones you want by using the first part of the name as a filter in the <code>queryDefinitionNamePrefix</code> parameter of <a href=\\\"https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_DescribeQueryDefinitions.html\\\">DescribeQueryDefinitions</a>.</p>\"\
        },\
        \"queryDefinitionId\":{\
          \"shape\":\"QueryId\",\
          \"documentation\":\"<p>If you are updating a query definition, use this parameter to specify the ID of the query definition that you want to update. You can use <a href=\\\"https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_DescribeQueryDefinitions.html\\\">DescribeQueryDefinitions</a> to retrieve the IDs of your saved query definitions.</p> <p>If you are creating a query definition, do not specify this parameter. CloudWatch generates a unique ID for the new query definition and include it in the response to this operation.</p>\"\
        },\
        \"logGroupNames\":{\
          \"shape\":\"LogGroupNames\",\
          \"documentation\":\"<p>Use this parameter to include specific log groups as part of your query definition.</p> <p>If you are updating a query definition and you omit this parameter, then the updated definition will contain no log groups.</p>\"\
        },\
        \"queryString\":{\
          \"shape\":\"QueryDefinitionString\",\
          \"documentation\":\"<p>The query string to use for this definition. For more information, see <a href=\\\"https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/CWL_QuerySyntax.html\\\">CloudWatch Logs Insights Query Syntax</a>.</p>\"\
        },\
        \"clientToken\":{\
          \"shape\":\"ClientToken\",\
          \"documentation\":\"<p>Used as an idempotency token, to avoid returning an exception if the service receives the same request twice because of a network error.</p>\",\
          \"idempotencyToken\":true\
        }\
      }\
    },\
    \"PutQueryDefinitionResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"queryDefinitionId\":{\
          \"shape\":\"QueryId\",\
          \"documentation\":\"<p>The ID of the query definition.</p>\"\
        }\
      }\
    },\
    \"PutResourcePolicyRequest\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"policyName\":{\
          \"shape\":\"PolicyName\",\
          \"documentation\":\"<p>Name of the new policy. This parameter is required.</p>\"\
        },\
        \"policyDocument\":{\
          \"shape\":\"PolicyDocument\",\
          \"documentation\":\"<p>Details of the new policy, including the identity of the principal that is enabled to put logs to this account. This is formatted as a JSON string. This parameter is required.</p> <p>The following example creates a resource policy enabling the Route 53 service to put DNS query logs in to the specified log group. Replace <code>\\\"logArn\\\"</code> with the ARN of your CloudWatch Logs resource, such as a log group or log stream.</p> <p>CloudWatch Logs also supports <a href=\\\"https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_policies_condition-keys.html#condition-keys-sourcearn\\\">aws:SourceArn</a> and <a href=\\\"https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_policies_condition-keys.html#condition-keys-sourceaccount\\\">aws:SourceAccount</a> condition context keys.</p> <p>In the example resource policy, you would replace the value of <code>SourceArn</code> with the resource making the call from RouteÂ 53 to CloudWatch Logs. You would also replace the value of <code>SourceAccount</code> with the Amazon Web Services account ID making that call.</p> <p/> <p> <code>{ \\\"Version\\\": \\\"2012-10-17\\\", \\\"Statement\\\": [ { \\\"Sid\\\": \\\"Route53LogsToCloudWatchLogs\\\", \\\"Effect\\\": \\\"Allow\\\", \\\"Principal\\\": { \\\"Service\\\": [ \\\"route53.amazonaws.com\\\" ] }, \\\"Action\\\": \\\"logs:PutLogEvents\\\", \\\"Resource\\\": \\\"logArn\\\", \\\"Condition\\\": { \\\"ArnLike\\\": { \\\"aws:SourceArn\\\": \\\"myRoute53ResourceArn\\\" }, \\\"StringEquals\\\": { \\\"aws:SourceAccount\\\": \\\"myAwsAccountId\\\" } } } ] }</code> </p>\"\
        }\
      }\
    },\
    \"PutResourcePolicyResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"resourcePolicy\":{\
          \"shape\":\"ResourcePolicy\",\
          \"documentation\":\"<p>The new policy.</p>\"\
        }\
      }\
    },\
    \"PutRetentionPolicyRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"logGroupName\",\
        \"retentionInDays\"\
      ],\
      \"members\":{\
        \"logGroupName\":{\
          \"shape\":\"LogGroupName\",\
          \"documentation\":\"<p>The name of the log group.</p>\"\
        },\
        \"retentionInDays\":{\"shape\":\"Days\"}\
      }\
    },\
    \"PutSubscriptionFilterRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"logGroupName\",\
        \"filterName\",\
        \"filterPattern\",\
        \"destinationArn\"\
      ],\
      \"members\":{\
        \"logGroupName\":{\
          \"shape\":\"LogGroupName\",\
          \"documentation\":\"<p>The name of the log group.</p>\"\
        },\
        \"filterName\":{\
          \"shape\":\"FilterName\",\
          \"documentation\":\"<p>A name for the subscription filter. If you are updating an existing filter, you must specify the correct name in <code>filterName</code>. To find the name of the filter currently associated with a log group, use <a href=\\\"https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_DescribeSubscriptionFilters.html\\\">DescribeSubscriptionFilters</a>.</p>\"\
        },\
        \"filterPattern\":{\
          \"shape\":\"FilterPattern\",\
          \"documentation\":\"<p>A filter pattern for subscribing to a filtered stream of log events.</p>\"\
        },\
        \"destinationArn\":{\
          \"shape\":\"DestinationArn\",\
          \"documentation\":\"<p>The ARN of the destination to deliver matching log events to. Currently, the supported destinations are:</p> <ul> <li> <p>An Amazon Kinesis stream belonging to the same account as the subscription filter, for same-account delivery.</p> </li> <li> <p>A logical destination (specified using an ARN) belonging to a different account, for cross-account delivery.</p> <p>If you're setting up a cross-account subscription, the destination must have an IAM policy associated with it. The IAM policy must allow the sender to send logs to the destination. For more information, see <a href=\\\"https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_PutDestinationPolicy.html\\\">PutDestinationPolicy</a>.</p> </li> <li> <p>A Kinesis Data Firehose delivery stream belonging to the same account as the subscription filter, for same-account delivery.</p> </li> <li> <p>A Lambda function belonging to the same account as the subscription filter, for same-account delivery.</p> </li> </ul>\"\
        },\
        \"roleArn\":{\
          \"shape\":\"RoleArn\",\
          \"documentation\":\"<p>The ARN of an IAM role that grants CloudWatch Logs permissions to deliver ingested log events to the destination stream. You don't need to provide the ARN when you are working with a logical destination for cross-account delivery.</p>\"\
        },\
        \"distribution\":{\
          \"shape\":\"Distribution\",\
          \"documentation\":\"<p>The method used to distribute log data to the destination. By default, log data is grouped by log stream, but the grouping can be set to random for a more even distribution. This property is only applicable when the destination is an Amazon Kinesis data stream. </p>\"\
        }\
      }\
    },\
    \"QueryCharOffset\":{\"type\":\"integer\"},\
    \"QueryCompileError\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"location\":{\
          \"shape\":\"QueryCompileErrorLocation\",\
          \"documentation\":\"<p>Reserved.</p>\"\
        },\
        \"message\":{\
          \"shape\":\"Message\",\
          \"documentation\":\"<p>Reserved.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Reserved.</p>\"\
    },\
    \"QueryCompileErrorLocation\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"startCharOffset\":{\
          \"shape\":\"QueryCharOffset\",\
          \"documentation\":\"<p>Reserved.</p>\"\
        },\
        \"endCharOffset\":{\
          \"shape\":\"QueryCharOffset\",\
          \"documentation\":\"<p>Reserved.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Reserved.</p>\"\
    },\
    \"QueryDefinition\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"queryDefinitionId\":{\
          \"shape\":\"QueryId\",\
          \"documentation\":\"<p>The unique ID of the query definition.</p>\"\
        },\
        \"name\":{\
          \"shape\":\"QueryDefinitionName\",\
          \"documentation\":\"<p>The name of the query definition.</p>\"\
        },\
        \"queryString\":{\
          \"shape\":\"QueryDefinitionString\",\
          \"documentation\":\"<p>The query string to use for this definition. For more information, see <a href=\\\"https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/CWL_QuerySyntax.html\\\">CloudWatch Logs Insights Query Syntax</a>.</p>\"\
        },\
        \"lastModified\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The date that the query definition was most recently modified.</p>\"\
        },\
        \"logGroupNames\":{\
          \"shape\":\"LogGroupNames\",\
          \"documentation\":\"<p>If this query definition contains a list of log groups that it is limited to, that list appears here.</p>\"\
        }\
      },\
      \"documentation\":\"<p>This structure contains details about a saved CloudWatch Logs Insights query definition.</p>\"\
    },\
    \"QueryDefinitionList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"QueryDefinition\"}\
    },\
    \"QueryDefinitionName\":{\
      \"type\":\"string\",\
      \"max\":255,\
      \"min\":1\
    },\
    \"QueryDefinitionString\":{\
      \"type\":\"string\",\
      \"max\":10000,\
      \"min\":1\
    },\
    \"QueryId\":{\
      \"type\":\"string\",\
      \"max\":256,\
      \"min\":0\
    },\
    \"QueryInfo\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"queryId\":{\
          \"shape\":\"QueryId\",\
          \"documentation\":\"<p>The unique ID number of this query.</p>\"\
        },\
        \"queryString\":{\
          \"shape\":\"QueryString\",\
          \"documentation\":\"<p>The query string used in this query.</p>\"\
        },\
        \"status\":{\
          \"shape\":\"QueryStatus\",\
          \"documentation\":\"<p>The status of this query. Possible values are <code>Cancelled</code>, <code>Complete</code>, <code>Failed</code>, <code>Running</code>, <code>Scheduled</code>, and <code>Unknown</code>.</p>\"\
        },\
        \"createTime\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The date and time that this query was created.</p>\"\
        },\
        \"logGroupName\":{\
          \"shape\":\"LogGroupName\",\
          \"documentation\":\"<p>The name of the log group scanned by this query.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Information about one CloudWatch Logs Insights query that matches the request in a <code>DescribeQueries</code> operation. </p>\"\
    },\
    \"QueryInfoList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"QueryInfo\"}\
    },\
    \"QueryListMaxResults\":{\
      \"type\":\"integer\",\
      \"max\":1000,\
      \"min\":1\
    },\
    \"QueryResults\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"ResultRows\"}\
    },\
    \"QueryStatistics\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"recordsMatched\":{\
          \"shape\":\"StatsValue\",\
          \"documentation\":\"<p>The number of log events that matched the query string.</p>\"\
        },\
        \"recordsScanned\":{\
          \"shape\":\"StatsValue\",\
          \"documentation\":\"<p>The total number of log events scanned during the query.</p>\"\
        },\
        \"bytesScanned\":{\
          \"shape\":\"StatsValue\",\
          \"documentation\":\"<p>The total number of bytes in the log events scanned during the query.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Contains the number of log events scanned by the query, the number of log events that matched the query criteria, and the total number of bytes in the log events that were scanned.</p>\"\
    },\
    \"QueryStatus\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"Scheduled\",\
        \"Running\",\
        \"Complete\",\
        \"Failed\",\
        \"Cancelled\",\
        \"Timeout\",\
        \"Unknown\"\
      ]\
    },\
    \"QueryString\":{\
      \"type\":\"string\",\
      \"max\":10000,\
      \"min\":0\
    },\
    \"RejectedLogEventsInfo\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"tooNewLogEventStartIndex\":{\
          \"shape\":\"LogEventIndex\",\
          \"documentation\":\"<p>The index of the first log event that is too new. This field is inclusive.</p>\"\
        },\
        \"tooOldLogEventEndIndex\":{\
          \"shape\":\"LogEventIndex\",\
          \"documentation\":\"<p>The index of the last log event that is too old. This field is exclusive.</p>\"\
        },\
        \"expiredLogEventEndIndex\":{\
          \"shape\":\"LogEventIndex\",\
          \"documentation\":\"<p>The expired log events.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Represents the rejected events.</p>\"\
    },\
    \"RequestId\":{\
      \"type\":\"string\",\
      \"max\":256,\
      \"min\":0\
    },\
    \"ResourceAlreadyExistsException\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p>The specified resource already exists.</p>\",\
      \"exception\":true\
    },\
    \"ResourceArns\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"Arn\"}\
    },\
    \"ResourceIdentifier\":{\
      \"type\":\"string\",\
      \"max\":2048,\
      \"min\":1,\
      \"pattern\":\"[\\\\w+=/:,.@\\\\-\\\\*]*\"\
    },\
    \"ResourceNotFoundException\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p>The specified resource does not exist.</p>\",\
      \"exception\":true\
    },\
    \"ResourcePolicies\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"ResourcePolicy\"}\
    },\
    \"ResourcePolicy\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"policyName\":{\
          \"shape\":\"PolicyName\",\
          \"documentation\":\"<p>The name of the resource policy.</p>\"\
        },\
        \"policyDocument\":{\
          \"shape\":\"PolicyDocument\",\
          \"documentation\":\"<p>The details of the policy.</p>\"\
        },\
        \"lastUpdatedTime\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>Timestamp showing when this policy was last updated, expressed as the number of milliseconds after <code>Jan 1, 1970 00:00:00 UTC</code>.</p>\"\
        }\
      },\
      \"documentation\":\"<p>A policy enabling one or more entities to put logs to a log group in this account.</p>\"\
    },\
    \"ResultField\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"field\":{\
          \"shape\":\"Field\",\
          \"documentation\":\"<p>The log event field.</p>\"\
        },\
        \"value\":{\
          \"shape\":\"Value\",\
          \"documentation\":\"<p>The value of this field.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Contains one field from one log event returned by a CloudWatch Logs Insights query, along with the value of that field.</p> <p>For more information about the fields that are generated by CloudWatch logs, see <a href=\\\"https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/CWL_AnalyzeLogData-discoverable-fields.html\\\">Supported Logs and Discovered Fields</a>.</p>\"\
    },\
    \"ResultRows\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"ResultField\"}\
    },\
    \"RoleArn\":{\
      \"type\":\"string\",\
      \"min\":1\
    },\
    \"Scope\":{\
      \"type\":\"string\",\
      \"enum\":[\"ALL\"]\
    },\
    \"SearchedLogStream\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"logStreamName\":{\
          \"shape\":\"LogStreamName\",\
          \"documentation\":\"<p>The name of the log stream.</p>\"\
        },\
        \"searchedCompletely\":{\
          \"shape\":\"LogStreamSearchedCompletely\",\
          \"documentation\":\"<p>Indicates whether all the events in this log stream were searched.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Represents the search status of a log stream.</p>\"\
    },\
    \"SearchedLogStreams\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"SearchedLogStream\"}\
    },\
    \"SelectionCriteria\":{\"type\":\"string\"},\
    \"SequenceToken\":{\
      \"type\":\"string\",\
      \"min\":1\
    },\
    \"Service\":{\
      \"type\":\"string\",\
      \"max\":255,\
      \"min\":1,\
      \"pattern\":\"[\\\\w]*\"\
    },\
    \"ServiceQuotaExceededException\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p>This request exceeds a service quota.</p>\",\
      \"exception\":true\
    },\
    \"ServiceUnavailableException\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p>The service cannot complete the request.</p>\",\
      \"exception\":true,\
      \"fault\":true\
    },\
    \"SessionId\":{\
      \"type\":\"string\",\
      \"max\":256,\
      \"min\":0\
    },\
    \"SessionStreamingException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"message\":{\"shape\":\"Message\"}\
      },\
      \"documentation\":\"<p>his exception is returned if an unknown error occurs during a Live Tail session.</p>\",\
      \"exception\":true\
    },\
    \"SessionTimeoutException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"message\":{\"shape\":\"Message\"}\
      },\
      \"documentation\":\"<p>This exception is returned in a Live Tail stream when the Live Tail session times out. Live Tail sessions time out after three hours.</p>\",\
      \"exception\":true\
    },\
    \"StandardUnit\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"Seconds\",\
        \"Microseconds\",\
        \"Milliseconds\",\
        \"Bytes\",\
        \"Kilobytes\",\
        \"Megabytes\",\
        \"Gigabytes\",\
        \"Terabytes\",\
        \"Bits\",\
        \"Kilobits\",\
        \"Megabits\",\
        \"Gigabits\",\
        \"Terabits\",\
        \"Percent\",\
        \"Count\",\
        \"Bytes/Second\",\
        \"Kilobytes/Second\",\
        \"Megabytes/Second\",\
        \"Gigabytes/Second\",\
        \"Terabytes/Second\",\
        \"Bits/Second\",\
        \"Kilobits/Second\",\
        \"Megabits/Second\",\
        \"Gigabits/Second\",\
        \"Terabits/Second\",\
        \"Count/Second\",\
        \"None\"\
      ]\
    },\
    \"StartFromHead\":{\"type\":\"boolean\"},\
    \"StartLiveTailLogGroupIdentifiers\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"LogGroupIdentifier\"},\
      \"max\":10,\
      \"min\":1\
    },\
    \"StartLiveTailRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"logGroupIdentifiers\"],\
      \"members\":{\
        \"logGroupIdentifiers\":{\
          \"shape\":\"StartLiveTailLogGroupIdentifiers\",\
          \"documentation\":\"<p>An array where each item in the array is a log group to include in the Live Tail session.</p> <p>Specify each log group by its ARN. </p> <p>If you specify an ARN, the ARN can't end with an asterisk (*).</p> <note> <p> You can include up to 10 log groups.</p> </note>\"\
        },\
        \"logStreamNames\":{\
          \"shape\":\"InputLogStreamNames\",\
          \"documentation\":\"<p>If you specify this parameter, then only log events in the log streams that you specify here are included in the Live Tail session.</p> <p>If you specify this field, you can't also specify the <code>logStreamNamePrefixes</code> field.</p> <note> <p>You can specify this parameter only if you specify only one log group in <code>logGroupIdentifiers</code>.</p> </note>\"\
        },\
        \"logStreamNamePrefixes\":{\
          \"shape\":\"InputLogStreamNames\",\
          \"documentation\":\"<p>If you specify this parameter, then only log events in the log streams that have names that start with the prefixes that you specify here are included in the Live Tail session.</p> <p>If you specify this field, you can't also specify the <code>logStreamNames</code> field.</p> <note> <p>You can specify this parameter only if you specify only one log group in <code>logGroupIdentifiers</code>.</p> </note>\"\
        },\
        \"logEventFilterPattern\":{\
          \"shape\":\"FilterPattern\",\
          \"documentation\":\"<p>An optional pattern to use to filter the results to include only log events that match the pattern. For example, a filter pattern of <code>error 404</code> causes only log events that include both <code>error</code> and <code>404</code> to be included in the Live Tail stream.</p> <p>Regular expression filter patterns are supported.</p> <p>For more information about filter pattern syntax, see <a href=\\\"https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/FilterAndPatternSyntax.html\\\">Filter and Pattern Syntax</a>.</p>\"\
        }\
      }\
    },\
    \"StartLiveTailResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"responseStream\":{\
          \"shape\":\"StartLiveTailResponseStream\",\
          \"documentation\":\"<p>An object that includes the stream returned by your request. It can include both log events and exceptions.</p>\"\
        }\
      }\
    },\
    \"StartLiveTailResponseStream\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"sessionStart\":{\
          \"shape\":\"LiveTailSessionStart\",\
          \"documentation\":\"<p>This object contains information about this Live Tail session, including the log groups included and the log stream filters, if any.</p>\"\
        },\
        \"sessionUpdate\":{\
          \"shape\":\"LiveTailSessionUpdate\",\
          \"documentation\":\"<p>This object contains the log events and session metadata.</p>\"\
        },\
        \"SessionTimeoutException\":{\
          \"shape\":\"SessionTimeoutException\",\
          \"documentation\":\"<p>This exception is returned in the stream when the Live Tail session times out. Live Tail sessions time out after three hours.</p>\"\
        },\
        \"SessionStreamingException\":{\
          \"shape\":\"SessionStreamingException\",\
          \"documentation\":\"<p>This exception is returned if an unknown error occurs.</p>\"\
        }\
      },\
      \"documentation\":\"<p>This object includes the stream returned by your <a href=\\\"https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_StartLiveTail.html\\\">StartLiveTail</a> request.</p>\",\
      \"eventstream\":true\
    },\
    \"StartQueryRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"startTime\",\
        \"endTime\",\
        \"queryString\"\
      ],\
      \"members\":{\
        \"logGroupName\":{\
          \"shape\":\"LogGroupName\",\
          \"documentation\":\"<p>The log group on which to perform the query.</p> <note> <p>A <code>StartQuery</code> operation must include exactly one of the following parameters: <code>logGroupName</code>, <code>logGroupNames</code>, or <code>logGroupIdentifiers</code>. </p> </note>\"\
        },\
        \"logGroupNames\":{\
          \"shape\":\"LogGroupNames\",\
          \"documentation\":\"<p>The list of log groups to be queried. You can include up to 50 log groups.</p> <note> <p>A <code>StartQuery</code> operation must include exactly one of the following parameters: <code>logGroupName</code>, <code>logGroupNames</code>, or <code>logGroupIdentifiers</code>. </p> </note>\"\
        },\
        \"logGroupIdentifiers\":{\
          \"shape\":\"LogGroupIdentifiers\",\
          \"documentation\":\"<p>The list of log groups to query. You can include up to 50 log groups.</p> <p>You can specify them by the log group name or ARN. If a log group that you're querying is in a source account and you're using a monitoring account, you must specify the ARN of the log group here. The query definition must also be defined in the monitoring account.</p> <p>If you specify an ARN, the ARN can't end with an asterisk (*).</p> <p>A <code>StartQuery</code> operation must include exactly one of the following parameters: <code>logGroupName</code>, <code>logGroupNames</code>, or <code>logGroupIdentifiers</code>. </p>\"\
        },\
        \"startTime\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The beginning of the time range to query. The range is inclusive, so the specified start time is included in the query. Specified as epoch time, the number of seconds since <code>January 1, 1970, 00:00:00 UTC</code>.</p>\"\
        },\
        \"endTime\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The end of the time range to query. The range is inclusive, so the specified end time is included in the query. Specified as epoch time, the number of seconds since <code>January 1, 1970, 00:00:00 UTC</code>.</p>\"\
        },\
        \"queryString\":{\
          \"shape\":\"QueryString\",\
          \"documentation\":\"<p>The query string to use. For more information, see <a href=\\\"https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/CWL_QuerySyntax.html\\\">CloudWatch Logs Insights Query Syntax</a>.</p>\"\
        },\
        \"limit\":{\
          \"shape\":\"EventsLimit\",\
          \"documentation\":\"<p>The maximum number of log events to return in the query. If the query string uses the <code>fields</code> command, only the specified fields and their values are returned. The default is 1000.</p>\"\
        }\
      }\
    },\
    \"StartQueryResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"queryId\":{\
          \"shape\":\"QueryId\",\
          \"documentation\":\"<p>The unique ID of the query. </p>\"\
        }\
      }\
    },\
    \"State\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"Active\",\
        \"Suppressed\",\
        \"Baseline\"\
      ]\
    },\
    \"StatsValue\":{\"type\":\"double\"},\
    \"StopQueryRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"queryId\"],\
      \"members\":{\
        \"queryId\":{\
          \"shape\":\"QueryId\",\
          \"documentation\":\"<p>The ID number of the query to stop. To find this ID number, use <code>DescribeQueries</code>.</p>\"\
        }\
      }\
    },\
    \"StopQueryResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"success\":{\
          \"shape\":\"Success\",\
          \"documentation\":\"<p>This is true if the query was stopped by the <code>StopQuery</code> operation.</p>\"\
        }\
      }\
    },\
    \"StoredBytes\":{\
      \"type\":\"long\",\
      \"min\":0\
    },\
    \"SubscriptionFilter\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"filterName\":{\
          \"shape\":\"FilterName\",\
          \"documentation\":\"<p>The name of the subscription filter.</p>\"\
        },\
        \"logGroupName\":{\
          \"shape\":\"LogGroupName\",\
          \"documentation\":\"<p>The name of the log group.</p>\"\
        },\
        \"filterPattern\":{\"shape\":\"FilterPattern\"},\
        \"destinationArn\":{\
          \"shape\":\"DestinationArn\",\
          \"documentation\":\"<p>The Amazon Resource Name (ARN) of the destination.</p>\"\
        },\
        \"roleArn\":{\
          \"shape\":\"RoleArn\",\
          \"documentation\":\"<p/>\"\
        },\
        \"distribution\":{\"shape\":\"Distribution\"},\
        \"creationTime\":{\
          \"shape\":\"Timestamp\",\
          \"documentation\":\"<p>The creation time of the subscription filter, expressed as the number of milliseconds after <code>Jan 1, 1970 00:00:00 UTC</code>.</p>\"\
        }\
      },\
      \"documentation\":\"<p>Represents a subscription filter.</p>\"\
    },\
    \"SubscriptionFilters\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"SubscriptionFilter\"}\
    },\
    \"Success\":{\"type\":\"boolean\"},\
    \"SuppressionPeriod\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"value\":{\
          \"shape\":\"Integer\",\
          \"documentation\":\"<p>Specifies the number of seconds, minutes or hours to suppress this anomaly. There is no maximum.</p>\"\
        },\
        \"suppressionUnit\":{\
          \"shape\":\"SuppressionUnit\",\
          \"documentation\":\"<p>Specifies whether the value of <code>value</code> is in seconds, minutes, or hours.</p>\"\
        }\
      },\
      \"documentation\":\"<p>If you are suppressing an anomaly temporariliy, this structure defines how long the suppression period is to be.</p>\"\
    },\
    \"SuppressionState\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"SUPPRESSED\",\
        \"UNSUPPRESSED\"\
      ]\
    },\
    \"SuppressionType\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"LIMITED\",\
        \"INFINITE\"\
      ]\
    },\
    \"SuppressionUnit\":{\
      \"type\":\"string\",\
      \"enum\":[\
        \"SECONDS\",\
        \"MINUTES\",\
        \"HOURS\"\
      ]\
    },\
    \"TagKey\":{\
      \"type\":\"string\",\
      \"max\":128,\
      \"min\":1,\
      \"pattern\":\"^([\\\\p{L}\\\\p{Z}\\\\p{N}_.:/=+\\\\-@]+)$\"\
    },\
    \"TagKeyList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"TagKey\"},\
      \"max\":50,\
      \"min\":0\
    },\
    \"TagList\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"TagKey\"},\
      \"min\":1\
    },\
    \"TagLogGroupRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"logGroupName\",\
        \"tags\"\
      ],\
      \"members\":{\
        \"logGroupName\":{\
          \"shape\":\"LogGroupName\",\
          \"documentation\":\"<p>The name of the log group.</p>\"\
        },\
        \"tags\":{\
          \"shape\":\"Tags\",\
          \"documentation\":\"<p>The key-value pairs to use for the tags.</p>\"\
        }\
      },\
      \"deprecated\":true,\
      \"deprecatedMessage\":\"Please use the generic tagging API model TagResourceRequest\"\
    },\
    \"TagResourceRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"resourceArn\",\
        \"tags\"\
      ],\
      \"members\":{\
        \"resourceArn\":{\
          \"shape\":\"AmazonResourceName\",\
          \"documentation\":\"<p>The ARN of the resource that you're adding tags to.</p> <p>The ARN format of a log group is <code>arn:aws:logs:<i>Region</i>:<i>account-id</i>:log-group:<i>log-group-name</i> </code> </p> <p>The ARN format of a destination is <code>arn:aws:logs:<i>Region</i>:<i>account-id</i>:destination:<i>destination-name</i> </code> </p> <p>For more information about ARN format, see <a href=\\\"https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/iam-access-control-overview-cwl.html\\\">CloudWatch Logs resources and operations</a>.</p>\"\
        },\
        \"tags\":{\
          \"shape\":\"Tags\",\
          \"documentation\":\"<p>The list of key-value pairs to associate with the resource.</p>\"\
        }\
      }\
    },\
    \"TagValue\":{\
      \"type\":\"string\",\
      \"max\":256,\
      \"pattern\":\"^([\\\\p{L}\\\\p{Z}\\\\p{N}_.:/=+\\\\-@]*)$\"\
    },\
    \"Tags\":{\
      \"type\":\"map\",\
      \"key\":{\"shape\":\"TagKey\"},\
      \"value\":{\"shape\":\"TagValue\"},\
      \"max\":50,\
      \"min\":1\
    },\
    \"TargetArn\":{\
      \"type\":\"string\",\
      \"min\":1\
    },\
    \"TestEventMessages\":{\
      \"type\":\"list\",\
      \"member\":{\"shape\":\"EventMessage\"},\
      \"max\":50,\
      \"min\":1\
    },\
    \"TestMetricFilterRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"filterPattern\",\
        \"logEventMessages\"\
      ],\
      \"members\":{\
        \"filterPattern\":{\"shape\":\"FilterPattern\"},\
        \"logEventMessages\":{\
          \"shape\":\"TestEventMessages\",\
          \"documentation\":\"<p>The log event messages to test.</p>\"\
        }\
      }\
    },\
    \"TestMetricFilterResponse\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"matches\":{\
          \"shape\":\"MetricFilterMatches\",\
          \"documentation\":\"<p>The matched events.</p>\"\
        }\
      }\
    },\
    \"ThrottlingException\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p>The request was throttled because of quota limits.</p>\",\
      \"exception\":true\
    },\
    \"Time\":{\
      \"type\":\"string\",\
      \"min\":1\
    },\
    \"Timestamp\":{\
      \"type\":\"long\",\
      \"min\":0\
    },\
    \"Token\":{\"type\":\"string\"},\
    \"TokenString\":{\
      \"type\":\"string\",\
      \"min\":1\
    },\
    \"TokenValue\":{\"type\":\"long\"},\
    \"TooManyTagsException\":{\
      \"type\":\"structure\",\
      \"members\":{\
        \"message\":{\"shape\":\"Message\"},\
        \"resourceName\":{\
          \"shape\":\"AmazonResourceName\",\
          \"documentation\":\"<p>The name of the resource.</p>\"\
        }\
      },\
      \"documentation\":\"<p>A resource can have no more than 50 tags.</p>\",\
      \"exception\":true\
    },\
    \"Unmask\":{\"type\":\"boolean\"},\
    \"UnrecognizedClientException\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p>The most likely cause is an Amazon Web Services access key ID or secret key that's not valid.</p>\",\
      \"exception\":true\
    },\
    \"UntagLogGroupRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"logGroupName\",\
        \"tags\"\
      ],\
      \"members\":{\
        \"logGroupName\":{\
          \"shape\":\"LogGroupName\",\
          \"documentation\":\"<p>The name of the log group.</p>\"\
        },\
        \"tags\":{\
          \"shape\":\"TagList\",\
          \"documentation\":\"<p>The tag keys. The corresponding tags are removed from the log group.</p>\"\
        }\
      },\
      \"deprecated\":true,\
      \"deprecatedMessage\":\"Please use the generic tagging API model UntagResourceRequest\"\
    },\
    \"UntagResourceRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"resourceArn\",\
        \"tagKeys\"\
      ],\
      \"members\":{\
        \"resourceArn\":{\
          \"shape\":\"AmazonResourceName\",\
          \"documentation\":\"<p>The ARN of the CloudWatch Logs resource that you're removing tags from.</p> <p>The ARN format of a log group is <code>arn:aws:logs:<i>Region</i>:<i>account-id</i>:log-group:<i>log-group-name</i> </code> </p> <p>The ARN format of a destination is <code>arn:aws:logs:<i>Region</i>:<i>account-id</i>:destination:<i>destination-name</i> </code> </p> <p>For more information about ARN format, see <a href=\\\"https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/iam-access-control-overview-cwl.html\\\">CloudWatch Logs resources and operations</a>.</p>\"\
        },\
        \"tagKeys\":{\
          \"shape\":\"TagKeyList\",\
          \"documentation\":\"<p>The list of tag keys to remove from the resource.</p>\"\
        }\
      }\
    },\
    \"UpdateAnomalyRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\"anomalyDetectorArn\"],\
      \"members\":{\
        \"anomalyId\":{\
          \"shape\":\"AnomalyId\",\
          \"documentation\":\"<p>If you are suppressing or unsuppressing an anomaly, specify its unique ID here. You can find anomaly IDs by using the <a href=\\\"https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_ListAnomalies.html\\\">ListAnomalies</a> operation.</p>\"\
        },\
        \"patternId\":{\
          \"shape\":\"PatternId\",\
          \"documentation\":\"<p>If you are suppressing or unsuppressing an pattern, specify its unique ID here. You can find pattern IDs by using the <a href=\\\"https://docs.aws.amazon.com/AmazonCloudWatchLogs/latest/APIReference/API_ListAnomalies.html\\\">ListAnomalies</a> operation.</p>\"\
        },\
        \"anomalyDetectorArn\":{\
          \"shape\":\"AnomalyDetectorArn\",\
          \"documentation\":\"<p>The ARN of the anomaly detector that this operation is to act on.</p>\"\
        },\
        \"suppressionType\":{\
          \"shape\":\"SuppressionType\",\
          \"documentation\":\"<p>Use this to specify whether the suppression to be temporary or infinite. If you specify <code>LIMITED</code>, you must also specify a <code>suppressionPeriod</code>. If you specify <code>INFINITE</code>, any value for <code>suppressionPeriod</code> is ignored. </p>\"\
        },\
        \"suppressionPeriod\":{\
          \"shape\":\"SuppressionPeriod\",\
          \"documentation\":\"<p>If you are temporarily suppressing an anomaly or pattern, use this structure to specify how long the suppression is to last.</p>\"\
        }\
      }\
    },\
    \"UpdateLogAnomalyDetectorRequest\":{\
      \"type\":\"structure\",\
      \"required\":[\
        \"anomalyDetectorArn\",\
        \"enabled\"\
      ],\
      \"members\":{\
        \"anomalyDetectorArn\":{\
          \"shape\":\"AnomalyDetectorArn\",\
          \"documentation\":\"<p>The ARN of the anomaly detector that you want to update.</p>\"\
        },\
        \"evaluationFrequency\":{\
          \"shape\":\"EvaluationFrequency\",\
          \"documentation\":\"<p>Specifies how often the anomaly detector runs and look for anomalies. Set this value according to the frequency that the log group receives new logs. For example, if the log group receives new log events every 10 minutes, then setting <code>evaluationFrequency</code> to <code>FIFTEEN_MIN</code> might be appropriate.</p>\"\
        },\
        \"filterPattern\":{\"shape\":\"FilterPattern\"},\
        \"anomalyVisibilityTime\":{\
          \"shape\":\"AnomalyVisibilityTime\",\
          \"documentation\":\"<p>The number of days to use as the life cycle of anomalies. After this time, anomalies are automatically baselined and the anomaly detector model will treat new occurrences of similar event as normal. Therefore, if you do not correct the cause of an anomaly during this time, it will be considered normal going forward and will not be detected.</p>\"\
        },\
        \"enabled\":{\
          \"shape\":\"Boolean\",\
          \"documentation\":\"<p>Use this parameter to pause or restart the anomaly detector. </p>\"\
        }\
      }\
    },\
    \"ValidationException\":{\
      \"type\":\"structure\",\
      \"members\":{\
      },\
      \"documentation\":\"<p>One of the parameters for the request is not valid.</p>\",\
      \"exception\":true\
    },\
    \"Value\":{\"type\":\"string\"}\
  },\
  \"documentation\":\"<p>You can use Amazon CloudWatch Logs to monitor, store, and access your log files from EC2 instances, CloudTrail, and other sources. You can then retrieve the associated log data from CloudWatch Logs using the CloudWatch console. Alternatively, you can use CloudWatch Logs commands in the Amazon Web Services CLI, CloudWatch Logs API, or CloudWatch Logs SDK.</p> <p>You can use CloudWatch Logs to:</p> <ul> <li> <p> <b>Monitor logs from EC2 instances in real time</b>: You can use CloudWatch Logs to monitor applications and systems using log data. For example, CloudWatch Logs can track the number of errors that occur in your application logs. Then, it can send you a notification whenever the rate of errors exceeds a threshold that you specify. CloudWatch Logs uses your log data for monitoring so no code changes are required. For example, you can monitor application logs for specific literal terms (such as \\\"NullReferenceException\\\"). You can also count the number of occurrences of a literal term at a particular position in log data (such as \\\"404\\\" status codes in an Apache access log). When the term you are searching for is found, CloudWatch Logs reports the data to a CloudWatch metric that you specify.</p> </li> <li> <p> <b>Monitor CloudTrail logged events</b>: You can create alarms in CloudWatch and receive notifications of particular API activity as captured by CloudTrail. You can use the notification to perform troubleshooting.</p> </li> <li> <p> <b>Archive log data</b>: You can use CloudWatch Logs to store your log data in highly durable storage. You can change the log retention setting so that any log events earlier than this setting are automatically deleted. The CloudWatch Logs agent helps to quickly send both rotated and non-rotated log data off of a host and into the log service. You can then access the raw log data when you need it.</p> </li> </ul>\"\
}\
";
}

@end
