#public
resource "aws_route_table_association" "terraform-rta-public1" {
    route_table_id = aws_route_table.terraform-rtb-public.id
    subnet_id = aws_subnet.terraform-subnet-public1-ap-northeast-2.id

}

resource "aws_route_table_association" "terraform-rta-public2" {
    route_table_id = aws_route_table.terraform-rtb-public.id
    subnet_id = aws_subnet.terraform-subnet-public2-ap-northeast-2.id

}

#for App Server
resource "aws_route_table_association" "terraform-rta-private1" {
    route_table_id = aws_route_table.terraform-rtb-private1.id
    subnet_id = aws_subnet.terraform-subnet-private1-ap-northeast-2.id
}

resource "aws_route_table_association" "terraform-rta-private2" {
    route_table_id = aws_route_table.terraform-rtb-private1.id
    subnet_id = aws_subnet.terraform-subnet-private3-ap-northeast-2.id
}


#for DB
resource "aws_route_table_association" "terraform-rta-private3" {
    route_table_id = aws_route_table.terraform-rtb-private2-forDB.id
    subnet_id = aws_subnet.terraform-subnet-private2-ap-northeast-2.id
}

resource "aws_route_table_association" "terraform-rta-private4" {
    route_table_id = aws_route_table.terraform-rtb-private2-forDB.id
    subnet_id = aws_subnet.terraform-subnet-private4-ap-northeast-2.id
}