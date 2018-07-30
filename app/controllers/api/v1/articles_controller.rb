# adding a namespace
module Api
	module V1
		class ArticlesController < ApplicationController

			def index
				# Get all the articles ordered by date
				articles = Article.order('created_at DESC');
				# render it as JSON
				render json: {status: 'Success', message:'Loaded articles', data:articles}, status: :ok
			
			end

			def show
				# Get an article according to id
				article = Article.find(params[:id])
				# render it as JSON
				render json: {status: 'Success', message:'Loaded article', data:article}, status: :ok
			end

			# create an Article. The POST request
			def create
				# whitelisting certain fields that we want to enter by passing in article_params
				article = Article.new(article_params)

				# check similarities
				if article.save
					# render a response	
					render json: {status: 'Success', message:'Save artice', data:article}, status: :ok
				else
					# unsuccessfully
					render json: {status: 'ERROR', message:'Article not saved', 
						data:article.errors}, status: :unprocessable_entity
				end	
			end

			# update an article
			def update
				# Get an article according to id
				article = Article.find(params[:id])

				if article.update_attributes(article_params)
					# render a response	
					render json: {status: 'Success', message:'Updated artice', data:article}, status: :ok
				else
					# unsuccessfully
					render json: {status: 'ERROR', message:'Article not saved', 
						data:article.errors}, status: :unprocessable_entity
				end
			end

			# Delete an article
			def destroy
				# Get an article according to id
				article = Article.find(params[:id])
				article.destroy
				# render a response	
				render json: {status: 'Success', message:'Deleted artice', data:article}, status: :ok
			end

			private

			def article_params
				# fields that we want to permit
				# which is title and body that we want to enter in
				params.permit(:title, :body)
			end
		end
	end
end