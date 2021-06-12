class Rentfile < ApplicationRecord
  belongs_to :apply
  has_many_attached :photos
  validates :photos, presence: true

  after_create :update_tags

  MANDATORY_RENTFILES = ["Carte d'identité", "Bulletins de salaire", "Justificatif de domicile"].freeze
  OPTIONAL_RENTFILES = ["Attestation d’employeur", "Dernier avis d’imposition", "Photocopie de la taxe foncière", "R.I.B."].freeze
  ALL_RENTFILES = MANDATORY_RENTFILES + OPTIONAL_RENTFILES

  def update_tags
    UpdateImageTagsJob.perform_later(self)
  end
end
