# AttachIt

Installation
============

In your Gemfile
```ruby
gem 'attach_it', github: 'tommasop/attach_it', branch: 'master'
```

1. Mount engine in `routes.rb`
  ```ruby
    mount AttachIt::Engine, at: "/attach_it"
  ```
2. Add attach_it js and css to application
3. Generate migrations and migrate 
  ```shell
    rake attach_it:install:migrations
    rake db:migrate
  ```
4. Add attacheable to your models:
  ```ruby
    include AttachIt::Attacheable
  ```
5. Add partial, to show and add files to your view
  ```ruby
    <%= render "attach_it/attached_files/add_files", attached_model: @actual_model  %>
  ```

Active Admin Integration
============

1. Add attach_it js and css to application

2. Add partial to show and add files to your activeadmin view
  ```ruby
    show do
      render 'admin/shared/show', model: actual_model
    end 
  ```

This project rocks and uses MIT-LICENSE.
