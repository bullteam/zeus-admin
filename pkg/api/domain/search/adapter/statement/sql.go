package statement

import (
	"zeus/pkg/api/domain/search/lexer/token"
	"zeus/pkg/api/domain/search/parser"
)

type SqlSearchAdapter struct{}

func (msa *SqlSearchAdapter) GenerateConditions(statement []parser.ParsePair,keyMapping map[string]string) [][]interface{} {
	stmt := [][]interface{}{}
	for _, p := range statement {
		k := p.Key
		if _,ok := keyMapping[k];ok {
			k = keyMapping[k]
		}
		switch p.St {
		case token.TOKEN_OP_TYPE_EQ:
			stmt = append(stmt, []interface{}{k + "=?", p.Value})
		case token.TOKEN_OP_TYPE_LIKE:
			stmt = append(stmt, []interface{}{k + " like ?", "%" + p.Value.(string) + "%"})
		case token.TOKEN_OP_TYPE_IN:
			stmt = append(stmt, []interface{}{k + " in (?)", p.Value})
		case token.TOKEN_OP_TYPE_BETWEEN:
			val := p.Value.([]string)
			stmt = append(stmt, []interface{}{k + " between ? and ?", val[0], val[1]})
		case token.TOKEN_OP_TYPE_GT:
			stmt = append(stmt, []interface{}{k + "> ?", p.Value})
		case token.TOKEN_OP_TYPE_LT:
			stmt = append(stmt, []interface{}{k + "< ?", p.Value})
		}
	}
	return stmt
}
