require 'spec_helper'

describe "gls/edit" do
  before(:each) do
    @gl = assign(:gl, stub_model(Gl,
      :type => "",
      :nom => "MyText",
      :no_gl => 1,
      :debit => 1.5,
      :credit => 1.5
    ))
  end

  it "renders the edit gl form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => gls_path(@gl), :method => "post" do
      assert_select "input#gl_type", :name => "gl[type]"
      assert_select "textarea#gl_nom", :name => "gl[nom]"
      assert_select "input#gl_no_gl", :name => "gl[no_gl]"
      assert_select "input#gl_debit", :name => "gl[debit]"
      assert_select "input#gl_credit", :name => "gl[credit]"
    end
  end
end
