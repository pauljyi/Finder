
require_relative '../rails_helper'

RSpec.describe Tag, type: :model do
  it "has a name" do
    aTag = Tag.new
    aTag.name = 'myTag'
    expect(aTag.name).to eq('myTag')
  end
end
