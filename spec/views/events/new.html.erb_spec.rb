require 'rails_helper'

RSpec.describe "events/new", type: :view do
  before(:each) do
    assign(:event, Event.new(
      :title => "MyString",
      :start_date => "MyDate",
      :end_date => "MyDate",
      :location => "MyString",
      :user => nil
    ))
  end

  it "renders new event form" do
    render

    assert_select "form[action=?][method=?]", events_path, "post" do

      assert_select "input#event_title[name=?]", "event[title]"

      assert_select "input#event_start_date[name=?]", "event[start_date]"

      assert_select "input#event_end_date[name=?]", "event[end_date]"

      assert_select "input#event_location[name=?]", "event[location]"

      assert_select "input#event_user_id[name=?]", "event[user_id]"
    end
  end
end
