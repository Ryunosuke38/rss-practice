class FeedsController < ApplicationController
  before_action :set_feed, only: [:show, :edit, :update, :destroy]

  # GET /feeds
  # GET /feeds.json
  def index
    @entries = Entry.all.order('published desc')
  end

  # GET /feeds/1
  # GET /feeds/1.json
  def show
  end

end
