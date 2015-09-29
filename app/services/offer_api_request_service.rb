class OfferApiRequestService
  attr_reader :request_object

  ENDPOINT = 'http://api.fyber.com/feed/v1/offers.json'.freeze
  APPID = 157
  FORMAT = :json
  DEVICE_ID = '2b6f0cc904d137be2e1730235f5664094b83'.freeze
  LOCALE = :de
  IP = '109.235.143.113'.freeze
  OFFER_TYPES = 112
  API_KEY = 'b07a12df7d52e6c118e5d47d3f9e60135b109a1f'.freeze

  def initialize(request_object)
    @request_object = request_object
  end

  def call
    make_request
  end

  private

  def make_request
    connection = Faraday.new ENDPOINT

    response = connection.get do |req|
      req.params['appid'] = request_object.appid
      req.params['device_id'] = request_object.device_id
      req.params['locale'] = request_object.locale
      req.params['ip'] = request_object.ip
      req.params['offer_types'] = request_object.offer_types

      req.params['uid'] = request_object.uid
      req.params['pub0'] = request_object.pub0
      req.params['page'] = request_object.page
    end

    response.body
  end
end
