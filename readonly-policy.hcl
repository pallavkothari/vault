path "sys/*" {
  policy = "deny"
}

path "secret/*" {
  policy = "read"
}
