package main

deny contains msg if {
    some name, volumes in input.resource.aws_ebs_volume
    some volume in volumes

    object.get(volume, "encrypted", false) != true

    msg := sprintf("EBS volume %s: encryption must be explicitly enabled", [name])
}
