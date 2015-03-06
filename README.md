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

Something Fancier
============

The migration file adds an `attachment_type` string column to the attachment table.

This allows you to have multiple has_* from your model to the `AttachIt::AttachmentFile` one.

So for example if you need to have n documents and one image you can do something along this lines:
  ```ruby
  MyModel < ActiveRecord::Base
    # Multiple Documents
    include AttachIt::Attacheable
    # The image
    has_one :image, class_name: "AttachIt::AttachedFile", -> { where attachment_type: 'the_image' }, as: :attacheable,  dependent: :destroy
    accepts_nested_attributes_for :image, allow_destroy: true 
  end
  ```

This project rocks and uses MIT-LICENSE.
