class CreateSections < ActiveRecord::Migration[6.0]
  def change
    create_table :sections do |t|
      t.string :name
      t.references :institute, null: false, foreign_key: true

      t.timestamps
    end
  end
end
