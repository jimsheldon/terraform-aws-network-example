provider "aws" {
  access_key = "test"
  secret_key = "test"
  region     = "us-east-2"

  s3_use_path_style           = false
  skip_credentials_validation = true
  skip_metadata_api_check     = true
  skip_requesting_account_id  = true

  endpoints {
    apigateway     = "http://moto:5000"
    apigatewayv2   = "http://moto:5000"
    cloudformation = "http://moto:5000"
    cloudwatch     = "http://moto:5000"
    dynamodb       = "http://moto:5000"
    ec2            = "http://moto:5000"
    es             = "http://moto:5000"
    elasticache    = "http://moto:5000"
    firehose       = "http://moto:5000"
    iam            = "http://moto:5000"
    kinesis        = "http://moto:5000"
    lambda         = "http://moto:5000"
    rds            = "http://moto:5000"
    redshift       = "http://moto:5000"
    route53        = "http://moto:5000"
    s3             = "http://moto:5000"
    secretsmanager = "http://moto:5000"
    ses            = "http://moto:5000"
    sns            = "http://moto:5000"
    sqs            = "http://moto:5000"
    ssm            = "http://moto:5000"
    stepfunctions  = "http://moto:5000"
    sts            = "http://moto:5000"
  }
}
