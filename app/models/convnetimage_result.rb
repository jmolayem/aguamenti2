class ConvnetimageResult < ActiveRecord::Base
  include ManaPotion::Pool
  LIMIT = 10
  PERIOD = 10.day
  belongs_to :convnetimage
  belongs_to :user

  mana_pool_for :user, limit: LIMIT, period: PERIOD

  has_attached_file :image, :styles => { :medium => "200x>", :thumb => "100x100>" }, :default_url => "cmon.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
  validates :convnetimage, :image, :user, presence: true

  def completed?
    !!response['predictions']
  end

  def predictions
    response['predictions'].to_a.map do |prediction|
      ConvnetimagePrediction.new(prediction)
    end
  end

  def response
    JSON.parse(super || '{}')
  end
end
