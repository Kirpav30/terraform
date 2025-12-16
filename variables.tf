variable "proxmox_api_url" {
    description = "API URL Proxmox"
    type = string
}

variable "proxmox_api_token_id" {
    description = "Token ID для API"
    type = string
    sensitive = true
}

variable "proxmox_api_token_secret" {
    description = "Token Secret для API"
    type = string
    sensitive = true
}

variable "ssh_public_key" {
    description = "Публичный SSH ключ"
    type = string
}