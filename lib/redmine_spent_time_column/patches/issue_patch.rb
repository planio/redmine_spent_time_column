module RedmineSpentTimeColumn
  module Patches
    module IssuePatch
      
      def calculated_spent_hours
        @calculated_spent_hours ||= self_and_descendants.sum("estimated_hours * done_ratio / 100").to_f || 0.0
      end
      
      def divergent_hours
        @divergent_hours ||= spent_hours - calculated_spent_hours
      end
      
      def remaining_hours
        @remaining_hours ||= self_and_descendants.sum("estimated_hours - (estimated_hours * done_ratio / 100)").to_f || 0.0
      end
      
    end
  end
end