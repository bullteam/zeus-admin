package lexer

import "zeus/pkg/api/domain/search/lexer/token"

// StmKey find next key position
func StmKey(l *lexer) StmHandler {
	for {
		if l.EndOfString() {
			return StmError
		}
		if l.HasPrefix(token.TOKEN_EQUAL) {
			if l.Pos == 0 {
				l.EmitError(lexErrorSyntax)
				return StmError
			}
			l.Emit(token.TOKEN_TYPE_KEY)
			return StmEqual
		}
		l.Forward(1)
	}
}
