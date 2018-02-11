class Note < ApplicationRecord
  belongs_to :topic

  has_attached_file :content
  has_many :comments

  validates :title, presence: true
  validates_attachment :content, presence: true,
    content_type: { content_type: ["application/pdf", "image/png", "image/jpg"] }
end
