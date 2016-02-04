module TrainerPlugin
  class StatsController < ApplicationController
    def user_stats
      render json: (get_activities(User.find(params[:user_id])))
    end

    def user_clicks
      render json: (get_clicks(User.find(params[:user_id])))
    end

    def activity_summary
      summ = Hash.new 0
      User.all.each { |u| summ[u.email] = get_activities(u) }
      render json: summ
    end

    def clicks_summary
      summ = Hash.new 0
      User.all.each { |u| summ[u.email] = get_clicks(u) }
      render json: summ
    end

    private

    def get_activities(user)
      events = user.ahoy_events
      result = Hash.new 0
      events.each { |x| (result[x.name] += 1) if x.name != "$view" }
      result
    end

    def get_clicks(user)
      events = user.ahoy_events.select { |x| x.name == '$view' }
      result = Hash.new 0
      events.each { |x| result[x.properties['url']] += 1 }
      result
    end
  end
end
