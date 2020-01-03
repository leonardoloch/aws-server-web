resource "aws_instance" "web" {
  ami           = "ami-00068cd7555f543d5"
  count         = var.instance_count
  instance_type = "t2.micro"
  user_data = templatefile("${path.module}/entrypoint.tpl",{})
  associate_public_ip_address = true

  security_groups = [aws_security_group.security.id]
  subnet_id = "${element(var.subnet_id, count.index)}"

  tags = {
    Name = "${var.service}-${count.index + 1}"
  }
  depends_on = [aws_security_group.security]
}

resource "aws_security_group" "security" {
  name = "${var.service}-security"
  vpc_id = var.vpc_id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}