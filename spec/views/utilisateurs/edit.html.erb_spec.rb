require 'spec_helper'

describe "utilisateurs/edit" do
  before(:each) do
    @utilisateur = assign(:utilisateur, stub_model(Utilisateur,
      :nom => "MyString",
      :mot_de_passe => "MyString"
    ))
  end

  it "renders the edit utilisateur form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => utilisateurs_path(@utilisateur), :method => "post" do
      assert_select "input#utilisateur_nom", :name => "utilisateur[nom]"
      assert_select "input#utilisateur_mot_de_passe", :name => "utilisateur[mot_de_passe]"
    end
  end
end
