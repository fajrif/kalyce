class HomeController < ApplicationController

  def index
		# get public home
		@articles = Article.first(2)
		@doctors = Doctor.first(3)
		@treatments = Treatment.all
  end

  def about
		# get public about
		@articles = Article.first(2)
  end

  def treatments
		# get public treatments
		@treatments = Treatment.all
  end
end
