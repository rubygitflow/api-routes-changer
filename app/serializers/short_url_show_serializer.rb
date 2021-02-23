class ShortUrlShowSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers

  attributes :token
end
