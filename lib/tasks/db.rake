require "octopus"
namespace :db do
  desc 'Build the databases for tests'
  task :build_databases do
    [:transport_dev].each do |country|
      puts "inside"
#       %x("create database #{country}_shard")
      DB_ENV = 'development'
      connection_details = YAML::load(File.open('config/database.yml'))
      ActiveRecord::Base.establish_connection(connection_details[DB_ENV])
      ActiveRecord::Base.connection.execute 'create database #{country}_shard;'
    end
  end
end