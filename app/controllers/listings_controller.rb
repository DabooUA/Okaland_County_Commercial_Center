class ListingsController < ApplicationController

    get '/listings' do
        if logged_in?
            # @listings = Listing.all 
            @listings = current_user.listings
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
            @listing = current_user.listings.build(title: params[:title], year: params[:year], make: params[:make], model: params[:model], miles: params[:miles], engine: params[:engine], content: params[:content])
            if @listing.save
               if params[:listings_image]
                  @filename = "#{@listing.id}.jpg"
                  file = params[:listings_image][:tempfile]
                  File.open("./public/images/listings/#{@filename}", 'wb') do |f|
                        f.write(file.read)
                  end                      
                end
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
            @listing = Listing.find_by_id(params[:id])
            erb :'/listings/show_listing'
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
                    if @listing.update(title: params[:title], year: params[:year], make: params[:make], model: params[:model], miles: params[:miles], engine: params[:engine], content: params[:content])
                      if params[:listings_image]
                        @filename = "#{@listing.id}.jpg"
                        file = params[:listings_image][:tempfile]
                        File.open("./public/images/listings/#{@filename}", 'wb') do |f|
                              f.write(file.read)
                        end                      
                      end
                        redirect to "/listings/#{@listing.id}"
                    else
                        redirect to "/listings/#{@listing.id}/edit"
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