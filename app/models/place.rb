class Place < ActiveRecord::Base

	attr_accessor :raw_address

	geocoded_by :raw_address
	after_validation ->{
		self.raw_address = self.address
		geocode
	}, if: ->(obj){ obj.raw_address.present? && obj.raw_address != obj.address }
	# geocoded_by :address
	# after_validation :geocode, if: ->(obj){ obj.address.present? && obj.address_changed? }

	reverse_geocoded_by :latitude, :longitude
	after_validation :reverse_geocode, unless: ->(obj){ obj.address.present? }, 
																		if: ->(obj){  obj.latitude.present? && obj.latitude_changed? && obj.longitude.present? && obj.longitude_changed? }

	scope :by_created_at, -> { order('created_at DESC') }
end
