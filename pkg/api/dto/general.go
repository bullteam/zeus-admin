package dto

// General list request params
type GeneralListDto struct {
	Offset int    `form:"offset,default=0" json:"offset"`
	Limit  int    `form:"limit,default=20" json:"limit"`
	Order  string `form:"order" json:"order"`
	Q      string `form:"q" json:"q"`
}
