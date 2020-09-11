class CreateDoctors < ActiveRecord::Migration[6.0]
  def change
    create_table :doctors do |t|
      t.string :doctor_name
      t.string :doctor_type

      t.timestamps
    end
  end
end
