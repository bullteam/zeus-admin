package dto

import "strings"

// GeneralListDto - General list request params
type GeneralListDto struct {
	Offset int    `form:"offset,default=0" json:"offset"`
	Limit  int    `form:"limit,default=20" json:"limit"`
	Order  string `form:"order" json:"order"`
	Q      string `form:"q" json:"q"`
}
type GeneralDelDto struct {
	Id     int       `uri:"id" json:"id" binding:"required"`
}
// TransformSearch - transform search query
func (gl GeneralListDto) TransformSearch(mapping map[string]string) (ss map[string]string) {
	ss = make(map[string]string)
	for _, v := range strings.Split(gl.Q, ",") {
		vs := strings.Split(v, "=")
		if _, ok := mapping[vs[0]]; ok {
			ss[mapping[vs[0]]] = vs[1]
		}
	}
	return
}
