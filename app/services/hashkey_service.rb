require 'digest/sha1'

class HashkeyService
  def initialize(api_key)
    @api_key = api_key
  end

  def create_hashkey_for_request(request_object)
    sorted_hash = sort_hash(request_object.to_h)

    encoded_data = URI.encode_www_form(sorted_hash)
    make_sign(encoded_data)
  end

  def create_haskey_for_answer(answer)
    make_sign(answer, '')
  end

  private

  def make_sign(string, delimeter = '&')
    Digest::SHA1.hexdigest "#{string}#{delimeter}#{@api_key}"
  end

  def sort_hash(hash)
    sorted_array_with_params = hash.sort
    Hash[sorted_array_with_params]
  end
end
