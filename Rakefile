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


namespace :db do
  require "sequel"
  Sequel.extension :migration
  # DB = Sequel.connect(ENV['DATABASE_URL'])
  DB = Sequel.connect(adapter: :postgres,
  	user: ENV['DB_USER'],
  	password: ENV['DB_PASSWORD'],
  	database: 'luhistin')
  migration_path = "./db/migrate"

  desc "Prints current schema version"
  task :version do    
    version = if DB.tables.include?(:schema_info)
      DB[:schema_info].first[:version]
    end || 0

    puts "Schema Version: #{version}"
  end

  desc "Perform migration up to latest migration available"
  task :migrate do
    Sequel::Migrator.run(DB, migration_path)
    Rake::Task['db:version'].execute
  end
    
  desc "Perform rollback to specified target or full rollback as default"
  task :rollback, :target do |t, args|
    args.with_defaults(:target => 0)

    Sequel::Migrator.run(DB, migration_path, :target => args[:target].to_i)
    Rake::Task['db:version'].execute
  end

  desc "Perform migration reset (full rollback and migration)"
  task :reset do
    Sequel::Migrator.run(DB, migration_path, :target => 0)
    Sequel::Migrator.run(DB, migration_path)
    Rake::Task['db:version'].execute
  end    
end

#task default: :spec
