class CreatePostReviews < ActiveRecord::Migration[7.0]
  def change
    create_table :post_reviews do |t|
      t.references :post, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.integer :score, null: false

      t.timestamps
    end
  end
end
