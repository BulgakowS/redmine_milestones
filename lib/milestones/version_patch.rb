require_dependency "version"
module Milestones
  module VersionPatch
    def self.included(base) # :nodoc:

      base.class_eval do
        has_many :milestones # , :order => :start_date
      end

    end
  end
end

Rails.configuration.to_prepare do
  unless Project.included_modules.include?(Milestones::VersionPatch)
    Project.send(:include, Milestones::VersionPatch)
  end
end