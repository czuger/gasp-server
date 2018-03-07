require 'active_record'
require 'pg'
require_relative '../app/models/application_record'
require_relative '../app/models/folders_list.rb'

credentials = YAML.load( File.open('config/database.yml','r').read )
credentials = credentials[ ENV['RAILS_ENV'] ]
credentials.merge!( 'pool' => 20 )
# p credentials
ActiveRecord::Base.establish_connection(credentials )
# p FoldersList.all