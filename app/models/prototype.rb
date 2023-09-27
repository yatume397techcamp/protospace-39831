class Prototype < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy # Prototypeテーブルのレコードが削除された場合commentsテーブルも一緒に削除

  has_one_attached :image

  validates :title, presence: true      # プロトタイプの名称(必須)
  validates :catch_copy, presence: true # キャッチコピー(必須)
  validates :concept, presence: true    # コンセプト(必須)
  validates :image, presence: true      # imageカラムのバリデーション
  
  # validates :content, presence: true, unless: :was_attached?

  # def was_attached?
  #   self.image.attached?
  # end
  
end