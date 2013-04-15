class CreateCertificates < ActiveRecord::Migration
  def change
    create_table :certificates do |t|
      t.string :name
      t.datetime :expiration_date
      t.integer :user_id

      t.timestamps
    end
  end
end
