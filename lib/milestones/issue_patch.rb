require_dependency "issue"
module RemineMilestones
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

unless Issue.included_modules.include?(RemineMilestones::IssuePatch)
  Issue.send(:include, RemineMilestones::IssuePatch)
end