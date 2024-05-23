class TournamentBidPolicy < ApplicationPolicy
  def index?
    organization = Organization.find(@record.organization.id)
    if @user.id == organization.owner_id
      true
    else
      raise Pundit::NotAuthorizedError, "Только организатор турнира может просматривать заявки"
    end
  end

  def create?
    @user.id == @record.team.captain_id && @user.organization.id === @record.tournament.organization.id
  end
end
