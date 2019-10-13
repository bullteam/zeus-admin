package dto

type CheckPermDto struct {
	Domain string `form:"domain" json:"domain" binding:"required"`
	Perm   string `form:"perm" json:"perm" binding:"required"`
}
