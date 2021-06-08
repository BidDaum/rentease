class Rentfile < ApplicationRecord
  belongs_to :apply
  has_many_attached :photos
  validates :photos, presence: true
  MANDATORY_RENTFILES = ["Carte d'identité", "Bulletins de salaire", "Justificatif de domicile"].freeze
  OPTIONAL_RENTFILES = ["Attestation d’employeur", "Dernier avis d’imposition", "Photocopie de la taxe foncière", "R.I.B."].freeze
  ALL_RENTFILES = MANDATORY_RENTFILES + OPTIONAL_RENTFILES
end
