module RedmineSpentTimeColumn
  module Patches
    module QueryPatch
      
      def available_columns_with_spent_hours
        returning available_columns_without_spent_hours do |columns|
          if (project and User.current.allowed_to?(:view_time_entries, project)) or User.current.admin?
            columns << QueryColumn.new(:spent_hours, :caption => :label_spent_time, :sortable => "(select sum(hours) from #{TimeEntry.table_name} where #{TimeEntry.table_name}.issue_id = #{Issue.table_name}.id)") unless columns.detect{ |c| c.name == :spent_hours }
          end
        end
      end

      def self.included(klass)
        klass.send :alias_method_chain, :available_columns, :spent_hours
      end
      
    end
  end
end