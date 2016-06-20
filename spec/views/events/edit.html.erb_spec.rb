require 'rails_helper'

RSpec.describe "events/edit", type: :view do
  before(:each) do
    @event = assign(:event, Event.create!(
      :title => "MyString",
      :start_date => "MyDate",
      :end_date => "MyDate",
      :location => "MyString",
      :user => nil
    ))
  end

  it "renders the edit event form" do
    render

    assert_select "form[action=?][method=?]", event_path(@event), "post" do

      assert_select "input#event_title[name=?]", "event[title]"

      assert_select "input#event_start_date[name=?]", "event[start_date]"

      assert_select "input#event_end_date[name=?]", "event[end_date]"

      assert_select "input#event_location[name=?]", "event[location]"

      assert_select "input#event_user_id[name=?]", "event[user_id]"
    end
  end
end
