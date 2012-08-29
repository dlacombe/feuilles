require 'spec_helper'

describe "clients/edit" do
  before(:each) do
    @client = assign(:client, stub_model(Client,
      :code => "MyString",
      :nom => "MyString",
      :adresse => "MyString",
      :ville => "MyString",
      :province => "MyString",
      :pays => "MyString"
    ))
  end

  it "renders the edit client form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => clients_path(@client), :method => "post" do
      assert_select "input#client_code", :name => "client[code]"
      assert_select "input#client_nom", :name => "client[nom]"
      assert_select "input#client_adresse", :name => "client[adresse]"
      assert_select "input#client_ville", :name => "client[ville]"
      assert_select "input#client_province", :name => "client[province]"
      assert_select "input#client_pays", :name => "client[pays]"
    end
  end
end
