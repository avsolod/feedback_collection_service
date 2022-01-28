# frozen_string_literal: true

module Operations
  class ConsoleDialog
    include Dry::Transaction::Operation

    def call(input)
      Success(console_response(input))
    end

    private

    def console_response(product_names_hash)
      prompt = TTY::Prompt.new
      prompt.collect do
        key(:selected_product).select('Select a product to evaluate', product_names_hash, cycle: true)
        key(:params) do
          key(:rating).select('Rate the selected product', [1,2,3,4,5], cycle: true)
          key(:text).ask("Write comment", required: true)
          key(:author).ask("Enter nickname", required: true)
        end
        key(:rate_or_quit).select("Rate other or quit?", {'Rate': true, Quit: false }, cycle: true)
      end
    end
  end
end