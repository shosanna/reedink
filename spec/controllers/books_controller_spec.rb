require "rails_helper"

describe BooksController do
  describe "#create" do
    it "creates a book scoped to the current user" do
      sign_in nil
      post :create

      flash[:alert].should match("You need to sign in")
      response.should redirect_to(new_user_session_path)
    end
  end
end
