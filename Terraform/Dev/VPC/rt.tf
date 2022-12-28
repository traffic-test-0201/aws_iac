# Connetction with igw
resource "aws_route_table" "terraform-rtb-public" {
    vpc_id     = "${aws_vpc.traffic-vpc.id}"
    depends_on=[aws_subnet.terraform-subnet-public1-ap-northeast-2, aws_subnet.terraform-subnet-public2-ap-northeast-2]
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.terraform-vpc-igw.id
    }

    tags ={
        Name = "terraform-rtb-public"
    }
}

# Connection with nat
resource "aws_route_table" "terraform-rtb-private1" {
    vpc_id     = "${aws_vpc.traffic-vpc.id}"
    depends_on=[aws_subnet.terraform-subnet-private1-ap-northeast-2, aws_subnet.terraform-subnet-private3-ap-northeast-2]
    route {
        cidr_block = "0.0.0.0/0"
        nat_gateway_id = aws_nat_gateway.nat.id
    }
    tags ={
        Name = "terraform-rtb-private1"
    }
}



resource "aws_route_table" "terraform-rtb-private2-forDB" {
    vpc_id     = "${aws_vpc.traffic-vpc.id}"
    depends_on=[aws_subnet.terraform-subnet-private2-ap-northeast-2, aws_subnet.terraform-subnet-private4-ap-northeast-2]

    route {
        cidr_block = "0.0.0.0/0"
        nat_gateway_id = aws_nat_gateway.nat.id
    }

    tags ={
        Name = "terraform-rtb-private2-forDB"
    }
}
