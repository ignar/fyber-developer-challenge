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
    # I leave it here becuase: > 4. Note:design for only having one app/appID.
    @locale = :de
    @timestamp = DateTime.now.to_i
    @appid = 157
    @device_id = '2b6f0cc904d137be2e1730235f5664094b83'
    @ip = '109.235.143.113'
    @offer_types = 112

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
