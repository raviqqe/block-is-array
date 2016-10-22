task :build do
  sh %q(gem build *.gemspec)
end

task :install => :build do
  sh %q(gem install *.gem)
end

task :test => :install do
  Dir.glob('examples/*.rb').each do |file|
    sh %Q(ruby #{file})
  end
end

task :default => :build
