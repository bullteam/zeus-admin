package dto

import "strings"

// GeneralListDto - General list request params
type GeneralListDto struct {
	Skip  int    `form:"skip,default=0" json:"skip"`
	Limit int    `form:"limit,default=20" json:"limit" binding:"max=100"`
	Order string `form:"order" json:"order"`
	Q     string `form:"q" json:"q"`
}

type GeneralTreeDto struct {
	Q string `form:"q" json:"q"`
}
type GeneralDelDto struct {
	Id int `uri:"id" json:"id" binding:"required"`
}
type GeneralGetDto struct {
	Id int `uri:"id" json:"id" binding:"required"`
}

// TransformSearch - transform search query
func TransformSearch(qs string, mapping map[string]string) (ss map[string]string) {
	ss = make(map[string]string)
	for _, v := range strings.Split(qs, ",") {
		vs := strings.Split(v, "=")
		if _, ok := mapping[vs[0]]; ok {
			ss[mapping[vs[0]]] = vs[1]
		}
	}
	return
}
