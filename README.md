# AttachIt

## Install

1. `rails g attach_it:install`

it will

- Mount engine in `routes.rb`

    mount AttachIt::Engine, at: "/attach_it"

- Add attach_it js and css to application

- Generate migrations (can also be done through `rake attach_it:install:migrations`)
    

2. rake db:migrate

3. Add attacheable to your models:

    include AttachIt::Attacheable

This project rocks and uses MIT-LICENSE.
