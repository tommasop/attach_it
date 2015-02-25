require 'active_support/concern'

module AttachIt
  module Attacheable
    extend ActiveSupport::Concern

    included do
      has_many :attached_files, class_name: "AttachIt::AttachedFile",  as: :attacheable, dependent: :destroy
      accepts_nested_attributes_for :attached_files, allow_destroy: true
    end

    module ClassMethods
      def attacheable?
        true
      end
    end

  end

end
