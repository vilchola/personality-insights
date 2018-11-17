require 'watson'

class UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy]

  # GET /users
  def index
    @users = User.all
    json_response(@users)
  end

  # POST /users
  def create
  	@user = User.create!(user_params)
  	json_response(@user, :created)
  end

  # GET /users/:id
  def show
    #json_response(@user)

    tweets = get_tweets(@user.username)
    #render json: tweets

    ibm = Watson.new()
    #token = ibm.get_token
    #render json: token
    
    personality = ibm.get_personality(tweets)
    render json: personality

    #tag = 'pop'
    #lastfm = ibm.get_lastfm(tag)
    #render json: lastfm
  end

  # PUT /users/:id
  def update
  	@user.update(user_params)
  	head :no_content
  end

  # DELETE /users/:id
  def destroy
    if @user
  	  @user.destroy
      head :no_content
    else
      json_response(@user)
    end
  end

  private
  def user_params
  	params.permit(:username, :trait)
  end

  def set_user
  	@user = User.find(params[:id])
  end

  def get_tweets(username)
    contentItems = []
    @tweets = twitter_client.user_timeline(username, count: 25)
    @tweets.each do |tweet|
      content = {
        'content' => tweet.text,
        'contenttype' => 'text/plain',
        'created' => tweet.created_at.to_i,
        'id' => tweet.id.to_s,
        'language' => tweet.user.lang,
      }
      contentItems << content
    end
    return { 'contentItems' => contentItems }
  end
end
