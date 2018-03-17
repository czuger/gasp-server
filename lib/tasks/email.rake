# DEPRACATED : calling rake outside the shell is a pain in the ***

namespace :email do
  desc 'Send an email to an user for play link'
  task :send => :environment do

    ARGV.each { |a| task a.to_sym do ; end }

    p ARGV[1]

    f = FoldersList.find_by_guid( ARGV[1] )
    p f

    p CommandLinkMailer.send_link(f).deliver_now

  end
end
