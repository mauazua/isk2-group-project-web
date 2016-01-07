class CreateAdmins < ActiveRecord::Migration
  def change
    create_table :admins do |t|
      t.string :authentication_token, index: true
    end
  end
end
