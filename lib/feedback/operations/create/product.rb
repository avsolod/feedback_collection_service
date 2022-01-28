# frozen_string_literal: true

require_relative '../../models/product'

module Operations
  module Create
    class Product

      def new
        comments = create_comments

        ::Models::Product.new(
          name: FFaker::Product.product_name,
          price: rand(2..5000),
          descr: FFaker::Product.model,
          total_rating: comments.map(&:rating).sum/comments.count,
          comments: comments
        )
      end

      private

      def create_comments
        Array.new(rand(1..3)) {
          Feedback['operations.create.comment'].new(
            author: FFaker::Name.unique.name,
            text: FFaker::Lorem.paragraph,
            rating: rand(1..5))
        }
      end
    end
  end
end
