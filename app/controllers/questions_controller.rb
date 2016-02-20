class QuestionsController < ApplicationController
  before_action :authenticate_user!


  add_breadcrumb "Главная", :root_path

  def show
    @test = Test.find(params[:test_id])
    @question = Question.find(params[:id])
    @answers = @question.answers
    @counter = 1
    add_breadcrumb @test.name, test_path(@test)
    add_breadcrumb @question.content, test_question_path(@test,@question)
  end

  def new
    @test = Test.find(params[:test_id])
    @question = @test.questions.build
    add_breadcrumb @test.name, test_path(@test)
    add_breadcrumb 'Новый вопрос'
  end

  def create
    @test = Test.find(params[:test_id])
    @question = @test.questions.build(question_params)

    if @question.save
      flash[:notice] = "#{@question.content} успешно создан!"
      redirect_to test_path(@test)
    else
      render 'new'
    end
  end

  def edit
    @test = Test.find(params[:test_id])
    @question = Question.find(params[:id])
    add_breadcrumb @test.name, test_path(@test)
    add_breadcrumb 'Редактировать вопрос'
  end

  def update
    @test = Test.find(params[:test_id])
    @question = Question.find(params[:id])
    if @question.update(question_params)
      flash[:notice] = 'Вопрос успешно обновлен!'
      redirect_to test_path(@test)
    else
      render 'edit'
    end
  end


  def destroy
    @test = Test.find(params[:test_id])
    @question = Question.destroy(params[:id])
    flash[:notice] = 'Вопрос успешно удален!'
    redirect_to test_path(@test)
  end

  private

  def question_params
    params.require(:question).permit(:test_id,:content)
  end


end
