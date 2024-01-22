# ACM
Below is an examples of calling this module.

## With route53 zone and dns validation with single domain
```
module "acm" {
  source = "./acm"
  
  domain_config = [
    {
      hosted_zone_id = "route53_hosted_zone_id",
      domain_name    = ["app.example.com"]
    }
  ]

}
```

## With route53 zone and dns validation with multiple domains
```
module "acm" {
  source = "./acm"
  
  domain_config = [
    {
      hosted_zone_id = "route53_hosted_zone_id",
      domain_name    = ["app.example.com", "api.example.com"]
    }
  ]

}
```

## With multiple route53 zone and dns validation with multiple domains
```
module "acm" {
  source = "./acm"

  domain_config = [
    {
      hosted_zone_id = "route53_hosted_zone_id(example.com)",
      domain_name    = ["app.example.com"]
    },
    {
      hosted_zone_id = "route53_hosted_zone_id(sample.com)",
      domain_name    = ["app.sample.com"]
    }
  ]
  
}
```

## Without route53 zone and manually dns validation with single domains
```
module "acm" {
  source = "./acm"
  domains = ["app.example.com"]
}
```

## Without route53 zone and manually dns validation with multiple domains
```
module "acm" {
  source = "./acm"
  domains = ["app.example.com", "api.example.com"]
}
```