require 'rails_helper'

RSpec.describe Doc, type: :model do
  it "uses match_array to match a scope" do
    docs=Doc.all
    expect(Doc.all).to match_array(docs)
  end

  it "check if a user created" do
    user = User.create(:email => "a@b.c", :password => "password")
    doc = Doc.create(:title => "title", :content => "content", :user_id => user.id)

    expect(Doc.last).to eq(doc)
  end
end
