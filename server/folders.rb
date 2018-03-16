require 'json'
require 'socket'
require 'thread'
require 'pp'
require 'fileutils'
require_relative 'email'

class Folders

  def self.set( socket )
    puts 'In Folders.set'

      data = socket.gets.chomp
      puts 'Data read = ' + data.inspect

      json_data = JSON.parse( data )
      puts 'Data read.json = ' + json_data.inspect

      fl = FoldersList.find_or_initialize_by( guid: json_data['guid'] ){ |f_list|
        f_list.url_hash = SecureRandom.hex(16)
      }
      fl.folders = json_data['folders']
      fl.email = json_data['email']
      fl.save!
      puts 'Database object = ' + fl.inspect
      STDOUT.flush

      puts 'About to write'
      socket.write( fl.url_hash )

      puts 'About to close socket'
      socket.close

    puts 'About to send email'
      Email.send(fl.guid )
  end

end