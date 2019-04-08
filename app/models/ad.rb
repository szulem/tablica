class Ad < ApplicationRecord
	belongs_to :user

  has_attached_file :picture, styles: { medium: "250x200>" }, default_url: "https://dummyimage.com/250x200/f4f4f4/000000.png"
  validates_attachment_content_type :picture, content_type: /\Aimage\/.*\z/
end
