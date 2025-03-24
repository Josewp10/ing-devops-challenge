output "sg_id" {
    value = {for key, val in aws_security_group.sg : key => val.id }  
}