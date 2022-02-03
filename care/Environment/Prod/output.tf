
output "cloudfront" {
    value = aws_cloudfront_distribution.Alb_distribution
    description = "output for CDN "  
}

output "iam_group" {
    value = aws_iam_group.devops_support
    description = "output for iam group"  
}

output "iam_group_policy" {
    value = aws_iam_group_policy.devops_support_policy
    description = "output for iam group policy"  
}

output "iam_user" {
    value = aws_iam_user.cd_devops
    description = "output for iam user"  
}

output "secret" {
  value = aws_iam_access_key.key.encrypted_secret
  description = "output for iam access key"
}

output "guardduty" {
    value = aws_guardduty_detector.hub_gaurdduty
    description = "output for guard duty"  
}

output "shield" {
    value = aws_shield_protection.hub_shield
    description = "output for shield"  
}

output "waf_rule" {
    value = aws_waf_rule.wafrule
    description = "output for waf rule"  
}

