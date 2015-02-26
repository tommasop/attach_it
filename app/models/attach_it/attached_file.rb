module AttachIt
  class AttachedFile < ActiveRecord::Base
    belongs_to :attacheable, :polymorphic => true
    dragonfly_accessor :file_data
    
    if ::ActiveRecord::VERSION::MAJOR < 4 || defined?(ProtectedAttributes)
      attr_accessible :attacheable_type, :attacheable_id, :file_data
    end
    # Validation examples ready for customization
    # validates :file_data, presence: true
    # validates_size_of :file_data, maximum: 500.kilobytes, message: "should be no more than 500 KB", if: :file_data_changed?

    # validates_property :format, of: :file_data, in: [:jpeg, :jpg, :png, :bmp], case_sensitive: false, message: "should be either .jpeg, .jpg, .png, .bmp", if: :file_data_changed?

    def thumb_url
      original = case file_data.ext
                 when 'png', 'gif' ,'jpeg', 'jpg'
                   file_data
                 when 'pdf'
                   Dragonfly.app.fetch_file('public/pdf.png')
                 when 'doc', 'docx'
                   Dragonfly.app.fetch_file('public/doc.png')
                 end
      original.url
    end
  end
end
