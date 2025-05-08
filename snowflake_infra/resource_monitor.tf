# resource_monitor.tf - Creating a resource monitor for the warehouse and database

# Create a Resource Monitor to track credit usage
resource "snowflake_resource_monitor" "dev_monitor" {
  name          = "DEV_RESOURCE_MONITOR"
  comment       = "Monitor for DEV environment (Warehouse and Database)"
  type          = "CREDIT_USAGE"
  frequency     = "DAILY"    # Set frequency to DAILY, WEEKLY, or MONTHLY
  credit_quota  = 100         # Set credit quota for the monitoring period (100 credits)
  enabled       = true        # Enable the resource monitor immediately

  # Action to take when the credit usage exceeds the quota
  action {
    type           = "SUSPEND"   # Actions: SUSPEND, ALERT, or NONE
    warehouse_name = "dev_wh"   # Monitor and suspend the dev_wh warehouse
  }
}

# Optionally, assign the resource monitor to a virtual warehouse or a specific resource
resource "snowflake_resource_monitor_grant" "dev_monitor_grant" {
  resource_monitor_name = snowflake_resource_monitor.dev_monitor.name
  warehouse_name        = "dev_wh"  # Assigning the monitor to dev_wh warehouse
  database_name         = "dev_db"  # Optionally, you can assign it to dev_db if required
}
