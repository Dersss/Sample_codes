class CreateApplications < ActiveRecord::Migration[6.0]
  def change
    create_table :applications do |t|
      t.string :name
      t.string :email
      t.string :description
      t.string :justifications
      t.string :code
      t.string :additional_links

      t.timestamps
    end
  end
end
