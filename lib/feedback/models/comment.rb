# frozen_string_literal: true

module Models
  class Comment < Dry::Struct
    attribute :author, Types::String
    attribute :text, Types::String
    attribute :rating, Types::Coercible::Integer
  end
end
