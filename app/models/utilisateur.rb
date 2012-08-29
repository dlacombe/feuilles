class Utilisateur < ActiveRecord::Base
  attr_accessible :mot_de_passe, :nom
end
