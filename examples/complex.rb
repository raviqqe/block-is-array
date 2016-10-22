#!/usr/bin/env ruby

require 'nginx-conf'


conf = nginx_conf do
  load_module '/usr/local/libexec/nginx/ngx_mail_module.so'
  load_module '/usr/local/libexec/nginx/ngx_stream_module.so'

  user :www
  worker_process 1
  events do
    worker_connections 1024
  end

  http do
    include 'mime.types'
    default_type 'application/octet-stream'

    send_file :on
    keepalive_timeout 65

    server do
      listen 80
      server_name :localhost

      location '/' do
        root '/usr/local/www/nginx'
        index 'index.html', 'index.htm'
      end
    end

    server do
      listen 443, :ssl
      server_name :localhost

      ssl_certificate 'cert.pem'
      ssl_certificate_key 'cert.key'
      ssl_session_cache 'shared:SSL:1m'
      ssl_session_timeout '5m'

      location '/' do
        root 'html'
        index 'index.html', 'index.htm'
      end
    end
  end
end

puts conf
