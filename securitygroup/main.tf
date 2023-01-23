/*
 * # AWS Security Group Terraform Module 💡
 * Description
 * ============
 * This tf file provides Security Group resources definition for TF Modules <br>
 * ***Author***: Alfred Valderrama (@redopsbay) <br>
*/


resource "aws_security_group" "sg" {
  name        = var.name
  description = var.description
  vpc_id      = var.vpc_id

  dynamic "ingress" {
    for_each = length(toset(var.inbound_ports)) == 0 ? toset([0]) : toset(var.inbound_ports)
    content {
      description     = var.description
      from_port       = ingress.value
      to_port         = ingress.value
      protocol        = ingress.value == 0 || var.inbound_protocol == -1 ? -1 : var.inbound_protocol
      cidr_blocks     = var.inbound_cidr_blocks
      security_groups = length(var.inbound_security_groups) == 0 || var.inbound_security_groups == null ? null : var.inbound_security_groups
    }
  }

  dynamic "egress" {
    for_each = length(toset(var.outbound_ports)) == 0 || var.outbound_ports == null ? toset([0]) : toset(var.outbound_ports)
    content {
      from_port   = egress.value
      to_port     = egress.value
      protocol    = egress.value == 0 || var.outbound_protocol == -1 ? -1 : var.outbound_protocol
      cidr_blocks = var.outbound_cidr_blocks
    }
  }

  tags = var.tags
}
