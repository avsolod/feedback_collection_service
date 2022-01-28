# frozen_string_literal: true

require_relative '../../models/comment'

module Operations
  module Create
    class Comment

      def new(params)
        ::Models::Comment.new(params)
      end
    end
  end
end
