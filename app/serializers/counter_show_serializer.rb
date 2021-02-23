class CounterShowSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers

  attributes :counter
end
