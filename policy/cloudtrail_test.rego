package main

test_rejects_disabled_cloudtrail if {
    cfg := parse_config_file("../fixtures/terraform/cloudtrail-insecure.tf")
    findings := deny with input as cfg
    count(findings) == 1
}

test_accepts_enabled_cloudtrail if {
    cfg := parse_config_file("../fixtures/terraform/cloudtrail-secure.tf")
    findings := deny with input as cfg
    count(findings) == 0
}

test_accepts_default_cloudtrail_logging if {
    cfg := {
        "resource": {
            "aws_cloudtrail": {
                "example": [{"name": "test-trail"}]
            }
        }
    }
    findings := deny with input as cfg
    count(findings) == 0
}
