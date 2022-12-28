#subnet

#Public
resource "aws_subnet" "terraform-subnet-public1-ap-northeast-2" {
    vpc_id                  = "${aws_vpc.traffic-vpc.id}"
    cidr_block              = "10.0.0.0/24"
    availability_zone       = "ap-northeast-2a"
    map_public_ip_on_launch = false
    tags ={
        Name = "terraform-subnet-public1-ap-northeast-2"
    }
}
#Public
resource "aws_subnet" "terraform-subnet-public2-ap-northeast-2" {
    vpc_id                  = "${aws_vpc.traffic-vpc.id}"
    cidr_block              = "10.0.1.0/24"
    availability_zone       = "ap-northeast-2c"
    map_public_ip_on_launch = false
    tags ={
        Name = "terraform-subnet-public2-ap-northeast-2"
    }
}

#for App Server
resource "aws_subnet" "terraform-subnet-private1-ap-northeast-2" {
    vpc_id                  = "${aws_vpc.traffic-vpc.id}"
    cidr_block              = "10.0.16.0/20"
    availability_zone       = "ap-northeast-2a"
    map_public_ip_on_launch = false
    tags ={
        Name = "terraform-subnet-private1-ap-northeast-2"
    }
}

#for Database
resource "aws_subnet" "terraform-subnet-private2-ap-northeast-2" {
    vpc_id                  = "${aws_vpc.traffic-vpc.id}"
    cidr_block              = "10.0.32.0/20"
    availability_zone       = "ap-northeast-2a"
    map_public_ip_on_launch = false
    tags ={
        Name = "terraform-subnet-private2-ap-northeast-2"
    }
}
#for App Server
resource "aws_subnet" "terraform-subnet-private3-ap-northeast-2" {
    vpc_id                  = "${aws_vpc.traffic-vpc.id}"
    cidr_block              = "10.0.64.0/20"
    availability_zone       = "ap-northeast-2c"
    map_public_ip_on_launch = false

    tags ={
        Name = "terraform-subnet-private3-ap-northeast-2"
    }
}

#for Database
resource "aws_subnet" "terraform-subnet-private4-ap-northeast-2" {
    vpc_id                  = "${aws_vpc.traffic-vpc.id}"
    cidr_block              = "10.0.128.0/20"
    availability_zone       = "ap-northeast-2c"
    map_public_ip_on_launch = false

    tags ={
        Name = "terraform-subnet-private4-ap-northeast-2"
    }
}