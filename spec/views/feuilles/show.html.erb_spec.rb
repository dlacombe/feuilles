require 'spec_helper'

describe "feuilles/show" do
  before(:each) do
    @feuille = assign(:feuille, stub_model(Feuille,
      :client_id => "Client",
      :travail_effectuer => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Client/)
    rendered.should match(/MyText/)
  end
end
