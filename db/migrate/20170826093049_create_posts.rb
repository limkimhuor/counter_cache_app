class CreatePosts < ActiveRecord::Migration[5.0]
  def change
    create_table :posts do |t|
      t.string :title
      t.text :description
      t.integer :votes_count, default: 0
      t.integer :vote_points, default: 0

      t.timestamps
    end
  end
end
