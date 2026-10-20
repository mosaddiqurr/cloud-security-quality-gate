package main

test_rejects_unencrypted_ebs if {
    cfg := parse_config_file("../fixtures/terraform/ebs-insecure.tf")
    findings := deny with input as cfg
    count(findings) == 1
}

test_accepts_encrypted_ebs if {
    cfg := parse_config_file("../fixtures/terraform/ebs-secure.tf")
    findings := deny with input as cfg
    count(findings) == 0
}

test_rejects_missing_encryption_setting if {
    cfg := {
        "resource": {
            "aws_ebs_volume": {
                "example": [{"size": 10}]
            }
        }
    }
    findings := deny with input as cfg
    count(findings) == 1
}
