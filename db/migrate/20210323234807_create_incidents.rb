class CreateIncidents < ActiveRecord::Migration[6.0]
  def change
    create_table :incidents do |t|
      t.boolean :symptomatic
      t.boolean :covid_positive
      t.boolean :covid_negative
      t.references :user
      t.references :place

      t.timestamps
    end
  end
end
