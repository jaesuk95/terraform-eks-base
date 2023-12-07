# 1.0 이상의 버전 사용 
terraform {
  required_version = ">= 1.0"
}

# Provider 는 AWS , 그리고 region 을 명시한다 
provider "aws" {
  region     = "ap-northeast-2"
}

data "aws_availability_zones" "available" {
  exclude_names = ["ap-northeast-2a"]
}