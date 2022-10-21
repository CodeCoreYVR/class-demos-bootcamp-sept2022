class RemoveLikeFromQuestions < ActiveRecord::Migration[7.0]
  def change
    remove_column :questions, :like
  end
end
