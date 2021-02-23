class LongUrlShowSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers

  attributes :long_url
end
