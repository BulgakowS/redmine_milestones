#require_dependency "issue"

module Milestones
  module IssuePatch
    def self.included(base) # :nodoc:

      base.class_eval do
#        has_one :milestone, :class_name => "Milestone", :dependent => :destroy
        belongs_to :milestone
        safe_attributes :milestone_id
      end

    end
  end
end

Rails.configuration.to_prepare do
  unless Issue.included_modules.include?(Milestones::IssuePatch)
    Issue.send(:include, Milestones::IssuePatch)
  end
end