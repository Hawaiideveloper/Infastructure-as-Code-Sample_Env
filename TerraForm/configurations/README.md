### Use the file called:

###### 
[launch_script.sh](https://github.com/Hawaiideveloper/Sample_Env/blob/main/TerraForm/configurations/launch_script.sh) if you want to quickly spin up an environment


#### [VPC module in Terraform](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc):

#### VPCs can be imported using the vpc id, e.g.

```
$ terraform import aws_vpc.test_vpc vpc-a01106c2
```
