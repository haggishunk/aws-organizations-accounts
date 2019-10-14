resource "aws_organizations_account" "these" {
  for_each                   = var.accounts
  name                       = "${each.value.business_unit}_${each.value.product}_${each.value.environment}"
  email                      = each.value.email
  iam_user_access_to_billing = each.value.billing_access
  parent_id                  = var.organization_id
  tags = merge(
    each.value.tags,
    {
      business_unit = each.value.business_unit
      product       = each.value.product
      environment   = each.value.environment
  })
  #  not using `role_name` to create admin role in new account
  #  as this is not directly readable via the api and drift
  #  cannot be detected
  #  preferring explicit management of roles and principals
  #  in accounts
}
