package main

deny contains msg if {
    some name, groups in input.resource.aws_security_group
    some group in groups
    some rule in group.ingress

    rule.protocol in {"tcp", "6"}
    rule.from_port <= 22
    rule.to_port >= 22

    "0.0.0.0/0" in rule.cidr_blocks

    msg := sprintf("Security group %s: SSH is exposed to 0.0.0.0/0", [name])
}
