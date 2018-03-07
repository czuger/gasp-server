namespace :folders do
  desc 'Create or update a folders set'
  task set: :environment do

    # Magic required to be able to use arguments
    # Comes from http://cobwwweb.com/4-ways-to-pass-arguments-to-a-rake-task
    ARGV.each { |a| task a.to_sym do ; end }

    communication_directory = '/tmp/gasp/'
    File.open( communication_directory + ARGV[1] ){ |f|
      json_data = JSON.parse( f.read )

      fl = FoldersList.find_or_initialize_by( guid: json_data['guid'] ){ |f_list|
        f_list.url_hash = SecureRandom.hex(16)
      }
      fl.folders = json_data['folders']
      fl.save!
    }

  end
end
