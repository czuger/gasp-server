class CommandLinkMailer < ApplicationMailer

  # default from: 'no-reply@ieroe.com'

  def send_link(folders)
    @link = 'http://gasp.ieroe.com/ambiant/' + folders.url_hash
    mail(to: folders.email, subject: 'Your link')
  end

end
