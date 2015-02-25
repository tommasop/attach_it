require 'active_support/concern'

module AttachIt
  module Attacheable
    extend ActiveSupport::Concern

    included do
      has_many :attach_it_attached_files, as: :attacheable, dependent: :destroy
      accepts_nested_attributes_for :attach_it_attached_files, allow_destroy: true
    end

    module ClassMethods
      def attacheable?
        true
      end
    end

  end

end
