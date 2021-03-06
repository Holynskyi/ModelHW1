class Product < ActiveRecord::Base
	#has_one :gallery
	has_attached_file :image, styles: { medium: "500x500>", thumb: "100x100#" }, default_url: "/images/:style/missing.png"
  	validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
	belongs_to :cart
	validates :name, presence: true
	validates :price, numericality: {greater_than: 0}

	#is_impressionable :counter_cache => true

end