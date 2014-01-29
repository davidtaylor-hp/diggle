class EntriesController < ApplicationController
  def new
    @entry = Entry.new
  end

  def create
    word = Entry.new params[:word]
    entry = Entry.find_by(word: params[:entry][:word])

    pp Entry.all.inspect

    pp entry.inspect

  end
end