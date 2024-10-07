resource "aws_s3_bucket" "this" {
  bucket              =  "${lower(var.batchCode)}-${var.typeofBatch}-${var.bucket_identifier}" // "tg-devops-0830-weekday-aug-test2" argument
  object_lock_enabled = false
  

  tags = {
    Name      = "${var.batchCode}-${var.typeofBatch}-${var.bucket_identifier}"
    CreatedBy = var.CreatedBy
  }

}

resource "aws_s3_bucket_public_access_block" "this" {
  bucket = aws_s3_bucket.this.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
  
}

