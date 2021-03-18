class User < ApplicationRecord
	validates :name, :birth_date, :gender, :image_url, presence: true
end
