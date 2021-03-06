# frozen_string_literal: true

module Commands
  class Version < Dry::CLI::Command
    desc "Print version"

    def call(*)
      puts "0.0.1"
    end
  end
end
