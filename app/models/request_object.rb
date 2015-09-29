class RequestObject
  include ActiveModel::Model

  attr_accessor(:endpoint,
                :appid,
                :format,
                :device_id,
                :locale,
                :ip,
                :offer_types,
                :api_key,
                :uid,
                :page,
                :pub0)

  def initialize(*args)
    @format = :json
    @locale = :de

    super
  end
end
