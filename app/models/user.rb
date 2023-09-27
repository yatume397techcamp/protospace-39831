#user.rb
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true       # ユーザー名(必須)
  validates :profile, presence: true    # プロフィール(必須)
  validates :occupation, presence: true # 所属(必須)
  validates :position, presence: true   # 役職(必須)

  has_many :prototypes
  has_many :comments

  has_one_attached :image

end