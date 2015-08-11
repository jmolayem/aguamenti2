class DataController < ApplicationController
  def index
    render json: %w(first_word second_word third_word fourth_word final)
  end
end