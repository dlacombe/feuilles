class CreateUtilisateurs < ActiveRecord::Migration
  def change
    create_table :utilisateurs do |t|
      t.string :nom
      t.string :mot_de_passe

      t.timestamps
    end
  end
end
