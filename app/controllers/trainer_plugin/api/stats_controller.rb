module TrainerPlugin
  module Api
    class StatsController < TrainerPlugin::ApplicationController
      before_filter :set_procs

      def user_stats
        render json: @get_activities.call(@user_class.find(params[:user_id]))
      end

      def user_clicks
        render json: @get_clicks.call(@user_class.find(params[:user_id]))
      end

      def activity_summary
        render json: get_summary(@get_activities)
      end

      def clicks_summary
        render json: get_summary(@get_clicks)
      end

      private

      def get_summary(proc_name)
        summ = {}
        @user_class.all.each { |u| summ[u.email] = proc_name.call(u) }
        summ
      end

      def set_procs
        @get_clicks = proc do |user|
          events = user.ahoy_events.select { |x| x.name == '$view' }
          result = Hash.new 0
          events.each { |x| result[x.properties['url']] += 1 }
          result
        end

        @get_activities = proc do |user|
          events = user.ahoy_events
          result = Hash.new 0
          events.each { |x| (result[x.name] += 1) if x.name != '$view' }
          result
        end
      end
    end
  end
end
