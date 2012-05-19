class CreatePharmacies < ActiveRecord::Migration
  def change
    create_table :pharmacies do |t|
      t.string :name
      t.integer :company_id

      t.timestamps
    end
  end
end
