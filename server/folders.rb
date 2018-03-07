require 'json'
require 'socket'
require 'thread'
require 'pp'
require 'fileutils'

class Folders

  def self.set( socket )
      data = socket.read
      p data
      json_data = JSON.parse( data )

      fl = FoldersList.find_or_initialize_by( guid: json_data['guid'] ){ |f_list|
        f_list.url_hash = SecureRandom.hex(16)
      }
      fl.folders = json_data['folders']
      fl.email = json_data['email']
      fl.save!
      p fl
      socket.write( fl.url_hash )
      socket.close
  end

end