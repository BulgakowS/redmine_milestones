RedmineApp::Application.routes.draw do
  resources :projects do
    resources :milestones
  end

  resources :versions do
    resources :milestones do
      collection do
        get 'report_for_version'
      end
    end
  end

  resources :milestones do
    collection do
      post 'update_settings'
      get 'parent_project_changed'
      get 'subproject_changed'
      post 'recalculate_planned_end_date'
      post 'recalculate_start_date'
      get 'recalculate_actual_date'
      get 'issue_version_changed'
      get 'milestone_version_changed'
      get 'add_assigned_project'
    end

    member do
      post 'status_by'
      get 'report'
      get 'planned_end_date_changed'
      get 'start_date_changed'
      get 'set_planned_to_actual'
      post 'confirm_delete'
      get 'check_visibility_lost'
    end
  end
end

#ActionController::Routing::Routes.draw do |map|
=begin
  resources :projects do |project|
    project.resources :milestones
  end

  resources :versions do |version|
    version.resources :milestones, :collection => {
        :report_for_version => [:get]
    }
  end
=end

=begin
  resources :milestones, :collection => {
      :parent_project_changed => [:get],
      :subproject_changed => [:get],
      :recalculate_planned_end_date => [:post],
      :recalculate_start_date => [:post],
      :recalculate_actual_date => [:get],
      :issue_version_changed => [:get],
      :milestone_version_changed => [:get],
      :add_assigned_project => [:get],
      :update_settings => [:post],
  },:member => {
      :status_by => :post,
      :report => [:get],
      :planned_end_date_changed => [:get],
      :start_date_changed => [:get],
      :set_planned_to_actual => [:get],
      :confirm_delete => [:post],
      :check_visibility_lost => [:get]
  }
=end

=begin
  map.resources :projects do |project|
    project.resources :milestones
  end

  map.resources :versions do |version|
    version.resources :milestones, :collection => {
        :report_for_version => [:get]
    }
  end

  map.resources :milestones, :collection => {
      :parent_project_changed => [:get],
      :subproject_changed => [:get],
      :recalculate_planned_end_date => [:post],
      :recalculate_start_date => [:post],
      :recalculate_actual_date => [:get],
      :issue_version_changed => [:get],
      :milestone_version_changed => [:get],
      :add_assigned_project => [:get],
      :update_settings => [:post],
  },:member => {
      :status_by => :post,
      :report => [:get],
      :planned_end_date_changed => [:get],
      :start_date_changed => [:get],
      :set_planned_to_actual => [:get],
      :confirm_delete => [:post],
      :check_visibility_lost => [:get]
  }
=end
