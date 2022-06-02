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

  # This test suite is aiming to test the "defaults" for
  # this module, so it doesn't set any input variables
  # and just lets their default values be selected instead.

  main_vpc_cidr       = "10.10.0.0/16"
  private_subnet_cidr = "10.10.1.0/24"
  public_subnet_cidr  = "10.10.2.0/24"
  aws_region          = "us-east-2"
}

locals {
  vpc_id_parts = regex("^vpc-", module.main.main_vpc_id)
}

# The special test_assertions resource type, which belongs
# to the test provider we required above, is a temporary
# syntax for writing out explicit test assertions.
resource "test_assertions" "api_url" {
  # "component" serves as a unique identifier for this
  # particular set of assertions in the test results.
  component = "vpc_id"

  # equal and check blocks serve as the test assertions.
  # the labels on these blocks are unique identifiers for
  # the assertions, to allow more easily tracking changes
  # in success between runs.

  equal "scheme" {
    description = "vpc id"
    got         = local.vpc_id_parts
    want        = "vpc-"
  }

#  check "port_number" {
#    description = "default port number is 8080"
#    condition   = can(regex(":8080$", module.main.main_vpc_id))
#  }
}
