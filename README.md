# Terraform AWS Network Example

Based on [terraform-aws-network-example](https://github.com/gruntwork-io/terratest/tree/master/examples/terraform-aws-network-example).

This example [Terraform](https://www.terraform.io/) module creates a basic AWS network.

[Terratest](https://terratest.gruntwork.io/) and [Terraform CLI](https://www.terraform.io/language/modules/testing-experiment) tests check for:
- VPC ID prefix starts with `vpc-`
- NAT EIP `Name` tag matches `tag_name`

Tests are run under continuous integration using [Drone CI](https://www.drone.io) and [Localstack](https://localstack.cloud/).

## Run Tests Locally

### Start Localstack docker container

```bash
docker run --rm -it -p 4566:4566 -p 4510-4559:4510-4559 localstack/localstack:0.14.3
```

### Run Terratest tests

```bash
cd test
go test -v -run TestTerraformAwsNetworkExample
```

### Run Terraform CLI tests

```bash
cp tests/aws-provider-localstack.tf tests/example/test-provider.tf
terraform test
```
