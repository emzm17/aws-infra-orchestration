resource "aws_eip" "eip_nat" {
    tags = {
      name = "eip-nat-a"
    }
}



## create nat gateway in public subnet pub_sub_1a
resource "aws_nat_gateway" "nat_gateway" {
   allocation_id = aws_eip.eip_nat.id
   subnet_id = var.pub_sub_1a_id

   tags = {
     name = "nat-gateway"
   }
   depends_on = [ var.igw_id ]
}

### create private route table pri-route-table and add route to through NAT gateway
resource "aws_route_table" "pri_rt1" {
     vpc_id = var.vpc_id

     route {
        cidr_block = "0.0.0.0/0"
        nat_gateway_id = aws_nat_gateway.nat_gateway.id
     }

     tags = {
        name = "private-rt"
     }
}



resource "aws_route_table_association" "pri-sub-3a-with-Pri-route-table" {
  subnet_id      = var.pri_sub_3a_id
  route_table_id = aws_route_table.pri_rt1.id
}

resource "aws_route_table_association" "pri-sub-4b-with-Pri-route-table" {
  subnet_id      = var.pri_sub_4b_id
  route_table_id = aws_route_table.pri_rt1.id
}



