package parser

import (
	"encoding/json"
	"fmt"
	"github.com/stretchr/testify/assert"
	"testing"
)

func TestParse(t *testing.T) {
	tks, err := Parse("u.name=lake|u.id=(1,2,3,4)|u.nick=~sun|u.create_time=[2020-01-01,2020-02-01]|id=>10|age=<20")
	assert.NoError(t, err)
	prettyTks, _ := json.MarshalIndent(tks, "", " ")
	t.Log(fmt.Sprintf("%s", prettyTks))

	tks, err = Parse("u.name=lake|u.id=1,2,3,4)|u.nick=~sun|u.create_time=[2020-01-01,2020-02-01]")
	assert.NoError(t, err)

	tks, err = Parse("u.name=lake|u.id=(1,2,3,4|u.nick=~sun|u.create_time=[2020-01-01,2020-02-01]")
	assert.Error(t, err)

	tks, err = Parse("u.name=lake|u.id=(1,2,3,4)|u.nick=~sun|u.create_time=[2020-01-01,2020-02-01]")
	assert.NoError(t, err)
}
