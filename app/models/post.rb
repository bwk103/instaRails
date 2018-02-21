class Post < ApplicationRecord

  acts_as_votable

  belongs_to :user
  has_many :comments, dependent: :destroy
  validates :caption, length: { maximum: 2200 }
  default_scope -> { order(created_at: :desc) }
  validates :picture, presence: true
  validates :location, length: { maximum: 100 }
  mount_uploader :picture, PictureUploader

  private

  def picture_size
    if picture.size > 5.megabytes
      errors.add(:picture, "should be less than 5MB")
    end
  end

end
