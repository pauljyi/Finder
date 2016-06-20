require 'rails_helper'

RSpec.describe "events/show", type: :view do
  before(:each) do
    @event = assign(:event, Event.create!(
      :title => "Title",
      :start_date => "Start Date",
      :start_date => "End Date",
      :location => "Location",
      :user => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/Start_Date/)
    expect(rendered).to match(/End_Date/)
    expect(rendered).to match(/Location/)
    expect(rendered).to match(//)
  end
end
