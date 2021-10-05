class RemoveReviewIdFromBooks < ActiveRecord::Migration[6.1]
  def change
    remove_column :books, :review_id, :integer
  end
end
