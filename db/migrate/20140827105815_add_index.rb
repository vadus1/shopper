class AddIndex < ActiveRecord::Migration
  def change
    add_index :addresses, :user_id
    add_index :addresses, :country_id
    add_index :cities, :country_id
    add_index :countries, :shipping_rate_id
    add_index :items, :product_id
    add_index :items, :order_id
    add_index :orders, :address_id
    add_index :products, :category_id
  end
end
