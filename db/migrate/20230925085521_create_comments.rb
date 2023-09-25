class CreateComments < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      t.text        :content     ,null: false                       # コンセプト(必須)
      t.references  :prototype   ,null: false   ,foreign_key: true  # prototypeを外部キーとして(必須)
      t.references  :user        ,null: false   ,foreign_key: true  # userを外部キーとして(必須)
      t.timestamps
    end
  end
end
