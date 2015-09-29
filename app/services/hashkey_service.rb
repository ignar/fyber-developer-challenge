require 'digest/sha1'

class HashkeyService
  attr_reader :hash

  def initialize(request_object)
    @hash = request_object.to_h
  end

  def create_hashkey
    sorted_hash = sort_hash

    encoded_data = URI.encode_www_form(sorted_hash)
    encoded_data = "#{encoded_data}&#{Rails.application.secrets.api_key}"

    Digest::SHA1.hexdigest encoded_data
  end

  private

  def sort_hash
    sorted_array_with_params = @hash.sort
    Hash[sorted_array_with_params]
  end
end
