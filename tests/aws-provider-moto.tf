provider "aws" {
  access_key = "test"
  secret_key = "test"
  region     = "us-east-2"

  s3_use_path_style           = false
  skip_credentials_validation = true
  skip_metadata_api_check     = true
  skip_requesting_account_id  = true

  endpoints {
    apigateway     = "http://moto:4566"
    apigatewayv2   = "http://moto:4566"
    cloudformation = "http://moto:4566"
    cloudwatch     = "http://moto:4566"
    dynamodb       = "http://moto:4566"
    ec2            = "http://moto:4566"
    es             = "http://moto:4566"
    elasticache    = "http://moto:4566"
    firehose       = "http://moto:4566"
    iam            = "http://moto:4566"
    kinesis        = "http://moto:4566"
    lambda         = "http://moto:4566"
    rds            = "http://moto:4566"
    redshift       = "http://moto:4566"
    route53        = "http://moto:4566"
    s3             = "http://moto:4566"
    secretsmanager = "http://moto:4566"
    ses            = "http://moto:4566"
    sns            = "http://moto:4566"
    sqs            = "http://moto:4566"
    ssm            = "http://moto:4566"
    stepfunctions  = "http://moto:4566"
    sts            = "http://moto:4566"
  }
}
