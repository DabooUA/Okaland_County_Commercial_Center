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
        if logged_in?
            @users = current_user
            erb :'/messages/create_message'
        else
            redirect to '/login'
        end
    end

    post '/messages' do
        if logged_in?
          if params[:content] == ""
            redirect to "/messages/new"
          else
            @message = current_user.messages.build(content: params[:content])
            if @message.save
              redirect to "/messages/#{@message.id}"
            else
              redirect to "/messages/new"
            end
          end
        else
          redirect to '/login'
        end
      end

    get '/messages/:id' do
        if logged_in?
            @message = Message.find_by_id(params[:id])
            erb :'messages/show_message'
        else
            redirect to '/login'
        end
    end

    get '/messages/:id/edit' do
        if logged_in?
            @message = Message.find_by_id(params[:id])
                if @message && @message.user == current_user
                    erb :'/messages/edit_message'
                else
                    redirect to '/messages'
                end
        else
            redirect to '/login'
        end
    end

    patch '/messages/:id' do
        if logged_in?
            if params[:content] == ""
                redirect to "/messages/#{params[:id]}/edit"
            else
                @message = Message.find_by_id(params[:id])
                if @message && @message.user == current_user
                    if @message.update(content: params[:content])
                        redirect to "/messages/#{@message.id}"
                    else
                        redirect to "messages/#{@message.id}/edit"
                    end
                else
                    redirect to '/messages'
                end
            end
        else
            redirect to '/login'
        end

    end

end