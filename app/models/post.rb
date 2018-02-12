class Post < ApplicationRecord

  validates :caption, length: { maximum: 2200 }
  mount_uploader :picture, PictureUploader
end
