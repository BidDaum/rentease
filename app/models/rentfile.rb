class Rentfile < ApplicationRecord
  belongs_to :apply
  has_many_attached :photos

  MANDATORY_RENTFILES = ["Carte d'identité", "Bulletins de salaire", "Justificatif de domicile"].freeze
  OPTIONAL_RENTFILES = ["Attestation d’employeur", "Dernier avis d’imposition", "Photocopie de la taxe foncière", "R.I.B."].freeze
end
