Gem::Specification.new do |s|
  s.name        = 'nginx-conf'
  s.version     = '0.0.1'
  s.date        = Date.today.to_s
  s.license     = 'Unlicense'

  s.summary     = 'nginx.conf generator'
  s.description = 'nginx.conf generator which tries to exploit ' \
                  'expressiveness of built-in types'

  s.authors     = ['Yota Toyama']
  s.email       = 'raviqqe@gmail.com'
  s.homepage    = 'https://github.com/raviqqe/nginx-conf.rb'

  s.files       = Dir['lib/**/*']
end
