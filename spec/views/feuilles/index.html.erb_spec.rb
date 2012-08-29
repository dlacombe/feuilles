require 'spec_helper'

describe "feuilles/index" do
  before(:each) do
    assign(:feuilles, [
      stub_model(Feuille,
        :client_id => "Client",
        :travail_effectuer => "MyText"
      ),
      stub_model(Feuille,
        :client_id => "Client",
        :travail_effectuer => "MyText"
      )
    ])
  end

  it "renders a list of feuilles" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Client".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
