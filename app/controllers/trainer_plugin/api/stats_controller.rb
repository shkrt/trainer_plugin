module TrainerPlugin
  module Api
    class StatsController < TrainerPlugin::ApplicationController
      def user_stats
        render json: (get_activities(@user_class.find(params[:user_id])))
      end

      def user_clicks
        render json: (get_clicks(@user_class.find(params[:user_id])))
      end

      def activity_summary
        summ = {}
        @user_class.all.each { |u| summ[u.email] = get_activities(u) }
        render json: summ
      end

      def clicks_summary
        summ = {}
        @user_class.all.each { |u| summ[u.email] = get_clicks(u) }
        render json: summ
      end

      private

      def get_activities(user)
        events = user.ahoy_events
        result = Hash.new 0
        events.each { |x| (result[x.name] += 1) if x.name != '$view' }
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
end
