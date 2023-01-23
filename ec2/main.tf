/*
 * # AWS EC2 Terraform Module 💡
 * Description
 * ============
 * This tf file provides EC2 resources definition for TF Modules <br>
 * ***Author***: Alfred Valderrama (@redopsbay) <br>
*/
resource "aws_instance" "ec2" {
  ami                         = var.ami
  subnet_id                   = var.subnet_id
  tags                        = var.tags
  instance_type               = var.instance_type
  key_name                    = var.key_name
  disable_api_termination     = var.disable_api_termination
  associate_public_ip_address = var.associate_public_ip_address == false ? null : true
  iam_instance_profile        = var.instance_profile == "" ? null : var.instance_profile
  monitoring                  = var.monitoring_enabled
  user_data                   = var.user_data == "" ? null : var.user_data
  vpc_security_group_ids      = var.security_group_ids

  root_block_device {
    volume_type           = var.volume_type
    volume_size           = var.volume_size
    delete_on_termination = var.delete_block_device_on_termination
    iops                  = var.volume_type == "io1" || var.volume_type == "io2" || var.volume_type == "gp3" ? var.volume_iops : null
  }

}
