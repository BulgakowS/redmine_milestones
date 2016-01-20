require_dependency "version"
module RemineMilestones
  module VersionPatch
    def self.included(base) # :nodoc:

      base.class_eval do
        has_many :milestones # , :order => :start_date
      end

    end
  end
end

unless Project.included_modules.include?(RemineMilestones::VersionPatch)
  Project.send(:include, RemineMilestones::VersionPatch)
end