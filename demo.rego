package app.demo

default allow = false

# admin role
allow {
    input.user == "alice"
    input.role == "admin"
}

# for manager role, reading list of admins
allow {
    input.user == "bob"
    input.role == "manager"
    input.action == "read"
}