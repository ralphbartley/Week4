require 'sinatra/base'
require './lib/bookmark'

class BookmarkManager < Sinatra::Base
  get '/' do
    erb :index
  end

  get '/bookmarks' do
    @bookmarks = Bookmark.all
    erb :bookmarks
  end

  post '/bookmarks' do
    Bookmark.add(params[:title], params[:url])
    redirect '/bookmarks'
  end

  post '/bookmarks_delete' do
    Bookmark.delete(params[:title])
    redirect '/bookmarks'
  end
end
