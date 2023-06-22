ami           = "ami-0888c952dcdf12eec"
instance_type = "t2.large"
tags = {
  Name        = "practica1"
  Environment = "dev"
}
sg_name = "platzi_rules"
ingress_rules = [
  {
    from_port   = "22"
    to_port     = "22"
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  },
  {
    from_port   = "80"
    to_port     = "80"
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
]
egress_rules = [
  {
    # Todos los puertos, cualquier protocolo
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
]