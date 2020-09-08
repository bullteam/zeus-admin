package lexer

import "zeus/pkg/api/domain/search/lexer/token"

// StmValue manage generate value statement
func StmValue(l *lexer) StmHandler {
	for {
		// deal with empty value
		if l.EndOfString() {
			l.Emit(token.TOKEN_TYPE_VAL)
			return StmEnd
		}
		// like statement
		if l.HasPrefix(token.TOKEN_LIKE) {
			l.Forward(len(token.TOKEN_LIKE))
			l.Emit(token.TOKEN_TYPE_LIKE)
			return StmValueLike
		}
		// in statement
		if l.HasPrefix(token.TOKEN_IN_LEFT) {
			l.Forward(len(token.TOKEN_IN_LEFT))
			l.Emit(token.TOKEN_TYPE_IN_LEFT)
			return StmValueIn
		}
		// between statement
		if l.HasPrefix(token.TOKEN_BETWEEN_LEFT) {
			l.Forward(len(token.TOKEN_BETWEEN_LEFT))
			l.Emit(token.TOKEN_TYPE_BETWEEN_LEFT)
			return StmValueBetween
		}
		// greater statement
		if l.HasPrefix(token.TOKEN_GT) {
			l.Forward(len(token.TOKEN_GT))
			l.Emit(token.TOKEN_TYPE_GT)
			return StmValueGT
		}
		// less than statement
		if l.HasPrefix(token.TOKEN_LT) {
			l.Forward(len(token.TOKEN_LT))
			l.Emit(token.TOKEN_TYPE_LT)
			return StmValueLT
		}
		if l.HasPrefix(token.TOEKN_DELIMITER) {
			l.Emit(token.TOKEN_TYPE_VAL)
			return StmDelimiter
		}
		l.Forward(1)
	}
}

// StmValueLike manage value of like statement
// @sample : nickname=~jack represents nickname like '%jack'
func StmValueLike(l *lexer) StmHandler {
	for {
		if l.EndOfString() {
			l.Emit(token.TOKEN_TYPE_VAL_LIKE)
			return StmEnd
		}
		if l.HasPrefix(token.TOEKN_DELIMITER) {
			l.Emit(token.TOKEN_TYPE_VAL_LIKE)
			return StmDelimiter
		}
		l.Forward(1)
	}
}

// StmValueLike manage value of in statement
// @sample : id=(1,2,3,4) represents id in ("1","2","3","4")
func StmValueIn(l *lexer) StmHandler {
	for {
		if l.EndOfString() {
			return StmError
		}
		if l.HasPrefix(token.TOKEN_IN_RIGHT) {
			l.Emit(token.TOKEN_TYPE_VAL_IN)
			l.Forward(len(token.TOKEN_IN_RIGHT))
			// skip the end char position
			l.Start = l.Pos
			return StmDelimiter
		}
		l.Forward(1)
	}
}

// StmValueBetween deal with value of between statement
// @sample : date=[2020-01-01,2020-02-02] represents date between "2020-01-01" and "2020-02-02"
func StmValueBetween(l *lexer) StmHandler {
	for {
		if l.EndOfString() {
			return StmError
		}
		if l.HasPrefix(token.TOKEN_BETWEEN_RIGHT) {
			l.Emit(token.TOKEN_TYPE_VAL_BETWEEN)
			l.Forward(len(token.TOKEN_BETWEEN_RIGHT))
			// skip the end char position
			l.Start = l.Pos
			return StmDelimiter
		}
		l.Forward(1)
	}
}

// StmValueGT manage value of greater statement
// @sample : id=>1 represents id > 1
func StmValueGT(l *lexer) StmHandler {
	for {
		if l.EndOfString() {
			l.Emit(token.TOKEN_TYPE_VAL_GT)
			return StmEnd
		}
		if l.HasPrefix(token.TOEKN_DELIMITER) {
			l.Emit(token.TOKEN_TYPE_VAL_GT)
			return StmDelimiter
		}
		l.Forward(1)
	}
}

// StmValueLT manage value of greater statement
// @sample : id=<1 represents id < 1
func StmValueLT(l *lexer) StmHandler {
	for {
		if l.EndOfString() {
			l.Emit(token.TOKEN_TYPE_VAL_LT)
			return StmEnd
		}
		if l.HasPrefix(token.TOEKN_DELIMITER) {
			l.Emit(token.TOKEN_TYPE_VAL_LT)
			return StmDelimiter
		}
		l.Forward(1)
	}
}
