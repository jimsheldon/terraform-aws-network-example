# Terraform AWS Network Example

Based on [terraform-aws-network-example](https://github.com/gruntwork-io/terratest/tree/master/examples/terraform-aws-network-example)

## Run Tests

```bash
# start localstack container
docker run --rm -it -p 4566:4566 -p 4510-4559:4510-4559 localstack/localstack:0.14.3

# run tests
cd test
go test -v -run TestTerraformAwsNetworkExample
```
