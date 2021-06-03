class Rentfile < ApplicationRecord
  belongs_to :apply
  has_many_attached :photos
end
