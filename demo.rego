package app.demo

default allow = false

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

# manager can update some specific locations
allow {
	locationAllowed = {"America", "Britain", "India", "Australia"}
	input.user == "bob"
	input.role == "manager"
	input.action == "update"
	locationAllowed[input.newLocation]
}