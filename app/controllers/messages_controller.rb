class MessagesController < ApplicationController

    get '/messages' do
        if logged_in?
            @messages = Message.all 
            erb :'/messages/messages' 
        else
            redirect to '/login'
        end
    end

    get '/messages/new' do
      @users = current_user
      erb :'/messages/create_message'
    end

    post '/messages' do
				if logged_in?
					if params[:content] ==""
						redirect to "/messages/new"
					else
            @message = current_user.messages.build(content: params[:content], listing_id: params[:listing_id])
            if @message.save
            	redirect to "/messages/#{@message.id}"
						else
							redirect to "/messages/new"
						end
					end
				end
    end

    get '/messages/:id' do
      @message = Message.find_by_id(params[:id])
      erb :'messages/show_message'
    end

    patch '/messages/:id' do
       
      	if params[:content] == ""
          redirect to "/messages/#{params[:id]}"
        else
          @message = Message.find_by_id(params[:id])
          @message && @message.user == current_user
          @message.update(content: params[:content])	 
				end
    end
end