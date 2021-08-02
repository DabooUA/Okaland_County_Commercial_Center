class MessagesController < ApplicationController

    get '/listings/:listing_id/messages' do
        if logged_in?
            @messages = Message.all 
            erb :'/messages/messages' 
        else
            redirect to '/login'
        end
    end

    get '/listings/:listing_id/messages/new' do
			@users = current_user
			@listing = Listing.find_by_id(params[:listing_id])
			@messages = @listing.messages
			erb :'/messages/create_message'   
    end

    post '/messages' do
				if logged_in?
					if params[:content] ==""
						redirect to "/messages/new"
					else
            @message = current_user.messages.build(content: params[:content], listing_id: params[:listing_id])
            if @message.save
            	redirect to "/listings/#{params[:listing_id]}/messages/#{@message.id}"
						else
							redirect to "/listings/#{params[:listing_id]}/messages/new"
						end
					end
				end
    end

    get '/listings/:listing_id/messages/:id' do
      @message = Message.find_by_id(params[:id])
      erb :'messages/show_message'
    end

    patch '/listings/:listing_id/messages/:id' do
       
      	if params[:content] == ""
          redirect to "/messages/#{params[:id]}"
        else
          @message = Message.find_by_id(params[:id])
          @message && @message.user == current_user
          @message.update(content: params[:content], listing_id: params[:listing_id])	 
				end
    end
end