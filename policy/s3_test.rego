package main

test_rejects_insecure_s3 if {
    cfg := parse_config_file("../fixtures/terraform/s3-insecure.tf")
    findings := deny with input as cfg
    count(findings) == 4
}

test_accepts_secure_s3 if {
    cfg := parse_config_file("../fixtures/terraform/s3-secure.tf")
    findings := deny with input as cfg
    count(findings) == 0
}
