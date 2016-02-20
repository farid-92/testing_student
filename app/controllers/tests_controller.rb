class TestsController < ApplicationController
  before_action :authenticate_user!
  def index
    @tests = Test.all
  end

  def show
    @test = Test.find(params[:id])
    @questions = @test.questions
  end

  def new
    @test = Test.new

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
