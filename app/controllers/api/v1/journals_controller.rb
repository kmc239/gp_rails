module Api
	module V1
		class JournalsController < ApplicationController
			class Journal < ::Journal
				def as_json(options = {})
				end
			end

			respond_to :json

			def index
				respond_with Journal.all
			end

			def show
				respond_with Journal.find(params[:id])
			end

			def create
				respond_with Journal.create(params[:journal])
			end

			def update
				respond_with Journal.update(params[:id], params[:journal])
			end

			def destroy
				respond_with Journal.destroy(params[:id])
			end
		end
	end
end