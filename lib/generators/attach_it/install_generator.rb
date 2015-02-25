module AttachIt
  class InstallGenerator < Rails::Generators::Base
    source_root File.expand_path('../templates', __FILE__)

    def install_js
      inject_into_file 'app/assets/javascripts/application.js', after: "//= require jquery\n" do <<-'JS'
                          //= require attach_it
      JS
      end
    end
    
    def install_route
      route "mount AttachIt::Engine, at: '/attach_it'"
    end
  end
end
