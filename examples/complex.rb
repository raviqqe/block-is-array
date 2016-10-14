#!/usr/bin/env ruby

require 'nginx-conf'


c = NginxConf.new(
  user: :www,
  worker_process: 1,
  events: { worker_connections: 1024 },
)

c.load_module '/usr/local/libexec/nginx/ngx_mail_module.so'
c.load_module '/usr/local/libexec/nginx/ngx_stream_module.so'

c[:http][:include] = 'mime.types'
c[:http][:default_type] = 'application/octet-stream'

c[:http][:send_file] = :on
c[:http][:keepalive_timeout] = 65

c.server(
  listen: 80,
  server_name: :localhost,
  location: ['/', {
    root: '/usr/local/www/nginx',
    index: ['index.html', 'index.htm'],
  }],
)

c.server(
  listen: [443, :ssl],
  server_name: :localhost,

  ssl_certificate: 'cert.pem',
  ssl_certificate_key: 'cert.key',
  ssl_session_cache: 'shared:SSL:1m',
  ssl_session_timeout: '5m',

  location: ['/', {
    root: 'html',
    index: ['index.html', 'index.htm'],
  }],
)

puts c
