resource "aws_key_pair" "keypair" {
  key_name   = "${var.app_name}-keypair"
  public_key = file("./modules/ec2/src/keypair.pub")

  tags = {
    Name = "${var.app_name}-keypair"
  }
}

resource "aws_instance" "app_server" {
  ami                         = data.aws_ami.app.id
  instance_type               = "t2.micro"
  subnet_id                   = var.subnet_public_subnet_1a_id
  associate_public_ip_address = true
  # iam_instance_profile        = aws_iam_instance_profile.app_ec2_profile.name
  vpc_security_group_ids = [
    var.sg_opmng_id
  ]
  key_name = aws_key_pair.keypair.key_name
  # user_data                   = file("./src/initialize.sh")

  tags = {
    Name = "${var.app_name}-opmng-ec2"
  }
}
