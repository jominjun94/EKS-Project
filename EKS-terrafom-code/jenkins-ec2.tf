resource "aws_instance" "my-jenkins-master" {
  ami                         = "ami-0454bb2fefc7de534"
  associate_public_ip_address = "true"
  availability_zone           = "ap-northeast-2a"
  key_name                    = "key-aws"
  subnet_id                   = aws_subnet.my-public-subnet-a.id
  vpc_security_group_ids      = [aws_security_group.jenkins-sg.id]
  instance_type               = "t2.micro"
  tags = {
    Name = "jenkins-master"
  }
}


resource "aws_instance" "my-jenkins-node" {
  ami                         = "ami-0454bb2fefc7de534"
  associate_public_ip_address = "true"
  availability_zone           = "ap-northeast-2a"
  key_name                    = "key-aws"
  subnet_id                   = aws_subnet.my-public-subnet-a.id
  vpc_security_group_ids      = [aws_security_group.jenkins-sg.id]
  instance_type               = "t2.micro"
  tags = {
    Name = "jenkins-node"
  }
}
