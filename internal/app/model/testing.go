package model

import "testing"

// TestUser ...
func TestUser(t *testing.T) *User {
	return &User{
		ID:       1,
		Email:    "user@example.org",
		Password: "password",
	}
}
