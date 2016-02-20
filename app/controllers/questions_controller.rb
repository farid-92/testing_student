class QuestionsController < ApplicationController
  def index
  end
  def show
    @test = Test.find(params[:test_id])
    @question = Question.find(params[:id])
  end

  def new
    @test = Test.find(params[:test_id])
    @question = @test.questions.build
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
