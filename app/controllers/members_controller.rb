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

  def edit
    @member = Member.find_by(id: params[:id])
  end

  def update
    @member = Member.find_by(id: params[:id])

    if @member.update(member_params)
      redirect_to members_path, notice: '資料更新成功!'
    else
      render :edit
    end
  end

  def destroy
    @member = Member.find_by(id: params[:id])
    @member.destroy if @member
    redirect_to members_path, notice: "Member (#{@member.name}) 已刪除!"
  end

  private

  def member_params
    params.require(:member).permit('name_zh-TW', 'name_en')
  end
end
