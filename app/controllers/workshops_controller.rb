# frozen_string_literal: true

# class
class WorkshopsController < ApplicationController
  layout 'application'

  def show
    @workshop = Workshop.find(params[:id])
  end
end
