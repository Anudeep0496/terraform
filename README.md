# terraform
<h2>terraform</h2>
<h3>Commmands</h3><br>
Init: terraform init<br>
Plan: terraform plan<br>
Apply: terraform apply or terraform apply -auto-approve<br>
Destroy: terraform destroy -auto-approve or terraform destroy<br>
Validate: terraform validate<br>
console: terraform console<br>
 eg: min(11,23,45)<br>
     max(1236,23742,327)<br>
===================================
<h3>(Terraform Variables DataTypes Condtions Loops Functions)</h3><br>
===================================
<h2>Variables</h2><br>
=================
<h3>Preference of Variable</h3><br>
1. Command line passing<br>
    eg: terraform plan -var "instance_type=t3.large<br>

2. terraform.tfvars<br>
    instance_type=t3.small<br>

3. Environment Variables<br>
    TF_VAR_<var-name><br>
    eg: export TF_VAR_instance_type="t3.xlarge"<br>
        unset TF_VAR_instance_type

4. default values which we pass in variables.tf<br>

5. User prompt, if we comment instance_type in variable.tf then it will ask for value in session to prompt<br>

<h3> Data Types </h3><br>
number<br>
list(string)<br>
string<br>
bool<br>
map<br>
====================================
<h3> Conditions </h3><br>
expression ? "true" : "false" <br>
eg: var.environment == "prod" ? "t3.micro" : "t3.small"<br>

<h2> Loops </h2><br>
<h3>1. Count Based loops</h3><br>

resource "aws_instance" "expense" {<br>
    count = 3<br>
    ami         = data.aws_ami.al2023.id<br>
    vpc_security_group_ids = [aws_security_group.allow_tls.id]<br>
    instance_type = var.environment == "prod" ? "t3.micro" : "t3.small"<br>
    key_name = var.key_name<br>
    tags = {<br>
      <h4>Name = var.instances[count.index]</h4><br>
    }<br>
}<br>

<h4>variable "instances" {<br>
    default = ["mysql", "backend", "frontend"]<br>
}<br></h4>

======================================================
<h3>Functions</h3><br>

Upper Lower<br>
name = lower("MyApp")   # "myapp"<br>
name = upper("myapp")   # "MYAPP"<br>

Replace<br>
name = replace("dev-app", "-", "_")   # dev_app<br>

Format<br>
name = format("%s-%s", var.env, "backend")   # dev-backend<br>

Max value<br>
max_val = max(2, 5, 10)   # 10<br>

Count<br>
count = length(var.instances)<br>

element<br>
element(["a", "b", "c"], 1)   # "b"<br>

lookup()<br>
instance_type = lookup(var.instance_map, var.env, "t2.micro")<br>
variable "instance_map" {<br>
  default = {<br>
    dev  = "t2.micro"<br>
    prod = "t3.micro"<br>
  }<br>
}<br>

contains()<br>
contains(["dev", "test"], "dev")   # true<br>

Merge<br>
merge(<br>
  {Name="app"},<br>
  {Env="dev"}<br>
)<br>

condition<br>
instance_type = var.env == "prod" ? "t3.micro" : "t2.micro"<br>