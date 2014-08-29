require 'rails_helper'

RSpec.describe "study_reservations/edit", :type => :view do
  before(:each) do
    @study_reservation = assign(:study_reservation, StudyReservation.create!(
      :study_room => nil,
      :name => "MyString"
    ))
  end

  it "renders the edit study_reservation form" do
    render

    assert_select "form[action=?][method=?]", study_reservation_path(@study_reservation), "post" do

      assert_select "input#study_reservation_study_room_id[name=?]", "study_reservation[study_room_id]"

      assert_select "input#study_reservation_name[name=?]", "study_reservation[name]"
    end
  end
end
