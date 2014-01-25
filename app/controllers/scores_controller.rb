class ScoresController < ApplicationController
  def new_calls
  	@users = User.where("history_id = ?", session[:history_id])
  end

  def create_calls
  	#size = User.count
    users = User.where("history_id = ?", session[:history_id])
    users.each do |user|
      call_n = params["call"+(user.id).to_s].to_i
      s=user.scores.build(:num_calls => call_n,:set_call=>true,:set_win=>false,:history_id=>user.history_id)
      s.save
    end
    redirect_to users_path
  end

  def new_wins
  	@users = User.all
  end

  def create_wins
  	#size = User.count
    users = User.where("history_id = ?", session[:history_id])
    users.each do |user|
      win_n = params["win"+(user.id).to_s].to_i
      s=user.scores.last
      s.num_wins = win_n
      if s.num_calls == win_n
        s.record = 10+win_n**2
        user.total += (10+win_n**2)
      else
        s.record = -((s.num_calls-win_n).abs**2)
        user.total += -((s.num_calls-win_n).abs**2)
      end
      s.set_win = true
      user.save
      s.save
    end
    redirect_to users_path
  end

  def undo
    users = User.where("history_id = ?", session[:history_id])
    s_w = users.first.scores.last.set_win
    users.each do |user|
      s = user.scores.last
      if s_w
        s.set_win = false
        s.num_wins = nil
        user.total-=s.record
        s.record = nil
        s.save
        user.save
      else
        s.destroy
      end
    end
    redirect_to '/'
  end
end
