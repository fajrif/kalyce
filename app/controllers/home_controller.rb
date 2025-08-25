class HomeController < ApplicationController

  def index
		# get public home
		@articles = Article.first(2)
		@doctors = Doctor.first(3)
		@treatments = Treatment.all
  end

  def about
		# get public about
  end

end
