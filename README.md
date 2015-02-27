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

4. Add partial to show and add files to your view

    <%= render "attach_it/attached_files/add_files", attached_model: @actual_model  %>

5. Add partial to show and add files to your activeadmin view

    show do
      render 'admin/shared/show', model: actual_model
    end 

This project rocks and uses MIT-LICENSE.
