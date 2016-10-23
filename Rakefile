require 'rake/clean'



task :build do
  sh 'gem build *.gemspec'
end

task :push => :build do
  sh 'gem push *.gem'
end

task :install => :build do
  sh 'gem install *.gem'
end

task :test => :install do
  sh 'tool/run_readme.sh README.md'

  Dir.glob('examples/*.rb').each do |file|
    ruby file
  end
end

task :default => :build


CLEAN.include Dir.glob ['*.gem']
