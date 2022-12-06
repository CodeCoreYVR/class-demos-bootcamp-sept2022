class CreateGifts < ActiveRecord::Migration[7.0]
  def change
    create_table :gifts do |t|
      t.integer :sender_id
      t.integer :receiver_id
      t.integer :amount
      t.string :status
      t.string :payment_id
      t.references :answer, null: false, foreign_key: true

      t.timestamps
    end
  end
end
