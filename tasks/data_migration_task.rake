namespace :db do
  namespace :data do
    desc "Migrate the database through scripts in db/data_migrate. Target specific version with VERSION=x. Turn off output with VERBOSE=false."
    task :migrate => :environment do
      ActiveRecord::Migration.verbose = ENV["VERBOSE"] ? ENV["VERBOSE"] == "true" : true
      ActiveRecord::Migrator.migrate("db/data_migrate/", ENV["VERSION"] ? ENV["VERSION"].to_i : nil)
    end    
  end
end