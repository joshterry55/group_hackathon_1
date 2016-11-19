class CreateFeeds < ActiveRecord::Migration[5.0]
  def change
    create_table :feeds do |t|
      t.string :category
      t.belongs_to :user

      t.timestamps
    end
  end
end
