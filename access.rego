package app.opaldemo_2

default allow = false

allow {
    input.user == "alice"
    input.role == "admin"
}

allow {
    input.user == "bob"
    input.role == "user"
    input.action == "read"
}

allow {
    input.user == "carol"
    input.role == "user"
    input.action == "write"
    canWriteToResource[input.object]
}

allow {
    input.user == "alice"
    input.role == "user"
    input.action == "update"
    isAllowedToUpdateValue[input.object]
}

canWriteToResource[obj] {
    input.user == "carol"
    input.role == "user"
    obj == "resource1"
    input.object == "resource2"
}

isAllowedToUpdateValue[obj] {
    obj == "resource1"
    input.newValue == "approved_value"
}
