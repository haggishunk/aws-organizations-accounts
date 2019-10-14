variable organization_id {}
variable accounts {
  type = map(
    object({
      business_unit       = string
      product             = string
      environment         = string
      email               = string
      billing_access      = string
      cidr_block_reserved = string
      tags                = map(string)
    })
  )
}
