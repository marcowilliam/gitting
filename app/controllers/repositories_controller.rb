class RepositoriesController < ApplicationController
	def new
		@repository = Repository.new
	end
end
