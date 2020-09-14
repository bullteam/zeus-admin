package dataperm
// todo :
// make a data perm rule system!
// sample:
// #1|casbin_rule.v1 == @current.user.id , casbin_rule.v2 == role.name : select(domain_id)
// condition : sql=select [@columns] from [@table] where id in(#1.domain_id)