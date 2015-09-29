class RequestObject
  include ActiveModel::Model

  attr_accessor(:appid,
                :device_id,
                :locale,
                :ip,
                :offer_types,
                :uid,
                :page,
                :pub0,
                :ps_time,
                :timestamp)

  def initialize(*args)
    @locale = :de
    @timestamp = DateTime.now.to_i

    super
  end

  def to_h
    h = {
      appid: appid,
      device_id: device_id,
      locale: locale,
      ip: ip,
      offer_types: offer_types,
      uid: uid,
      page: page,
      pub0: pub0,
      ps_time: ps_time,
      timestamp: timestamp
    }
    h.delete_if { |k, v| v.blank? }
  end
end
