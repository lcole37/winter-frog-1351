class CreateCustomerItems < ActiveRecord::Migration[5.2]
  def change
    create_table :customer_items do |t|
      t.references :plot, foreign_key: true
      t.references :plant, foreign_key: true
    end
  end
end
