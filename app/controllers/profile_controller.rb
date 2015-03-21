class ProfileController < AuthenticatedController
  def index
    @books = current_user.books
    @skills = current_user.skills

    @dataset = 7.times.map { |i| current_user.total_pages_per_day(i.days.ago) }.reverse
    @days = 7.times.map { |i| i.days.ago.strftime("%A") }.reverse
  end
end
