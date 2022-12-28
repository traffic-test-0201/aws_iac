resource "aws_internet_gateway" "terraform-vpc-igw" {
    vpc_id = "${aws_vpc.terraform-vpc-vpc.id}"

    tags ={
        Name = "terraform-vpc-igw"
    }
}