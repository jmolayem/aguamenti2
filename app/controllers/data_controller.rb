class DataController < ApplicationController
  def index
    data = %w(first_word second_word third_word fourth_word final)
    render json: data.grep(/#{params[:q]}/)
  end
end