output "rds-endpoint" {
  value = aws_db_instance.vprofile-rds.endpoint
}

output "memcached-endpoint" {
  value = aws_elasticache_cluster.vprofile-cache.configuration_endpoint
}
