class TestsController < ApplicationController
  before_action :authenticate_user!

  add_breadcrumb "Главная", :root_path

  def index
    @tests = Test.all
  end

  def show
    @test = Test.find(params[:id])
    @questions = @test.questions
    add_breadcrumb @test.name, test_path(@test)
  end

  def new
    @test = Test.new
    add_breadcrumb 'Новый тест'

  end

  def create
    @test = Test.new(tests_params)

    if @test.save
      flash[:notice] = "#{@test.name} успешно создан!"
      redirect_to @test
    else
      render 'new'
    end
  end

  def edit
    @test = Test.find(params[:id])
    add_breadcrumb 'Редактировать тест'
  end

  def update
    @test = Test.find(params[:id])

    if @test.update(tests_params)
      flash[:notice] = " #{@test.name} успешно обновлен!"
      redirect_to root_url
    else
      render 'edit'
    end
  end

  def destroy
    @test = Test.destroy(params[:id])
    flash[:notice] = 'Тест успешно удален!'
    redirect_to root_url

  end

  private

  def tests_params
    params.require(:test).permit(:name, :description)
  end


end
