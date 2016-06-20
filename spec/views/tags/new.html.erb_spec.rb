require 'rails_helper'

RSpec.describe "tags/new", type: :view do
  before(:each) do
    assign(:tag, Tag.new(
      :name => "MyString",
      :event => nil
    ))
  end

  it "renders new tag form" do
    render

    assert_select "form[action=?][method=?]", tags_path, "post" do

      assert_select "input#tag_name[name=?]", "tag[name]"

      assert_select "input#tag_event_id[name=?]", "tag[event_id]"
    end
  end
end
