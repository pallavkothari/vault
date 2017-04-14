path "sys/*" {
  policy = "deny"
}

path "secret/*" {
  policy = "read"
}

path "aws/*" {
  policy = "read"
}