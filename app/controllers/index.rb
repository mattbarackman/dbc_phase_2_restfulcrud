#Create a new note

get '/notes/new' do
  erb :create
end

post '/notes/new' do 
  post = Note.create(params[:form])
  redirect "/"
end


#Read all notes

get '/' do
  @notes = Note.order("created_at ASC")
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