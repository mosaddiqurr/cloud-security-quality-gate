package main

deny contains msg if {
    some name, trails in input.resource.aws_cloudtrail
    some trail in trails

    object.get(trail, "enable_logging", true) == false

    msg := sprintf("CloudTrail %s: logging is disabled", [name])
}
