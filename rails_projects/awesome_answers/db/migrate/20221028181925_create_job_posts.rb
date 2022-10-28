class CreateJobPosts < ActiveRecord::Migration[7.0]
  def change
    create_table :job_posts do |t|
      t.string :title
      t.text :description
      t.integer :min_salary
      t.integer :max_salary
      t.string :company_name
      t.string :location
      t.timestamps
    end
  end
end
