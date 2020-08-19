class AddOfferGivenToApplication < ActiveRecord::Migration[6.0]
  def change
    add_column :applications, :offer_given, :boolean
  end
end
