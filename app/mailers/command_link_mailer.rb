class CommandLinkMailer < ApplicationMailer

  default from: 'notifications@example.com'

  def send_link(folders)
    @link = 'http://gasp.ieroe.com/ambiant/show/' + folders.url_hash
    mail(to: folders.email, subject: 'Your link')
  end

end
