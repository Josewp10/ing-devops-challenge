output "lb_map_out" {
    value = {for key, val in aws_lb.aws_elb : key => val }  
}