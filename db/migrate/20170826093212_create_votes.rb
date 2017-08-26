class CreateVotes < ActiveRecord::Migration[5.0]
  def change
    create_table :votes do |t|
      t.integer :point, default: 1
      t.references :post, foreign_key: true, index: true

      t.timestamps
    end
  end
end
