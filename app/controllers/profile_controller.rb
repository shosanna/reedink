class ProfileController < AuthenticatedController
  def index
    @books = current_user.books
    @skills = current_user.skills
  end
end
