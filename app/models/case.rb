class Case < ApplicationRecord
	 #extend FriendlyId
	#friendly_id :name, use: :slugged
	validates :title, uniqueness: true
	validates :content, uniqueness: true

end
