class CreateIncidents < ActiveRecord::Migration[6.0]
  def change
    create_table :incidents do |t|
      t.boolean :symptomatic
      t.boolean :covid_postive
      t.boolean :covid_negative
      t.references :users, null: false, foreign_key: true
      t.references :places, null: false, foreign_key: true

      t.timestamps
    end
  end
end
