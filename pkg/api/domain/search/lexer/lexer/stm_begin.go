package lexer

// StmBegin start to do lexer process
func StmBegin(l *lexer) StmHandler {
	return StmKey(l)
}
