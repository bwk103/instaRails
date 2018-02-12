class Post < ApplicationRecord

  validates :caption, length: { maximum: 2200 }
end
