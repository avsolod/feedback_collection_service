# frozen_string_literal: true

module Types
  include Dry.Types()
end

module Models
  class Product < Dry::Struct
    attribute :name, Types::String
    attribute :price, Types::Coercible::Float
    attribute :descr, Types::String
    attribute :total_rating, Types::Coercible::Float
    attribute :comments, Types::Array do
      attribute :author, Types::String
      attribute :text, Types::String
      attribute :rating, Types::Coercible::Integer
    end
  end
end
