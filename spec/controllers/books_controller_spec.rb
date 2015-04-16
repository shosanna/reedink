require "rails_helper"

describe BooksController do
  describe "#create" do
    it "requires the user to sign in" do
      sign_in nil
      post :create

      flash[:alert].should match("You need to sign in")
      response.should redirect_to(new_user_session_path)
    end
  end
end
