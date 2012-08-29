require 'spec_helper'

describe "utilisateurs/show" do
  before(:each) do
    @utilisateur = assign(:utilisateur, stub_model(Utilisateur,
      :nom => "Nom",
      :mot_de_passe => "Mot De Passe"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Nom/)
    rendered.should match(/Mot De Passe/)
  end
end
