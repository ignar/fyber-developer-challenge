class RequestForm
  include ActiveModel::Model

  attr_accessor :uid, :pub0, :page

  validates :uid, presence: true
  validates :pub0, presence: true
  validates :page, presence: true, numericality: true
end
