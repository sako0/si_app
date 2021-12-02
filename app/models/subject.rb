class Subject < ApplicationRecord
  has_many :lectures
  belongs_to :teacher
end
