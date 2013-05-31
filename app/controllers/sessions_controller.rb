class SessionsController < Devise::SessionsController

  
  def new
    
    
    respond_to do |format|
         format.js
       end
    
  end
  
  def create
    resource = warden.authenticate!(:scope => resource_name, :recall => "#{controller_path}#failure")
    sign_in_and_redirect(resource_name, resource) 
  end
 
  def sign_in_and_redirect(resource_or_scope, resource=nil)
    scope = Devise::Mapping.find_scope!(resource_or_scope)
    resource ||= resource_or_scope
    sign_in(scope, resource) unless warden.user(scope) == resource
    
    return redirect_to :back, :notice => t('auth_success')
  end
 
  def failure
    
    respond_to do |format|
         format.html { redirect_to :back, :notice => t('auth_failure') }
         format.js
       end
    
    return 
  end
  
end