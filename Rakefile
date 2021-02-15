require 'rake'
require 'rspec/core/rake_task'

# From:
# https://medium.com/@mglover/automated-tests-ruby-rspec-rake-and-travis-3312b50109a5

RSpec::Core::RakeTask.new(:spec) do |t|
  # NOTE: spec task seems to work even without
  # the next line, but it doesn't hurt either
  t.pattern = Dir.glob("spec/**/*_spec.rb")
  t.rspec_opts = "--format documentation"
end

task :default do
	puts "=== INSTALLING MISSING GEMS IF ANY ==="
	sh "bundle install"
	puts "=== BUILDING WITH WEBPACK ==="
	sh "npm run build"
	puts "=== STARTING SINATRA SERVER ==="
	sh "bundle exec ruby start.rb"
end


#task default: :spec
