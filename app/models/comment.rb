#comment.rb
class Comment < ApplicationRecord





  validates :content, presence: true   # コンセプトの名称(必須)
  # validates :prototype, presence: true # prototypeカラムのバリデーション
  # validates :user, presence: true      # userカラムのバリデーション


  belongs_to :user
  belongs_to :prototype



end