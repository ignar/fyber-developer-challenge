class OfferApiRequestService
  attr_reader :request_object

  ENDPOINT = 'http://api.fyber.com/feed/v1/offers.json'.freeze

  def initialize(request_object)
    @request_object = request_object
  end

  def call
    connection = Faraday.new ENDPOINT

    service = HashkeyService.new(Rails.application.secrets.api_key)

    response = connection.get do |req|
      req.params['appid'] = request_object.appid
      req.params['device_id'] = request_object.device_id
      req.params['locale'] = request_object.locale
      req.params['ip'] = request_object.ip
      req.params['offer_types'] = request_object.offer_types

      req.params['page'] = request_object.page
      req.params['pub0'] = request_object.pub0
      req.params['uid'] = request_object.uid
      req.params['timestamp'] = request_object.timestamp

      req.params['hashkey'] = service.create_hashkey_for_request(request_object)
    end

    AnswerObject.new(status: response.status,
                     raw_data: response.body,
                     sign: response.headers['x-sponsorpay-response-signature'],
                     sign_check: service.create_haskey_for_answer(response.body))
  end
end
