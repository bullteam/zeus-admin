package lexer

import (
	"zeus/pkg/api/domain/search/lexer/token"
)

const (
	lexErrorSyntax = `Unexpected syntax`
)

type StmHandler func(*lexer) StmHandler

// StmError manages syntax error
func StmError(l *lexer) StmHandler {
	l.Tokens <- token.Token{
		Type:   token.TOKEN_TYPE_ERROR,
		Value:  "EOF",
		OpType: -1,
	}
	return nil
}

// StmEnd manages common ends
func StmEnd(l *lexer) StmHandler {
	l.Tokens <- token.Token{
		Type:   token.TOKEN_TYPE_END,
		Value:  "DONE",
		OpType: -1,
	}
	return nil
}
