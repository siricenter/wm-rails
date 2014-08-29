require 'rails_helper'

RSpec.describe "study_reservations/show", :type => :view do
  before(:each) do
    @study_reservation = assign(:study_reservation, StudyReservation.create!(
      :study_room => nil,
      :name => "Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(/Name/)
  end
end
