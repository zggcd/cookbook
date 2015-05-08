default["prometheus"]["cms_db_host"] = "\'localhost\'"
default["prometheus"]["cms_db_name"] = "\'cms\'"
default["prometheus"]["cms_db_port"] = "\'3306\'"
default["prometheus"]["cms_db_user"] = "\'root\'"
default["prometheus"]["cms_db_pass"] = "\'\'"
default["prometheus"]["cms_db_driver"] = "\'mysql\'"
default["prometheus"]["cms_db_prefix"] = "\'\'"


default[:memcached][:memory] = 512
default[:memcached][:port] = 11211
default[:memcached][:user] = 'nobody'
default[:memcached][:max_connections] = "4096"
