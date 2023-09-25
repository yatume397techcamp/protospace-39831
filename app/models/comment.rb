class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :prototype

  # validates :content, presence: true      # コンセプトの名称(必須)


end
