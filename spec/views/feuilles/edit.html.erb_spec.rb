require 'spec_helper'

describe "feuilles/edit" do
  before(:each) do
    @feuille = assign(:feuille, stub_model(Feuille,
      :client_id => "MyString",
      :travail_effectuer => "MyText"
    ))
  end

  it "renders the edit feuille form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => feuilles_path(@feuille), :method => "post" do
      assert_select "input#feuille_client_id", :name => "feuille[client_id]"
      assert_select "textarea#feuille_travail_effectuer", :name => "feuille[travail_effectuer]"
    end
  end
end
