require "rails_helper"

describe BooksController do
  describe "#create" do
    it "requires the user to sign in" do
      sign_in nil
      post :create

      flash[:alert].should match("You need to sign in")
      response.should redirect_to(new_user_session_path)
    end

    it "creates a book with the given user as its owner" do
      user = create(:user)
      sign_in user

      post :create, book: { title: "foobar", author: "foo", page_count: 10 }

      book = Book.first
      book.title.should == "foobar"
      book.user.should == user
    end
  end
end
