class PostsController < ApplicationController

    require 'rest-client'

    # def get_posts 
    #     response =  RestClient.get(url)
    #     render json: response.body
    # end


    URI = "https://jsonplaceholder.typicode.com/posts"

    def index 
        @post = Post.all
        @responses = RestClient.get(URI)
        @data = JSON.parse(@responses.body) 
        @data.each do |post|
            @user = Post.create(title: post['title'], description: post['body']);
            @user.save
        end
    end

  
    def show
        @post = Post.all
    end

 

end
