# frozen_string_literal: true

module Transactions
  class FeedbackDialog
    include Dry::Transaction(container: Feedback)

    step :create_cart, with: 'operations.create.cart'
    step :console_dialog, with: 'operations.console_dialog'
    step :update_rated_product, with: 'operations.update_rated_product'
    step :rate_other_or_quit, with: 'operations.rate_other_or_quit'
  end
end
