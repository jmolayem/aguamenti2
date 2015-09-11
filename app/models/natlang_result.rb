class NatlangResult < ActiveRecord::Base
  belongs_to :natlang
  belongs_to :user

  def response
    JSON.parse(super || '{}')
  end

  def completed?
    !!response['predictions']
  end
end