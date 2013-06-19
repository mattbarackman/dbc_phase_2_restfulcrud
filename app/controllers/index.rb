#Create a new note

get '/notes/new' do
  @errors = errors
  @form_data = session.delete(:form_data) if session[:form_data]
  erb :create
end

post '/notes' do 
  note = Note.new(params[:form])
  if note.valid?
    note.save
    redirect "/"
  else
    session[:errors] = note.errors
    session[:form_data] = convert_for_session(params[:form])
    redirect '/notes/new'
  end
end


#Read notes

get '/' do
  @notes = Note.order("created_at DESC")
  erb :index
end

get '/notes/:note_id' do |note_id|
  @note = Note.find(note_id)
  erb :note
end


#Update a note
get '/notes/:note_id/edit' do |note_id|
  @note = Note.find(note_id)
  erb :edit
end

post '/notes/:note_id/edit' do |note_id|
  Note.update(note_id,params[:form])
  redirect "/"
end


#Delete a note

delete '/notes/:note_id' do |note_id|
  Note.destroy(note_id)
  redirect '/'
end
