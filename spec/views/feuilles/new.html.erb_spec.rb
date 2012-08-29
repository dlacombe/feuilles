require 'spec_helper'

describe "feuilles/new" do
  before(:each) do
    assign(:feuille, stub_model(Feuille,
      :client_id => "MyString",
      :travail_effectuer => "MyText"
    ).as_new_record)
  end

  it "renders new feuille form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => feuilles_path, :method => "post" do
      assert_select "input#feuille_client_id", :name => "feuille[client_id]"
      assert_select "textarea#feuille_travail_effectuer", :name => "feuille[travail_effectuer]"
    end
  end
end
