class ResultsController < ApplicationController
  def index
    @results = current_user.results
  end
end
