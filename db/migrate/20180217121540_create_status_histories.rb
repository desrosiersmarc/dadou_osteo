class CreateStatusHistories < ActiveRecord::Migration[5.1]
  def change
    create_table :status_histories do |t|
      t.datetime :date
      t.references :status_type, foreign_key: true
      t.references :appointment, foreign_key: true

      t.timestamps
    end
  end
end
