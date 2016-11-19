class CreatePosts < ActiveRecord::Migration[5.0]
  def change
    create_table :posts do |t|
      t.string :title
      t.string :category
      t.string :body
      t.belongs_to :user
      t.belongs_to :feed, foriegn_key: true
      t.belongs_to :profile, foriegn_key: true

      t.timestamps
    end
  end
end
