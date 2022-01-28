class WorkshopsController < ApplicationController

    layout "home"

    def show
        @workshop = Workshop.find(params[:id])
    end
end
