class Topic < ApplicationRecord
  belongs_to :course

  has_many :notes

  validates :name, presence: true
end
