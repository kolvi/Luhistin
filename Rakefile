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

task default: :spec
