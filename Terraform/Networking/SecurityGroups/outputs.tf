output "sg_map" {
    value = {for key, val in aws_security_group.sg : key => val }  
}