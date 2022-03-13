class BoardsController < ApplicationController
  before_action :set_board, only: [:show, :update, :destroy]
  before_action :authenticate_user!, only: [:create, :update, :destroy]

  # GET /boards
  def index
    @boards = Board.all.page(params[:page]).per(10)
    @count = Board.count
    render json: {boards: @boards, count: @count}
  end

  # GET /boards/1
  def show
    render json: @board
  end

  # POST /boards
  def create
    pp "----------------"
    pp current_user
    pp "----------------"
    @board = Board.new(board_params)
    @board.user_id = current_user.id

    if @board.save
      render json: @board, status: :created, location: @board
    else
      render json: @board.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /boards/1
  def update
    pp "----------------"
    pp "update"
    pp "----------------"
    pp current_user
    pp "----------------"
    pp board_params
    pp "----------------"
    if @board.update(board_params)
      render json: @board
    else
      render json: @board.errors, status: :unprocessable_entity
    end
  end

  # DELETE /boards/1
  def destroy
    @board.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_board
      @board = Board.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def board_params
      params.require(:board).permit(:id, :user_id, :title, :detail)
    end
end
