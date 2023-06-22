terraform {
    backend "s3" {
        bucket = "backend-terraform-platzi-gzl"
        key = "dev"
        region = "us-east-1"
        encrypt = true
        # Enviar ARN del recurso que creó al archivo de estado
        kms_key_id = "arn:aws:kms:us-east-1:887384465793:key/6e47b90f-b5bd-4f8d-bee4-9b9de131159c"
    }
}