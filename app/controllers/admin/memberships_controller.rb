module Admin
  class MembershipsController < BaseController

    sections 'settings'

    def create
      @membership = current_site.memberships.build(params[:membership])
      @membership.role = 'author' # force author by default

      case @membership.process!
      when :create_account
        redirect_to new_admin_account_url(:email => @membership.email)
      when :save_it
        respond_with @membership, :location => edit_admin_current_site_url
      when :error
        respond_with @membership, :flash => true
      when :already_created
        respond_with @membership, :alert => t('flash.admin.memberships.create.already_created'), :location => edit_admin_current_site_url
      end
    end

    def destroy
      destroy! { edit_admin_current_site_url }
    end

  end
end
