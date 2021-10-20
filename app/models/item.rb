class Item < ApplicationRecord

  mount_uploader :picture, PictureUploader
  validates :name, presence: true, length: { maximum: 200 }
  validates :price, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :creation_time, numericality: { greater_than_or_equal_to: 0 }
  validates :description, length: { maximum: 200 }
  validate  :picture_size

  has_many :votes , dependent: :destroy

  private
    # アップロードされた画像のサイズをバリデーションする
    def picture_size
      if picture.size > 5.megabytes
         errors.add(:picture, "should be less than 5MB")
      end
    end

end
