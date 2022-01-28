# frozen_string_literal: true

module Operations
  class RateOtherOrQuit
    include Dry::Transaction::Operation

    def call(input)
      if input
        rerun_transaction
      else
        Success(store.fetch(:rated_products))
      end
    end

    def store
      Feedback['store']
    end

    def rerun_transaction
      Feedback['transactions.feedback_dialog'].call
    end
  end
end
