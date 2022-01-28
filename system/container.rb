# frozen_string_literal: true

require 'dry/system/container'

class Feedback < Dry::System::Container
  configure do |config|
    config.component_dirs.add "lib/feedback" do |dir|
      dir.namespaces.add 'feedback', key: nil
    end

    config.component_dirs.add "system"
    config.component_dirs.add "bin"
  end

  namespace 'store' do
    register 'store' do
      Store.instance
    end
  end
end

class FeedbackTransactionContainer
  extend Dry::Container::Mixin

  namespace "operations" do
    register "select_operation" do
      Operations::SelectProduct.new
    end

    register "rate_other_or_quit.rb" do
      Operations::RateOtherOrQuit.new
    end
  end
end

Feedback.finalize!
