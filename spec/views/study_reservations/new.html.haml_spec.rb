require 'rails_helper'

RSpec.describe "study_reservations/new", :type => :view do
  before(:each) do
    assign(:study_reservation, StudyReservation.new(
      :study_room => nil,
      :name => "MyString"
    ))
  end

  it "renders new study_reservation form" do
    render

    assert_select "form[action=?][method=?]", study_reservations_path, "post" do

      assert_select "input#study_reservation_study_room_id[name=?]", "study_reservation[study_room_id]"

      assert_select "input#study_reservation_name[name=?]", "study_reservation[name]"
    end
  end
end
