variable "scalr_google_project" {
type = string
   default = "development-156220"
}


variable "region" {
   default = "us-east1"
}

variable "name" {
   default = "new"
}

variable "cloud_sql_postgres_tier" {
 default = "db-f1-micro"
}


variable "backup_start_time" {
   default = "12.00"
  
}
variable "google_sql_database_instance-pgsql-name" {
   default = "qa"
  
}
variable "admin_password" {
      default = "qa"
}
variable "service_account_email" {
      default = "1@1.net.com"
}
