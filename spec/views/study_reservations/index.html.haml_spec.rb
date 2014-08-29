require 'rails_helper'

RSpec.describe "study_reservations/index", :type => :view do
  before(:each) do
    assign(:study_reservations, [
      StudyReservation.create!(
        :study_room => nil,
        :name => "Name"
      ),
      StudyReservation.create!(
        :study_room => nil,
        :name => "Name"
      )
    ])
  end

  it "renders a list of study_reservations" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "Name".to_s, :count => 2
  end
end
