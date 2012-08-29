require 'spec_helper'

describe "utilisateurs/index" do
  before(:each) do
    assign(:utilisateurs, [
      stub_model(Utilisateur,
        :nom => "Nom",
        :mot_de_passe => "Mot De Passe"
      ),
      stub_model(Utilisateur,
        :nom => "Nom",
        :mot_de_passe => "Mot De Passe"
      )
    ])
  end

  it "renders a list of utilisateurs" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Nom".to_s, :count => 2
    assert_select "tr>td", :text => "Mot De Passe".to_s, :count => 2
  end
end
