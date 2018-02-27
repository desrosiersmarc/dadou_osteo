class CreateAppointmentTypes < ActiveRecord::Migration[5.1]
  def change
    create_table :appointment_types do |t|
      t.string :name
      t.time :duration
      t.float :price
      t.boolean :bookable

      t.timestamps
    end
  end
end
