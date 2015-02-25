# AttachIt

Mount engine in `routes.rb`

    mount AttachIt::Engine, at: "/attach_it"

Generate migrations and migrate

    rake attach_it:install:migrations
    rake db:migrate

This project rocks and uses MIT-LICENSE.
