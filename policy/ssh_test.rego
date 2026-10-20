package main

test_rejects_public_ssh if {
    cfg := parse_config_file("../fixtures/terraform/ssh-insecure.tf")
    findings := deny with input as cfg
    count(findings) == 1
}

test_accepts_restricted_ssh if {
    cfg := parse_config_file("../fixtures/terraform/ssh-secure.tf")
    findings := deny with input as cfg
    count(findings) == 0
}
