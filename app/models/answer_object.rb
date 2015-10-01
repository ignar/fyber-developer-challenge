class AnswerObject
  include ActiveModel::Model

  attr_accessor(:status,
                :data,
                :offers,
                :raw_data,
                :sign,
                :sign_check)

  def offers
    @offers ||= begin
                  if data.has_key?('offers')
                    data['offers'].map { |offer| Offer.new(offer) }
                  else
                    []
                  end
                end
  end

  def ok?
    data['code'] == 'ok'
  end

  def valid_sign?
    sign == sign_check
  end

  def message
    data['message']
  end

  def offers_count
    offers.count
  end

  def pages
    data['pages']
  end

  def data
    @data ||= ActiveSupport::JSON.decode raw_data
  end
end
