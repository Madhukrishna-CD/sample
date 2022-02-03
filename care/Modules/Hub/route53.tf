resource "aws_route53_zone" "hostedzone" {
  name = var.hostedzone_website_name

  tags = {
    env = "${var.hostzone_name}"
  }
}
resource "aws_route53_record" "record" {
  zone_id = aws_route53_zone.hostedzone.zone_id
  name    = var.record_website_name
  type    = "A"
  ttl     = "300"
  records = [aws_eip.eip.public_ip]
}