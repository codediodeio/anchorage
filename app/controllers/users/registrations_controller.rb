class Users::RegistrationsController < Devise::RegistrationsController
# before_filter :configure_sign_up_params, only: [:create]
before_filter :configure_account_update_params, only: [:update]

respond_to :html, :js

# GET /resource/sign_up
def new
  super
end

# POST /resource
def create
  @user = build_resource
  super
end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  def update
    @registration = resource
    super
  end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

   protected

  # You can put the params you want to permit in the empty array.
  def configure_sign_up_params
    devise_parameter_sanitizer.for(:sign_up) << [:username, :location, :bio, :boatname, :boatmodel, :blog, :fname, :lname]
  end

  # You can put the params you want to permit in the empty array.
  def configure_account_update_params
    devise_parameter_sanitizer.for(:account_update) << [:username, :location, :bio, :boatname, :boatmodel, :blog, :fname, :lname, :image]
  end

  def update_resource(resource, params)
    resource.update_without_password(params)
  end


  # The path used after sign up.

  def after_sign_up_path_for(resource)
    ActivityMailer.welcome(resource).deliver_now
    super(resource)
  end


  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end
