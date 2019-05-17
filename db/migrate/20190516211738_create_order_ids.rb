class CreateOrderIds < ActiveRecord::Migration
  def change
    create_table :order_ids do |t|
      t.string :items
      t.string :email
      t.string :order

      t.timestamps null: false
    end
  end
end
