# modules/zscaler/main.tf
# Demo placeholder for Zscaler ZIA firewall rule

resource "null_resource" "allow_http_rule" {
  triggers = {
    rule_name = var.rule_name
  }
}