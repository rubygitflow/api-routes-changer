class Url < ApplicationRecord

  def short_url
    DOMEN_NAME + token
  end

  def full_url
    DOMEN_NAME + long_url
  end



  def self.random_token(length = 8)
    rand(32**length).to_s(32)
  end
end
