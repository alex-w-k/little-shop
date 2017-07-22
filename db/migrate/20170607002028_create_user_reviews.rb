class CreateUserReviews < ActiveRecord::Migration[5.1]
  def change
    create_table :user_reviews do |t|
      t.integer :user_id
      t.integer :review_id

      t.timestamps
    end
  end
end
