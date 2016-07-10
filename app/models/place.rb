class Place < ActiveRecord::Base
	geocoded_by :address
	after_validation :geocode, if: ->(obj){ obj.address.present? && obj.address_changed? }

	scope :by_created_at, -> { order('created_at DESC') }
end
