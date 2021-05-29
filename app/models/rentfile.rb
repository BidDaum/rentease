class Rentfile < ApplicationRecord
  belongs_to :apply
  has_one_attached: :rentdoc
end
