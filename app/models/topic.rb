class Topic < ApplicationRecord
  belongs_to :course

  has_many :notes
end
