# frozen_string_literal: true

module SocialMediaSystem
  module Errors
    class SystemDown < StandardError
      def message
        'System Down'
      end
    end

    class RetrieveMethodNotFound < StandardError
      def message
        "#{self} Should Implement retrieve method"
      end
    end
  end
end
