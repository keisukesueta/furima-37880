class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|

      t.references :user,               null: false, foreign_key: true
      t.string     :name,               null: false
      t.text       :description,        null: false
      t.integer    :category_id,        null: false
      t.integer    :status_id,          null: false
      t.integer    :shippingcost_id,    null: false
      t.integer    :shippingaddress_id, null: false
      t.integer    :shippingdays_id,    null: false
      t.string     :price,              null: false


      t.timestamps
    end
  end
end
