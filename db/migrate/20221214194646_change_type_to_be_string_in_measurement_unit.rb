class ChangeTypeToBeStringInMeasurementUnit < ActiveRecord::Migration[7.0]
  def up
    change_column :foods, :measurement_unit, :string
    change_column :foods, :price, :integer, using: 'price::integer'
  end

  def down
    change_column :foods, :measurement_unit, :text
    change_column :foods, :price, :text
  end
end
