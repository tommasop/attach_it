require 'active_support/concern'
module AttachIt
  extend ActiveSupport::Concern

  module ClassMethods

    def is_attacheable 
      has_many :attach_it_attached_files, as: :attacheable, dependent: :destroy
      accepts_nested_attributes_for :attach_it_attached_files, allow_destroy: true
    end
  end

end

class ActiveRecord::Base
  include AttachIt
end

