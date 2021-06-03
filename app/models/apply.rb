class Apply < ApplicationRecord
  belongs_to :user
  has_many :rentfiles
end
