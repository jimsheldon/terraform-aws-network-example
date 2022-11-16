# Terraform AWS Network Example

Based on [terraform-aws-network-example](https://github.com/gruntwork-io/terratest/tree/master/examples/terraform-aws-network-example).

This example [Terraform](https://www.terraform.io/) module creates a basic AWS network.

[Terratest](https://terratest.gruntwork.io/) and [Terraform CLI](https://www.terraform.io/language/modules/testing-experiment) tests check for:
- VPC ID prefix starts with `vpc-`
- NAT EIP `Name` tag matches `tag_name`

Tests are run under continuous integration using [Localstack](https://localstack.cloud/) and [Drone CI](https://www.drone.io) or [Harness CI](https://app.harness.io/auth/#/signup/?module=ci).

## Run Tests Locally

### Start Localstack docker container

```bash
docker run --rm -it -p 4566:4566 -p 4510-4559:4510-4559 localstack/localstack:1.2.0
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
