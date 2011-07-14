require 'redmine'
require 'dispatcher'
require 'redmine_spent_time_column/hooks'

Dispatcher.to_prepare do
  Issue.send(:include, RedmineSpentTimeColumn::Patches::IssuePatch) unless Issue.include?(RedmineSpentTimeColumn::Patches::IssuePatch)
  Query.send(:include, RedmineSpentTimeColumn::Patches::QueryPatch) unless Query.include?(RedmineSpentTimeColumn::Patches::QueryPatch)
  QueriesHelper.send(:include, RedmineSpentTimeColumn::Patches::QueriesHelperPatch) unless QueriesHelper.include?(RedmineSpentTimeColumn::Patches::QueriesHelperPatch)
end

Redmine::Plugin.register :redmine_spent_time_column do
  name 'Redmine Spent Time Column'
  author 'Jan Schulz-Hofen, Planio GmbH'
  description 'This plugin adds a spent time column to issue lists.'
  version '1.1.0'
end
