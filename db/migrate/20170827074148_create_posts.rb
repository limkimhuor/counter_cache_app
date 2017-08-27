class CreatePosts < ActiveRecord::Migration[5.0]
  def change
    create_table :posts do |t|
      t.string :title
      t.text :description
      t.integer :votes_count, null: false, default: 0
      t.integer :vote_points, null: false, default: 0
      t.references :user, foreign_key: true, index: true

      t.timestamps
    end
  end
end
