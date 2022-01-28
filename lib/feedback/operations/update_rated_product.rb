# frozen_string_literal: true

module Operations
  class UpdateRatedProduct
    include Dry::Transaction::Operation

    def call(input)
      @cart = store.fetch(:cart)
      update_product(input[:selected_product],input[:params])
      store.save_cart(@cart)
      Success(input[:rate_or_quit] && @cart.count > 0)
    end

    private

    def update_product(product_index,comments_params)
      product = @cart.delete_at(product_index)
      product.comments << create_comment(comments_params)
      product.new(total_rating: calculate_rating(product.comments))
      store.save_rated_product(product)
    end


    def calculate_rating(comments)
      comments.map(&:rating).sum.to_f/comments.count.to_f
    end

    def store
      Feedback['store']
    end

    def create_comment(params)
      Feedback['operations.create.comment'].new(params)
    end
  end
end
