require 'rails_helper'

RSpec.describe "semesters/new", :type => :view do
  before(:each) do
    assign(:semester, Semester.new(
      :name => "MyString"
    ))
  end

  it "renders new semester form" do
    render

    assert_select "form[action=?][method=?]", semesters_path, "post" do

      assert_select "input#semester_name[name=?]", "semester[name]"
    end
  end
end
