resource "aws_security_group" "vprofile-bean-elb-sg" {
  name        = "vprofile-bean-elb-sg"
  description = "security group for beanstalk elb"
  vpc_id      = module.vpc.vpc_id
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "vprofile-bastion-sg" {
  name        = "vprofile-bastion-sg"
  description = "security grp for bastion host"
  vpc_id      = module.vpc.vpc_id
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.MYIP]
  }
}

resource "aws_security_group" "vprofile-prod-sg" {
  name        = "vprofile-prod-sg"
  description = "security group for beanstallk ec2 instnace"
  vpc_id      = module.vpc.vpc_id
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [aws_security_group.vprofile-bastion-sg.id]
  }
}

resource "aws_security_group" "vprofile-backend-sg" {
  name        = "vprofile-backend-sg"
  description = "security groups for backend service like RDS,Active MQ and Elasticache"
  vpc_id      = module.vpc.vpc_id
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = [aws_security_group.vprofile-prod-sg.id]
  }

}

resource "aws_security_group_rule" "security-group-allow-itself" {
  type                     = "ingress"
  from_port                = 0
  to_port                  = 65535
  protocol                 = "-1"
  security_group_id        = aws_security_group.vprofile-backend-sg.id
  source_security_group_id = aws_security_group.vprofile-backend-sg.id
}
