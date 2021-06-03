class Rentfile < ApplicationRecord
  belongs_to :apply
  has_many_attached :photos

  MANDATORY_RENTFILES = ["Carte d'identité", "Contrat de travail"].freeze
end
