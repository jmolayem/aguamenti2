class Result < ActiveRecord::Base
  belongs_to :user
  belongs_to :model

  def values
    body["Results"]["output1"]["value"]["Values"][0]
  end

  def body
    JSON.parse super
  end

end
