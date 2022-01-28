# frozen_string_literal: true

module Commands
  class Start < Dry::CLI::Command
    desc "Start feedback dialog"

    def call(*)
      Feedback['transactions.feedback_dialog'].call do |result|
        result.success do |rated_products|
          rated_products.each do |product|
            puts "Product: #{product.name}, Rating is #{product.total_rating}"
            puts "Comments:"
            product.comments.each do |comment|
              puts "#{comment.text}"
              puts "Author #{comment.author}"
              puts ""
            end
            puts ""
          end
        end

        result.failure do |error|
          puts "Error: #{error.message}"
        end
      end
    end
  end
end
