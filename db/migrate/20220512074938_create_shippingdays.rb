class CreateShippingdays < ActiveRecord::Migration[6.0]
  def change
    create_table :shippingdays do |t|

      t.timestamps
    end
  end
end
