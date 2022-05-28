package parser

import (
	"errors"
	"strconv"
	"strings"
	"zeus/pkg/api/domain/search/lexer/lexer"
	"zeus/pkg/api/domain/search/lexer/token"
)

var (
	ErrorUnexpectedToken = errors.New("unexpected syntax")
)

type ParsePair struct {
	Key   string       `json:"key"`
	Value interface{}  `json:"val"`
	St    token.OpType `json:"st"`
}

func Parse(source string) ([]ParsePair, error) {
	lex := lexer.NewLexer(source)
	var tokens []ParsePair
	key := ""
	for {
		tk := lex.Token()
		switch tk.Type {
		case token.TOKEN_TYPE_ERROR:
			return tokens, ErrorUnexpectedToken
		case token.TOKEN_TYPE_END:
			return tokens, nil
		case token.TOKEN_TYPE_KEY:
			key = tk.Value.(string)
		case token.TOKEN_TYPE_VAL,
			token.TOKEN_TYPE_VAL_LIKE:
			tokens = append(tokens, ParsePair{
				Key:   key,
				Value: tk.Value,
				St:    tk.OpType,
			})
			key = ""
		case token.TOKEN_TYPE_VAL_GT,
			token.TOKEN_TYPE_VAL_LT:
			val, err := strconv.Atoi(tk.Value.(string))
			if err != nil {
				return tokens, err
			}
			tokens = append(tokens, ParsePair{
				Key:   key,
				Value: val,
				St:    tk.OpType,
			})
			key = ""
		case token.TOKEN_TYPE_VAL_BETWEEN,
			token.TOKEN_TYPE_VAL_IN:
			tokens = append(tokens, ParsePair{
				Key:   key,
				Value: strings.Split(tk.Value.(string), ","),
				St:    tk.OpType,
			})
			key = ""
		}
	}
}
