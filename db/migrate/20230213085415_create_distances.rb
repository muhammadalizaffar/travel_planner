class CreateDistances < ActiveRecord::Migration[6.1]
  def change
    create_table :distances do |t|
      t.string :category
      t.string :latitude
      t.string :longitude
      t.string :address

      t.timestamps
    end
  end
end
