variable "region" {
    type = string
    default = "us-central1"
}
variable "project" {
    type = string
    default = "seu-id-do-projeto"
}
variable "user" {
    type = string
    default = "gilbertobr"
}
variable "privatekeypath" {
    type = string
    default = "~/.ssh/id_rsa"
}
variable "publickeypath" {
    type = string
    default = "~/.ssh/id_rsa.pub"
}
