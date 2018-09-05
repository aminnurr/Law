class Case < ApplicationRecord
	 #extend FriendlyId
	#friendly_id :name, use: :slugged
	validates :title, uniqueness: true
	validates :content, uniqueness: true

	self.per_page = 15


	extend FriendlyId
	friendly_id :slug_candidates, use: :slugged


	def slug_candidates
      [
        :title,
        [:title, :created_at]
      ]
    end

end
