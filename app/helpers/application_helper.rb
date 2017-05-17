module ApplicationHelper
  def flash_message
    flash_collection = []
    if flash[:notice]
      flash_collection << flash_type('info', flash[:notice])
    elsif flash[:error]
      flash_collection << flash_type('danger', flash[:error])
    elsif flash[:alert]
      flash_collection << flash_type('warning', flash[:alert])
    elsif flash[:success]
      flash_collection << flash_type('success', flash[:success])
    end
    return flash_collection.join.html_safe
  end
  
  def flash_type(type, message)
    button_properties = {
      :type => 'button', 
      :class => 'btn close',
      :'data-dismiss' => 'alert', 
      :'aria-label' => 'Close'
    }
    content_tag(:div, :class => "alert alert-#{type} alert-dismissible") do
      concat(message)
      concat(content_tag(:button, button_properties) do
          content_tag(:span, :'aria-hidden' => 'true') do
            concat('&times;'.html_safe)
          end
        end)
    end    
  end
  
  def show_action_links?
    actions = [
      'new', 
      'create', 
      'edit', 
      'update', 
      'index', 
      'show', 
      'destroy']
    (actions.include?(action_name) and is_model?(get_controller_name)) ? true : false
  end
  
  def get_controller_name
    devise_controllers = [
      'registrations', 
      'sessions', 
      'confirmations', 
      'omniauth_callbacks', 
      'passwords', 
      'unlocks'
    ]
    return devise_controllers.include?(controller_name) ? 'users' : controller_name
  end 
  
  def is_model?(model)
    if File.exist?("app/models/#{to_model_file_name(model)}.rb")
      return true
    else
      return false
    end
  end
  
  def to_model(model)
    name = eval("#{to_model_name(model)}")
    return name
  rescue
    'Error on to_model: ' + model.to_s
  end
  
  def to_model_name(model)
    name = model.to_s.gsub('_id', '').singularize.camelize
    return name
  rescue
    'Error on to_model_name: ' + model.to_s
  end
  
  def to_model_file_name(model)
    name = model.to_s.gsub('_id', '').tableize.singularize
    return name
  rescue
    'Error on to_model_file_name: ' + model.to_s
  end
  
  def to_controller_name(model)
    name = model.to_s.gsub('_id', '').tableize
    return name
  rescue
    'Error on to_controller_name: ' + model.to_s
  end
  
end
