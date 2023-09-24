class CreatePrototypes < ActiveRecord::Migration[7.0]
  def change
    create_table :prototypes do |t|

      t.string      :title       ,null: false                       # プロトタイプの名称(必須)
      t.text        :catch_copy  ,null: false                       # キャッチコピー(必須)
      t.text        :concept     ,null: false                       # コンセプト(必須)
      t.references  :user        ,null: false   ,foreign_key: true  # userを外部キーとして(必須)
                                                                    # プロトタイプの画像1枚(必須)(ActiveStorageを用いて実装)
      t.timestamps
    end
  end
end
