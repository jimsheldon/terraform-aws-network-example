package test

import (
	"os"
	"testing"

	"github.com/gruntwork-io/go-commons/files"
	"github.com/gruntwork-io/terratest/modules/terraform"
	"github.com/stretchr/testify/assert"
)

// An example of how to test the Terraform module in examples/terraform-aws-network-example using Terratest.
func TestTerraformAwsNetworkExample(t *testing.T) {
	t.Parallel()

	// Installl the provider.tf with defered deletion
	defer os.Remove("../test-provider.tf")
	files.CopyFile("aws-provider-localstack.tf", "../test-provider.tf")

	// Construct the terraform options with default retryable errors to handle the most common retryable errors in
	// terraform testing.
	terraformOptions := terraform.WithDefaultRetryableErrors(t, &terraform.Options{
		// The path to where our Terraform code is located
		TerraformDir: "../.",

		// Variables to pass to our Terraform code using -var options
		Vars: map[string]interface{}{
			"main_vpc_cidr":       "10.10.0.0/16",
			"private_subnet_cidr": "10.10.1.0/24",
			"public_subnet_cidr":  "10.10.2.0/24",
			"aws_region":          "us-east-2",
		},
	})

	// At the end of the test, run `terraform destroy` to clean up any resources that were created
	defer terraform.Destroy(t, terraformOptions)

	// This will run `terraform init` and `terraform apply` and fail the test if there are any errors
	terraform.InitAndApply(t, terraformOptions)

	// Run `terraform output` to get the value of an output variable
	//	publicSubnetId := terraform.Output(t, terraformOptions, "public_subnet_id")
	//	privateSubnetId := terraform.Output(t, terraformOptions, "private_subnet_id")
	vpcId := terraform.Output(t, terraformOptions, "main_vpc_id")

	assert.NotNil(t, vpcId)
	assert.Contains(t, vpcId, "vpc-")
	//subnets := aws.GetSubnetsForVpc(t, vpcId, awsRegion)

	//require.Equal(t, 2, len(subnets))
	// Verify if the network that is supposed to be public is really public
	//assert.True(t, aws.IsPublicSubnet(t, publicSubnetId, awsRegion))
	// Verify if the network that is supposed to be private is really private
	//assert.False(t, aws.IsPublicSubnet(t, privateSubnetId, awsRegion))
}
