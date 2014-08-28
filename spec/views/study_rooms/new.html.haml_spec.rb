require 'rails_helper'

RSpec.describe "study_rooms/new", :type => :view do
  before(:each) do
    assign(:study_room, StudyRoom.new(
      :building => nil,
      :rm_type => "MyString",
      :rm_number => 1,
      :floor => 1
    ))
  end

  it "renders new study_room form" do
    render

    assert_select "form[action=?][method=?]", study_rooms_path, "post" do

      assert_select "input#study_room_building_id[name=?]", "study_room[building_id]"

      assert_select "input#study_room_rm_type[name=?]", "study_room[rm_type]"

      assert_select "input#study_room_rm_number[name=?]", "study_room[rm_number]"

      assert_select "input#study_room_floor[name=?]", "study_room[floor]"
    end
  end
end
