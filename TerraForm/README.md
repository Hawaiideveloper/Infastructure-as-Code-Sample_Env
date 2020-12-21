# Terraform Getting started with EC2 and VPC


### Install TerraForm for MacOS

###### First, install the HashiCorp tap, a repository of all our Homebrew packages.
```
brew tap hashicorp/tap
```

###### Now, install Terraform

```
brew install hashicorp/tap/terraform
```

### Install TerraForm for Linux Ubuntu

###### Add the HashiCorp GPG key.
```
curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add -
```

###### Add the official HashiCorp Linux repository.
```
sudo apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main"
```

###### Update and install
```
Update and install.
```

###### Verify it works
```
terraform -help
```

