class Doctor < ApplicationRecord

	extend FriendlyId
  friendly_id :full_name, use: :slugged

	default_scope { order(id: :asc) }

	validates_presence_of :full_name, :profesional_name, :email, :phone
	validates_uniqueness_of :email, :full_name
	validates :photo, content_type: ['image/png', 'image/jpeg']

	has_many :specialities
  has_many :specialists, :through => :specialities
	has_many :appointments
	has_many :schedules, dependent: :destroy

	has_one_attached :photo, dependent: :purge
  has_rich_text :content

	def operational_hours_label
		strLabel = ""
		self.schedules.each do |s|
			strLabel += "#{s.day_name}: #{s.start_time} - #{s.end_time}<br/>"
		end

		return strLabel
	end

	def should_generate_new_friendly_id?
		self.full_name_changed?
	end

	def find_other_doctors(_limit)
		Doctor.where.not(id: self.id).limit(_limit)
	end

	def profesional_name_with_title
		"#{self.profesional_name} (#{self.title})"
	end

end
