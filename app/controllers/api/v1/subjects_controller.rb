module Api
  module V1
    # subject api
    class SubjectsController < ApplicationController

      def index
        logger.error(params)
        subjects = nil
        subjects = Subject.where("subjects.title LIKE ?", "%#{params[:keyword]}%") if params[:keyword].present?
        subjects = Subject.includes(:teacher).where("teachers.name LIKE ?", "%#{params[:teacher_name]}%") if params[:teacher_name].present?
        subjects = Subject.all if params[:keyword].nil? && params[:teacher_name].nil?
        results = subjects&.includes(:lectures).order('lectures.date asc')
        render json: results, each_serializer: SubjectsSerializer, include: %i[teacher lectures], adapter: :json
      end

    end
  end
end
