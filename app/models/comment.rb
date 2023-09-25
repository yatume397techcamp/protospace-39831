class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :prototype

  validates :content, presence: true   # コンセプトの名称(必須)
  validates :prototype, presence: true # prototypeカラムのバリデーション
  validates :user, presence: true      # userカラムのバリデーション

end
