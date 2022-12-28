#nat gateway
resource "aws_nat_gateway" "nat" {
    allocation_id = "${aws_eip.iac_nat_eip.id}"
    subnet_id = "${aws_subnet.terraform-subnet-public1-ap-northeast-2.id}"
    depends_on = [aws_internet_gateway.terraform-vpc-igw]
}

#elastic Ip
resource "aws_eip" "iac_nat_eip" {
    vpc = true

    lifecycle {
        create_before_destroy = true #못지우게 설정
    }
}