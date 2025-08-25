class Treatment < ApplicationRecord

	default_scope { order(id: :asc) }

	has_one_attached :image, dependent: :purge

  # Validations
  validates_presence_of :name
  validates_presence_of :description
	# validates :image, attached: true

	def should_generate_new_friendly_id?
		self.name_changed?
	end

end
