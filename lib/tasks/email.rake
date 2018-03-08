# DEPRACATED : calling rake outside the shell is a pain in the ***

namespace :email do
  desc 'Send an email to an user for play link'
  task :send, [:guid] => :environment do |_, args|

    f = FoldersList.find_by_guid( args.guid )
    CommandLinkMailer.send_link(f).deliver_now

  end
end
