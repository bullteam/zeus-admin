package adapter

import "zeus/pkg/api/domain/search/parser"

type SearchAdapter interface {
	GenerateConditions([]parser.ParsePair) [][]interface{}
}
