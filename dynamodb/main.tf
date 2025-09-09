resource "aws_dynamodb_table" "demo-table" {
    name           = "demo-table"
    billing_mode   = "PAY_PER_REQUEST"
    hash_key       = "id"

    attribute {
        name = "id"
        type = "S"
    }
}