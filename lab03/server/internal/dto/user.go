package dto

type User struct {
	ID        string `json:"id"`
	AvatarURL string `json:"avatar_url"`
	Username  string `json:"username"`
	Password  string
	Firstname string `json:"firstname"`
	Lastname  string `json:"lastname"`
	Email     string `json:"email"`
	Extra     string `json:"extra"`
}
