# Terraform, Selfhosted Package Index

Supporting repo for Terraform tutorial on advantch.com -Part 1

## Installation

Visit the [terraform website](https://learn.hashicorp.com/terraform?utm_source=terraform_io) to install terraform.

## Usage

```shell
# initialize
terraform init 

# create resources
terraform apply -var-file='.tfvars'

# destroy resources
terraform destroy -var-file='.tfvars'
```

## Interacting with remote host
```shell
$ docker context create pypiserver --docker "host=ssh://root@your_ip"
$ docker context use pypiserver
$ docker-compose ‐‐context pypiserver up -d
```


## Contributing
Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.


## License
[MIT](https://choosealicense.com/licenses/mit/)