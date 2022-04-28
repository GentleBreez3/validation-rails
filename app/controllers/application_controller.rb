class ApplicationController < ActionController::Base
    rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
    rescue_from ActiveRecord::RecordNotSaved, with: :record_not_saved
    rescue_from ActiveRecord::RecordNotUnique, with: :record_not_updated

    before_action :get_plan, only: [:show, :edit, :update, :destroy]
    before_action :get_user, only: [:show, :edit, :update, :destroy]
    private
        def get_plan
            @plan = Plan.find(params[:id])
        end

        def get_user
            @user = User.find(params[:id])
        end

        def record_not_found
            render plain: "404 not found", status:404
        end

        def record_not_saved
            render plain: "409 Coundn't save record", status:409
        end

        def record_not_updated
            render plain: "409 Coundn't update record", status:409
        end
end
