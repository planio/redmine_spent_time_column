module RedmineSpentTimeColumn
  module Patches
    module QueriesHelperPatch
      
      def column_content_with_spent_hours(column, issue)
        value = column.value(issue)
        if %w(Fixnum Float).include?( value.class.name ) and column.name == :spent_hours
          sprintf "%.2f", value
        else
          column_content_without_spent_hours(column, issue)
        end
      end

      def self.included(klass)
        klass.send :alias_method_chain, :column_content, :spent_hours
      end
      
    end
  end
end