package lexer

import "zeus/pkg/api/domain/search/lexer/token"

// StmDelimiter
func StmDelimiter(l *lexer) StmHandler {
	if l.EndOfString() {
		return StmEnd
	}
	l.Forward(len(token.TOEKN_DELIMITER))
	l.Emit(token.TOKEN_TYPE_DELIMITER)
	return StmBegin
}
