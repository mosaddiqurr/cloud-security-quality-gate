package main

deny contains msg if {
    some name, blocks in input.resource.aws_s3_bucket_public_access_block
    some block in blocks

    some setting in [
        "block_public_acls",
        "ignore_public_acls",
        "block_public_policy",
        "restrict_public_buckets"
    ]

    object.get(block, setting, false) != true

    msg := sprintf("S3 %s: %s must be true", [name, setting])
}
