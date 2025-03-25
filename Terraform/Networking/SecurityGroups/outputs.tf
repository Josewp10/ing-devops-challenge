output "sg_map_out" {
    value = {for key, val in aws_security_group.sg : key => val }  
}