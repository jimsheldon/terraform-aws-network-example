terraform {
  required_providers {
    # Because we're currently using a built-in provider as
    # a substitute for dedicated Terraform language syntax
    # for now, test suite modules must always declare a
    # dependency on this provider. This provider is only
    # available when running tests, so you shouldn't use it
    # in non-test modules.
    test = {
      source = "terraform.io/builtin/test"
    }
  }
}

module "main" {
  # source is always ../.. for test suite configurations,
  # because they are placed two subdirectories deep under
  # the main module directory.
  source = "../.."

  aws_region          = "us-east-2"
  main_vpc_cidr       = "10.10.0.0/16"
  private_subnet_cidr = "10.10.1.0/24"
  public_subnet_cidr  = "10.10.2.0/24"
  tag_name            = "demo"
}

data "aws_eip" "nat" {
  id = module.main.nat_id
}

# The special test_assertions resource type, which belongs
# to the test provider we required above, is a temporary
# syntax for writing out explicit test assertions.
resource "test_assertions" "vpc" {
  # "component" serves as a unique identifier for this
  # particular set of assertions in the test results.
  component = "vpc"

  check "vpc_id_prefix" {
    description = "check vpc ID prefix"
    condition   = can(regex("^vpc-", module.main.main_vpc_id))
  }

  equal "nat_name_tag" {
    description = "check the nat name tag"
    got         = data.aws_eip.nat.tags["Name"]
    want        = "demo"
  }
}
