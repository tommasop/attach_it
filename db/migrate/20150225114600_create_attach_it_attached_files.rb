class CreateAttachItAttachedFiles < ActiveRecord::Migration
  def change
    create_table :attach_it_attached_files do |t|
      t.references :attacheable, polymorphic: true, index: {name: "index_attach_it_attachments"}
      t.string :attachment_type
      t.string :file_data_uid
      t.string :file_data_name

      t.timestamps null: false
    end
  end
end
