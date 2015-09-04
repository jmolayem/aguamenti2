class Result < ActiveRecord::Base
  include ManaPotion::Pool
  LIMIT = 1
  PERIOD = 1.day

  belongs_to :user
  belongs_to :model

  mana_pool_for :user, limit: LIMIT, period: PERIOD

  def values
  	return [] unless body["Results"]
    body["Results"]["output1"]["value"]["Values"][0]
  end

  def body
    JSON.parse(super || '{}')
  end

end