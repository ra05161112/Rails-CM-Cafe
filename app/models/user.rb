class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name , length: { minimum: 2 , maximum: 20, message: "は2文字以上20文字以下で設定してください"}
  validates :age, numericality: { only_integer: true, greater_than_or_equal_to: 18, message: "17歳以下の方のご利用は出来ません" }
  # validates :password, presence:  true , length: { minimum: 6, message:"パスワードは６文字以上で設定してください" }
  has_many :votes, dependent: :destroy  

  enum sex: { 男性: 0, 女性: 1, 選択しない: 3}
end
