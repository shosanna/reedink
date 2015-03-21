class ProfileController < AuthenticatedController
  def index
    @books = current_user.books
    @skills = current_user.skills

    dataset = []
    7.times do |i|
      dataset << current_user.total_pages_per_day(i.days.ago)
    end

    @dataset = dataset.reverse

    days = []
    7.times do |i|
      days << i.days.ago.strftime("%A")
    end

    @days = days.reverse
  end
end
