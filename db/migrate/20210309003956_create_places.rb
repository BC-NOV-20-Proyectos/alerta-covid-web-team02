class CreatePlaces < ActiveRecord::Migration[6.0]
  def change
    create_table :places do |t|
      t.string :name
      t.string :area
      t.references :institute, null: false, foreign_key: true

      t.timestamps
    end
  end
end
