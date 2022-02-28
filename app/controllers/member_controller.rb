class MemberController < ApplicationController
  def index
    @members = Member.all
  end
end
