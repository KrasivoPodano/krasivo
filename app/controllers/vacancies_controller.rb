class VacanciesController < ApplicationController
  def index
    @vacancies = Vacancy.published
  end

  def show
    @vacancy = Vacancy.find(params[:id])
  end
end
