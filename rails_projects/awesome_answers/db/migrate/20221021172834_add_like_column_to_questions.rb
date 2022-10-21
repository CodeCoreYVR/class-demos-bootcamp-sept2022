class AddLikeColumnToQuestions < ActiveRecord::Migration[7.0]
  def change
    add_column :questions, :like, :integer
  end
end
