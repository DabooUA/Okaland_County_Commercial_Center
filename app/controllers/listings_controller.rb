class ListingsController < ApplicationController

    get '/listings' do
        if logged_in?
            @listings = Listing.all 
            erb :'/listings/listings' 
        else
            redirect to '/login'
        end
    end

    get '/listings/new' do
        if logged_in?
            @users = current_user
            erb :'/listings/create_listing'
        else
            redirect to '/login'
        end
    end

    post '/listings' do
        if logged_in?
          if params[:content] == ""
            redirect to "/listings/new"
          else
            @listing = current_user.listings.build(content: params[:content])
            if @listing.save
              redirect to "/listings/#{@listing.id}"
            else
              redirect to "/listings/new"
            end
          end
        else
          redirect to '/login'
        end
      end

    get '/listings/:id' do
        if logged_in?
            @listing = listing.find_by_id(params[:id])
            erb :'listings/show_listing'
        else
            redirect to '/login'
        end
    end

    get '/listings/:id/edit' do
        if logged_in?
            @listing = Listing.find_by_id(params[:id])
                if @listing && @listing.user == current_user
                    erb :'/listings/edit_listing'
                else
                    redirect to '/listings'
                end
        else
            redirect to '/login'
        end
    end

    patch '/listings/:id' do
        if logged_in?
            if params[:content] == ""
                redirect to "/listings/#{params[:id]}/edit"
            else
                @listing = Listing.find_by_id(params[:id])
                if @listing && @listing.user == current_user
                    if @listing.update(content: params[:content])
                        redirect to "/listings/#{@listing.id}"
                    else
                        redirect to "listings/#{@listing.id}/edit"
                    end
                else
                    redirect to '/listings'
                end
            end
        else
            redirect to '/login'
        end

    end

    delete '/listings/:id/delete' do
        if logged_in?
          @listing = Listing.find_by_id(params[:id])
          if @listing && @listing.user == current_user
            @listing.delete
          end
          redirect to '/listings'
        else
          redirect to '/login'
        end
      end


end