require 'rake'
Rake::Task.clear
RedmineApp::Application.load_tasks

class RakerController < ApplicationController
  unloadable
  skip_before_filter :session_expiration, :user_setup, :check_if_login_required, :check_password_change, :set_localization
  def run_task
    if check_admin_tokens(params[:token])
      t = params[:task]
      begin
        Rake::Task[t].reenable
        Rake::Task[t].invoke

        render text: "Completed rake #{t}"
      rescue Exception => e
        render text: "Failed. Redmine reported: #{e}"
      end
    else
      render text: 'No access allowed!'
    end
  end

  protected

  def check_admin_tokens(token)
    admin_tokens = User.where(admin: true).map(&:api_key)
    ([token] & admin_tokens).any?
  end
end
