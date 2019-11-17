resource "aws_s3_bucket" "bucket" {
  bucket = "${var.s3_bucket_name}"
  tags   = "${var.tags}"
  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        kms_master_key_id = "${aws_kms_key.kms_key.arn}"
        sse_algorithm     = "aws:kms"
      }
    }
  }
}

resource "aws_kms_key" "kms_key" {
  description             = "kms key for data encryption"
  deletion_window_in_days = 7
  tags                    = "${var.tags}"
}

resource "aws_kms_alias" "a" {
  name          = "alias/${var.key_name}"
  target_key_id = "${aws_kms_key.kms_key.key_id}"
}
