module RedmineSpentTimeColumn
  class ViewHooks < Redmine::Hook::ViewListener
    render_on :view_issues_index_bottom, :partial => 'hooks/redmine_spent_time_column/view_issues_index_bottom'
  end
end