require 'rails_helper'

RSpec.describe "study_rooms/index", :type => :view do
  before(:each) do
    assign(:study_rooms, [
      StudyRoom.create!(
        :building => nil,
        :rm_type => "Rm Type",
        :rm_number => 1,
        :floor => 2
      ),
      StudyRoom.create!(
        :building => nil,
        :rm_type => "Rm Type",
        :rm_number => 1,
        :floor => 2
      )
    ])
  end

  it "renders a list of study_rooms" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "Rm Type".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
  end
end
