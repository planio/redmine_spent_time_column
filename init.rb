require 'redmine'
require 'dispatcher'

Dispatcher.to_prepare do
  Query.send(:include, RedmineSpentTimeColumn::Patches::QueryPatch) unless Query.include?(RedmineSpentTimeColumn::Patches::QueryPatch)
  QueriesHelper.send(:include, RedmineSpentTimeColumn::Patches::QueriesHelperPatch) unless QueriesHelper.include?(RedmineSpentTimeColumn::Patches::QueriesHelperPatch)
end

Redmine::Plugin.register :redmine_spent_time_column do
  name 'Redmine Spent Time Column'
  author 'Jan Schulz-Hofen, Planio GmbH'
  description 'This plugin adds a spent time column to issue lists.'
  version '1.0.0'
end
