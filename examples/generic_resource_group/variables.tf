variable "ressource_group_config" {
    type  = map(object({
        location = string
        tags = object({
            stage = string
            })
    }))
    description = "Configuration to deploy multiple resource groups"
}