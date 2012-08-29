require 'spec_helper'

describe "clients/index" do
  before(:each) do
    assign(:clients, [
      stub_model(Client,
        :code => "Code",
        :nom => "Nom",
        :adresse => "Adresse",
        :ville => "Ville",
        :province => "Province",
        :pays => "Pays"
      ),
      stub_model(Client,
        :code => "Code",
        :nom => "Nom",
        :adresse => "Adresse",
        :ville => "Ville",
        :province => "Province",
        :pays => "Pays"
      )
    ])
  end

  it "renders a list of clients" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Code".to_s, :count => 2
    assert_select "tr>td", :text => "Nom".to_s, :count => 2
    assert_select "tr>td", :text => "Adresse".to_s, :count => 2
    assert_select "tr>td", :text => "Ville".to_s, :count => 2
    assert_select "tr>td", :text => "Province".to_s, :count => 2
    assert_select "tr>td", :text => "Pays".to_s, :count => 2
  end
end
