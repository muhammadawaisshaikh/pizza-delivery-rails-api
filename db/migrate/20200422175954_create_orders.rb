class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.string :name
      t.text :email
      t.bigint :mobile
      t.string :address
      t.string :ordered_products
      t.bigint :total

      t.timestamps
    end
  end
end
