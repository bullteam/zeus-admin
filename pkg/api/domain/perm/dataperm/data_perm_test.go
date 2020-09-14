package dataperm

var statement = `
{
  "p": [
    "casbin_rule:casbin_rule.v0=@account.id",
    "role:@casbin_rule.v1=role.role_name"
  ],
  "c": "id=(join[@role.domain_id,','])",
  "r": "domain"
}
`
