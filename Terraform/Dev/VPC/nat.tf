resource "aws_nat_gateway" "nat" {
    allocation_id = "${aws_eip.iac_nat_eip.id}"
    subnet_id = "${aws_subnet.subnet-terraform-vpc-subnet-public1-us-west-1c.id}"
    depends_on = [aws_internet_gateway.terraform-vpc-igw]
}

resource "aws_eip" "iac_nat_eip" {
    vpc = true

    lifecycle {
        create_before_destroy = true
    }
}