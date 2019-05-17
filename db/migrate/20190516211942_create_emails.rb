class CreateEmails < ActiveRecord::Migration
  def change
    create_table :emails do |t|
      t.string :orderId
      t.string :items
      t.string :email
      t.string :order

      t.timestamps null: false
    end
  end
end
