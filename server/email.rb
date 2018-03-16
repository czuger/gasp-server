require 'rake'

class Email

  def self.send( guid )

    app = Rake.application
    app.init
    # do this as many times as needed
    app.add_import 'lib/tasks/folders.rake'
    # this loads the Rakefile and other imports
    app.load_rakefile
    puts 'Rakefile loaded'

    p app['email:send'].invoke( guid )
  end

end