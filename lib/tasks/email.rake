# DEPRACATED : calling rake outside the shell is a pain in the ***

namespace :email do
  desc 'Send an email to an user for play link'
  task send: :environment do

    f = FoldersList.first

    CommandLinkMailer.send_link(f).deliver_now

  end
end
