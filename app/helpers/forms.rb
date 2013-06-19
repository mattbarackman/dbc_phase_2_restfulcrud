
helpers do 
  
  def errors
    session.delete(:errors) if session[:errors]
  end

  def convert_for_session(form_data)
    data = {}
    form_data.each do |key, value|
      data[key.to_sym] = value
    end
    data
  end

end