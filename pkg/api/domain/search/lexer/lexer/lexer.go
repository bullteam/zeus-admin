package lexer

import (
	"strings"
	"zeus/pkg/api/domain/search/lexer/token"
)

func NewLexer(source string) *lexer {
	return &lexer{
		Source: source,
		Pos:    0,
		Start:  0,
		Stm:    StmBegin,
		Tokens: make(chan token.Token, 1),
		Length: len(source),
	}
}

// lexer ...
type lexer struct {
	Source string
	Pos    int
	Start  int
	Stm    StmHandler
	Tokens chan token.Token
	Length int
}

// Emit put tokens in chan
func (l *lexer) Emit(tokenType token.TokenType) {
	tk := token.Token{Type: tokenType, Value: l.Source[l.Start:l.Pos], OpType: token.TOKEN_OP_TYPE_EQ}
	if tokenType == token.TOKEN_TYPE_VAL_LIKE {
		tk.OpType = token.TOKEN_OP_TYPE_LIKE
	}
	if tokenType == token.TOKEN_TYPE_VAL_IN {
		tk.OpType = token.TOKEN_OP_TYPE_IN
	}
	if tokenType == token.TOKEN_TYPE_VAL_BETWEEN {
		tk.OpType = token.TOKEN_OP_TYPE_BETWEEN
	}
	if tokenType == token.TOKEN_TYPE_VAL_LT {
		tk.OpType = token.TOKEN_OP_TYPE_LT
	}
	if tokenType == token.TOKEN_TYPE_VAL_GT {
		tk.OpType = token.TOKEN_OP_TYPE_GT
	}
	l.Tokens <- tk
	l.Start = l.Pos
}

func (l *lexer) EmitError(reason string) {
	l.Tokens <- token.Token{Type: token.TOKEN_TYPE_ERROR, Value: reason, OpType: -1}
	l.Start = l.Pos
}

func (l *lexer) HasPrefix(s string) bool {
	return strings.HasPrefix(l.Source[l.Pos:], s)
}

func (l *lexer) Forward(step int) {
	l.Pos += step
}

func (l *lexer) Backward(step int) {
	l.Pos -= step
}

func (l *lexer) EndOfString() bool {
	return l.Pos >= l.Length
}

func (l *lexer) Token() token.Token {
	for {
		select {
		case tk := <-l.Tokens:
			return tk
		default:
			l.Stm = l.Stm(l)
		}
	}
}
