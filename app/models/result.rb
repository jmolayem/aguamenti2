class Result < ActiveRecord::Base
  belongs_to :user
  belongs_to :model

  def employee_id
    formatted_result[0]
  end

  def project
    formatted_result[1]
  end

  def hours
    formatted_result[2]
  end

  def body
    JSON.parse super
  end

  private

    def formatted_result
      body["Results"]["output1"]["value"]["Values"][0]
    end
end
