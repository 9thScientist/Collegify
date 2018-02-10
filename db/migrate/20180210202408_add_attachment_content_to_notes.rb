class AddAttachmentContentToNotes < ActiveRecord::Migration
  def self.up
    change_table :notes do |t|
      t.attachment :content
    end
  end

  def self.down
    remove_attachment :notes, :content
  end
end
