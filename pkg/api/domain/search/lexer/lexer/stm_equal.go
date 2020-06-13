package lexer

import "zeus/pkg/api/domain/search/lexer/token"

// StmEqual mange equal sign
func StmEqual(l *lexer) StmHandler {
	l.Forward(len(token.TOKEN_EQUAL))
	l.Emit(token.TOKEN_TYPE_EQUAL)
	return StmValue
}
