class AddIndexToQuestions < ActiveRecord::Migration[7.0]
  def change
    add_index :questions, :title
    add_index :questions, :body
  end
end
