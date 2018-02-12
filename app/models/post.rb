class Post < ApplicationRecord

  validates :caption, length: { maximum: 2200 }
  mount_uploader :picture, PictureUploader

  private

  def picture_size
    if picture.size > 5.megabytes
      errors.add(:picture, "should be less than 5MB")
    end
  end

end
