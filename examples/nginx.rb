#!/usr/bin/env ruby

require 'block-is-array'



conf = block_is_array %i(server load_module) do
  user :nobody, :nogroup
  worker_processes 1
  events do
    worker_connections 1024
  end

  http do
    include 'mime.types'
    default_type 'application/octet-stream'

    sendfile :on
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
      ssl_certificate_key 'key.pem'
      ssl_session_cache 'shared:SSL:1m'
      ssl_session_timeout '5m'

      location '/' do
        root 'html'
        index 'index.html', 'index.htm'
      end
    end
  end
end

p conf
