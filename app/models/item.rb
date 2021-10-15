class Item < ApplicationRecord

  mount_uploader :picture, PictureUploader
  validates :name, presence: true, length: { maximum: 20 }
  validates :price, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :creation_time, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :description, length: { maximum: 200 }
  validate  :picture_size


  private
    # アップロードされた画像のサイズをバリデーションする
    def picture_size
      if picture.size > 5.megabytes
         errors.add(:picture, "should be less than 5MB")
      end
    end

end
