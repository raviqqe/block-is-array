TMP_DIR = 'tmp'


task :build do
  sh %q(gem build *.gemspec)
end

task :install => :build do
  sh %q(gem install *.gem)
end

task :test => :install do
  rm_rf TMP_DIR
  cp_r '/etc/nginx', TMP_DIR
  cert, key = %w(cert.pem key.pem).map { |file| File.join TMP_DIR, file }
  sh %Q(openssl req -nodes -x509 -newkey rsa:4096 -out #{cert} -keyout #{key} \
                    -subj "/C=/ST=/L=/O=/OU=/CN=foo.com")

  Dir.glob('examples/*.rb').each do |file|
    conf = File.absolute_path File.join(TMP_DIR, 'nginx.conf')
    File.write conf, `ruby #{file}`
    sh %Q(sudo nginx -t -c #{conf})
  end

  rm_r TMP_DIR
end

task :default => :build
