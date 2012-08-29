require 'spec_helper'

describe "gls/index" do
  before(:each) do
    assign(:gls, [
      stub_model(Gl,
        :type => "Type",
        :nom => "MyText",
        :no_gl => 1,
        :debit => 1.5,
        :credit => 1.5
      ),
      stub_model(Gl,
        :type => "Type",
        :nom => "MyText",
        :no_gl => 1,
        :debit => 1.5,
        :credit => 1.5
      )
    ])
  end

  it "renders a list of gls" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Type".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
  end
end
