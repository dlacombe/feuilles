class CreateGls < ActiveRecord::Migration
  def change
    create_table :gls do |t|
      t.date :date
      t.string :type
      t.text :nom
      t.integer :no_gl
      t.float :debit
      t.float :credit

      t.timestamps
    end
  end
end
