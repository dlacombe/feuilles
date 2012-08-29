require 'spec_helper'

describe "gls/show" do
  before(:each) do
    @gl = assign(:gl, stub_model(Gl,
      :type => "Type",
      :nom => "MyText",
      :no_gl => 1,
      :debit => 1.5,
      :credit => 1.5
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Type/)
    rendered.should match(/MyText/)
    rendered.should match(/1/)
    rendered.should match(/1.5/)
    rendered.should match(/1.5/)
  end
end
