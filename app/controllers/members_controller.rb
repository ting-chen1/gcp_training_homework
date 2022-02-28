class MembersController < ApplicationController
  def index
    @members = Member.all
  end

  def new
    @member = Member.new
  end

  def create
    @member = Member.new(member_params)

    if @member.save
      redirect_to members_path, notice: '新增 Member 成功!'
    else
      render :new
    end
  end

  private

  def member_params
    params.require(:member).permit(:name)
  end
end
