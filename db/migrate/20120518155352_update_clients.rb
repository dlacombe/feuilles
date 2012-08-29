class UpdateClients < ActiveRecord::Migration
  def change
    change_table :clients do |t|
      t.string :code_postal
      t.string :telephone
      t.string :email
    end
  end
end
