class RemovePhoneNumberFromLead < ActiveRecord::Migration[5.2]
  def change
    remove_column :leads, :phone_number
  end
end
