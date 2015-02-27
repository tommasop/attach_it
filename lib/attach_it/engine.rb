module AttachIt
  class Engine < ::Rails::Engine
    isolate_namespace AttachIt

    #initializer "ActiveAdmin precompile hook" do |app|
    #  app.config.assets.precompile += ['attach_it/application.js', 'attach_it/application.css']
    #end
  end
end
