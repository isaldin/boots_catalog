require 'active_support/concern'

module ActiveRecordExtension
  extend ActiveSupport::Concern

  module ClassMethods
    def foo
      'bar'
    end
  end

  def model_class
    @model_class ||= controller_name.classify.constantize
  end
end

ActiveRecord::Base.send(:include, ActiveRecordExtension)