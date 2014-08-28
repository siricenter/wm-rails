require 'rails_helper'

RSpec.describe "study_rooms/show", :type => :view do
  before(:each) do
    @study_room = assign(:study_room, StudyRoom.create!(
      :building => nil,
      :rm_type => "Rm Type",
      :rm_number => 1,
      :floor => 2
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(/Rm Type/)
    expect(rendered).to match(/1/)
    expect(rendered).to match(/2/)
  end
end
