require 'active_support/concern'

module ActiveRecordExtension
  extend ActiveSupport::Concern

  included do
    def model_class
      controller_name.classify.constantize
    end
  end
end

ActiveRecord::Base.send(:include, ActiveRecordExtension)