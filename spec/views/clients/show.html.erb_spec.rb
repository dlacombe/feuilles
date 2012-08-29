require 'spec_helper'

describe "clients/show" do
  before(:each) do
    @client = assign(:client, stub_model(Client,
      :code => "Code",
      :nom => "Nom",
      :adresse => "Adresse",
      :ville => "Ville",
      :province => "Province",
      :pays => "Pays"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Code/)
    rendered.should match(/Nom/)
    rendered.should match(/Adresse/)
    rendered.should match(/Ville/)
    rendered.should match(/Province/)
    rendered.should match(/Pays/)
  end
end
