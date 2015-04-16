class ChallengesController < ApplicationController
  def index
    @data = User.challenge_data
  end
end
