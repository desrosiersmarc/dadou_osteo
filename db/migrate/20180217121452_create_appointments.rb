class CreateAppointments < ActiveRecord::Migration[5.1]
  def change
    create_table :appointments do |t|
      t.datetime :start_date
      t.datetime :end_date
      t.string :review
      t.integer :rate
      t.references :user, foreign_key: true
      t.references :appointment_type, foreign_key: true

      t.timestamps
    end
  end
end
