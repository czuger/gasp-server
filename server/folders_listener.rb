require 'json'
require 'socket'
require 'thread'
require 'pp'
require 'fileutils'
require 'active_record'
require 'pg'
require_relative '../app/models/application_record'
require_relative '../app/models/folders_list.rb'

Thread.abort_on_exception = true

class FoldersListener

  COMMUNICATION_PATH = '/tmp/gasp/'

  def wait
    folders_receiver = TCPServer.new 6663
    p folders_receiver
    FileUtils.mkpath( COMMUNICATION_PATH ) unless Dir.exist? ( COMMUNICATION_PATH )

    ar_connection

    loop do

      socket = folders_receiver.accept
      p socket

      Thread.new{
          data = socket.read
          json_data = JSON.parse( data )

          fl = FoldersList.find_or_initialize_by( guid: json_data['guid'] ){ |f_list|
            f_list.url_hash = SecureRandom.hex(16)
          }
          fl.folders = json_data['folders']
          fl.save!
          p fl
      }
    end
  end

  private

  def ar_connection
    credentials = YAML.load( File.open('config/database.yml','r').read )
    credentials = credentials[ ENV['RAILS_ENV'] ]
    credentials.merge!( 'pool' => 20 )
    p credentials
    ActiveRecord::Base.establish_connection(credentials )
    p FoldersList.all
  end

end