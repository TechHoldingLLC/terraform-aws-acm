# ACM
Below is an examples of calling this module.

## With route53 zone and dns validation with multiple alternative domains
```
module "acm" {
  source          = "./acm"
  domain_name     = "*.example.com"
  route53_zone_id = "route53_zone_id"
}
```

## Without route53 zone and manually dns validation
```
module "acm" {
  source      = "./acm"
  domain_name = "example.com"
}
```

## Without route53 zone and manually dns validation with multiple alternative domains
```
module "acm" {
  source                    = "./acm"
  domain_name               = "example.com"
  subject_alternative_names = ["www.example.com", "web.example.com"]
}
```