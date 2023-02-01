#Internet Gateway
resource "aws_internet_gateway" "terraform-vpc-igw" {
    vpc_id = "${aws_vpc.traffic-vpc.id}"

    tags ={
        Name = "terraform-vpc-igw"
    }
}