class Public::GroupMembersController < ApplicationController


  def create
    group_member = current_customer.group_members.new(group_id: params[:group_id])
    group_member.save
    redirect_to request.referer
  end

  def destroy
    group_member = current_customer.group_members.find_by(group_id: params[:group_id])
    group_member.destroy
    redirect_to request.referer
  end
end
