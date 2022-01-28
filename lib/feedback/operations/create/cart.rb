# frozen_string_literal: true

module Operations
  module Create
    class Cart
      include Dry::Transaction::Operation

      def call(*)
        store.save_cart(Array.new(5) { create_product }) if store.blank?
        Success(store.fetch_products_names_hash)
      end

      private

      def store
        Feedback['store']
      end

      def create_product
        Feedback['operations.create.product'].new
      end
    end
  end
end
