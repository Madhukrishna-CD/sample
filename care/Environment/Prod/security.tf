# Create a guard duty
resource "aws_guardduty_detector" "hub_gaurdduty" {
  enable = true

#  datasources {
#  s3_logs {
#   enable = true
#     }
#   }
}

# create a aws_shield
data "aws_availability_zones" "available" {}
data "aws_region" "current" {}
data "aws_caller_identity" "current" {}
resource "aws_eip" "hub_shield" {
  vpc = true
}

resource "aws_shield_protection" "hub_shield" {
  name         = "csg-hub-shield"
  resource_arn = ":aws:ec2arn:${data.aws_region.current.name}:${data.aws_caller_identity.current.account_id}:eip-allocation/${aws_eip.csg-hub-shield.id}"

}

# Create a WAF
resource "aws_waf_ipset" "ipset" {
  name = "tfIPSet"

  ip_set_descriptors {
    type  = "IPV4"
    value = "*******"
  }
}

resource "aws_waf_rule" "wafrule" {
  depends_on  = [aws_waf_ipset.ipset]
  name        = "tfWAFRule"
  metric_name = "tfWAFRule"

  predicates {
    data_id = aws_waf_ipset.ipset.id
    negated = false
    type    = "IPMatch"
  }
}