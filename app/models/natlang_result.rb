class NatlangResult < ActiveRecord::Base
	include ManaPotion::Pool
  LIMIT = 10
  PERIOD = 1.day

  mana_pool_for :user, limit: LIMIT, period: PERIOD
  belongs_to :natlang
  belongs_to :user

  def response
    JSON.parse(super || '{}')
  end

  def completed?
    !!response['predictions']
  end
end