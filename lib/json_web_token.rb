require 'jwt'

class JsonWebToken
  ALGORITHM = 'HS256'.freeze
  EXPIRATION = 5.minutes.freeze

  def self.encode(payload)
    payload[:expiration] = EXPIRATION
    JWT.encode(payload, Rails.application.secrets.secret_key_base, ALGORITHM)
  end

  def self.decode(token)
    JWT.decode(token,
               Rails.application.secrets.secret_key_base,
               true,
               algorithm: ALGORITHM).first
  end
end
