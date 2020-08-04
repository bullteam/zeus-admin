package lexer

import (
	"github.com/stretchr/testify/assert"
	"testing"
	"zeus/pkg/api/domain/search/lexer/token"
)

func TestNewLexer(t *testing.T) {
	lx := NewLexer("a=b")
	assert.NotNil(t, lx)
}

func TestStmBegin(t *testing.T) {
	lx := NewLexer("username=中国")
	StmBegin(lx)
	tk := <-lx.Tokens
	assert.Equal(t, "username", tk.Value)
}

func TestStmKey(t *testing.T) {
	lx := NewLexer("=any")
	StmKey(lx)
	tk := <-lx.Tokens
	assert.Equal(t, token.TOKEN_TYPE_ERROR, tk.Type)
}

func TestStmValue(t *testing.T) {
	lx := NewLexer("hello=广州")
	fun := StmKey(lx)
	tk := <-lx.Tokens
	assert.Equal(t, "hello", tk.Value)
	fun = fun(lx)
	tk = <-lx.Tokens
	assert.Equal(t, "=", tk.Value)
	fun = fun(lx)
	tk = <-lx.Tokens
	assert.Equal(t, "广州", tk.Value)
}

func TestStmDelimiter(t *testing.T) {
	lx := NewLexer("hello=world|good=guy")
	fun := StmKey(lx)
	tk := <-lx.Tokens
	assert.Equal(t, "hello", tk.Value)
	fun = fun(lx)
	tk = <-lx.Tokens
	assert.Equal(t, "=", tk.Value)
	fun = fun(lx)
	tk = <-lx.Tokens
	assert.Equal(t, "world", tk.Value)
	fun = fun(lx)
	tk = <-lx.Tokens
	assert.Equal(t, "|", tk.Value)
}

func TestStmValueLike(t *testing.T) {
	lx := NewLexer("hello=~world")
	fun := StmKey(lx)
	tk := <-lx.Tokens
	assert.Equal(t, "hello", tk.Value)
	fun = fun(lx)
	tk = <-lx.Tokens
	assert.Equal(t, "=", tk.Value)
	fun = fun(lx)
	tk = <-lx.Tokens
	assert.Equal(t, "~", tk.Value)
	fun = fun(lx)
	tk = <-lx.Tokens
	assert.Equal(t, "world", tk.Value)
	assert.Equal(t, token.TOKEN_OP_TYPE_LIKE, tk.OpType)
}

func TestStmValueIn(t *testing.T) {
	lx := NewLexer("hello=(1,2,3,4)")
	fun := StmKey(lx)
	tk := <-lx.Tokens
	assert.Equal(t, "hello", tk.Value)
	fun = fun(lx)
	tk = <-lx.Tokens
	assert.Equal(t, "=", tk.Value)
	fun = fun(lx)
	tk = <-lx.Tokens
	assert.Equal(t, "(", tk.Value)
	fun = fun(lx)
	tk = <-lx.Tokens
	assert.Equal(t, "1,2,3,4", tk.Value)
	assert.Equal(t, token.TOKEN_OP_TYPE_IN, tk.OpType)
}

func TestStmValueBetween(t *testing.T) {
	lx := NewLexer("hello=[1,2]")
	fun := StmKey(lx)
	tk := <-lx.Tokens
	assert.Equal(t, "hello", tk.Value)

	fun = fun(lx)
	tk = <-lx.Tokens
	assert.Equal(t, "=", tk.Value)

	fun = fun(lx)
	tk = <-lx.Tokens
	assert.Equal(t, "[", tk.Value)

	fun = fun(lx)
	tk = <-lx.Tokens
	assert.Equal(t, "1,2", tk.Value)
}

func TestStmValueGT(t *testing.T) {
	lx := NewLexer("id=>100")
	fun := StmKey(lx)
	tk := <-lx.Tokens
	assert.Equal(t, "id", tk.Value)

	fun = fun(lx)
	tk = <-lx.Tokens
	assert.Equal(t, "=", tk.Value)

	fun = fun(lx)
	tk = <-lx.Tokens
	assert.Equal(t, ">", tk.Value)

	fun = fun(lx)
	tk = <-lx.Tokens
	assert.Equal(t, "100", tk.Value)
	assert.Equal(t,token.TOKEN_TYPE_VAL_GT,tk.Type)
}

func TestStmValueLT(t *testing.T) {
	lx := NewLexer("id=<10")
	fun := StmKey(lx)
	tk := <-lx.Tokens
	assert.Equal(t, "id", tk.Value)

	fun = fun(lx)
	tk = <-lx.Tokens
	assert.Equal(t, "=", tk.Value)

	fun = fun(lx)
	tk = <-lx.Tokens
	assert.Equal(t, "<", tk.Value)

	fun = fun(lx)
	tk = <-lx.Tokens
	assert.Equal(t, "10", tk.Value)
	assert.Equal(t,token.TOKEN_TYPE_VAL_LT,tk.Type)
}
