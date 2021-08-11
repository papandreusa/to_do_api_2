JWTSessions.token_store = :redis, {
  redis_host: 'localhost',
  redis_port: '6379',
  redis_db_name: '0',
  token_prefix: 'jwt_'
}
JWTSessions.access_exp_time = 3600
JWTSessions.refresh_exp_time = 604_800
JWTSessions.access_header = 'Authorization'
JWTSessions.algorithm = 'HS256'
JWTSessions.encryption_key = 'secret'
