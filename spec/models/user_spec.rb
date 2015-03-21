require 'rails_helper'

RSpec.describe User, type: :model do
  it 'counts users total read pages for a given day' do
    user = FactoryGirl.create(:user)
    book = FactoryGirl.create(:book)
    status = FactoryGirl.create(:reading_status, book: book, user: user)
    progress = FactoryGirl.create(:progress, reading_status: status, page_to: 50, page_from: 20)

    expect(user.total_pages_per_day(Time.current)).to eq(30)
    expect(user.total_pages_per_day(2.days.ago)).to eq(0)
  end
end
