require 'net/http'
require 'json'

module V1
  class AnimesController < ActionController::API

    def index
        render json: anime_collection, status: :ok
    end

    def show
      render json: Anime.find(params[:id]), status: :ok
    end

    def fill_db
      DataStorageJob.perform
      render json: nil, status: :ok
    end

    private

    def anime_collection
      if params[:query].present?
        return Anime.where("LOWER(title) ILIKE '%#{params[:query].downcase}%'")
      else
        return Anime.page(params[:page].nil? ? 1 : params[:page][:number])
      end
    end

    def respond_with_errors(object)
      render json: { errors: ErrorSerializer.serialize(object) },
             status: :unprocessable_entity
    end
  end
end
