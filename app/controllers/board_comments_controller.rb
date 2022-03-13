class BoardCommentsController < ApplicationController
  before_action :set_board_comment, only: [:show, :update, :destroy]

  # GET /board_comments
  def index
    @board_comments = BoardComment.all

    render json: @board_comments
  end

  # GET /board_comments/1
  def show
    render json: @board_comment
  end

  # POST /board_comments
  def create
    @board_comment = BoardComment.new(board_comment_params)

    if @board_comment.save
      render json: @board_comment, status: :created, location: @board_comment
    else
      render json: @board_comment.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /board_comments/1
  def update
    if @board_comment.update(board_comment_params)
      render json: @board_comment
    else
      render json: @board_comment.errors, status: :unprocessable_entity
    end
  end

  # DELETE /board_comments/1
  def destroy
    @board_comment.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_board_comment
      @board_comment = BoardComment.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def board_comment_params
      params.require(:board_comment).permit(:user_id, :board_id, :title, :detail)
    end
end
