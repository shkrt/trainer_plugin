# frozen_string_literal: true

module TrainerPlugin
  module Api
    class StatsController < TrainerPlugin::ApplicationController
      def user_stats
        render json: find_activities(@user_class.find(params[:user_id]))
      end

      def user_clicks
        render json: find_clicks(@user_class.find(params[:user_id]))
      end

      def activity_summary
        render json: summary(:find_activities)
      end

      def clicks_summary
        render json: summary(:find_clicks)
      end

      private

      def summary(method_name)
        summ = {}
        @user_class.find_each { |u| summ[u.email] = send(method_name, u) }
        summ
      end

      def find_clicks(user)
        events = user.ahoy_events.where(name: '$view').select(:properties)
        result = Hash.new 0
        events.each { |x| result[x.properties['url']] += 1 }
        result
      end

      def find_activities(user)
        events = user.ahoy_events.select(:name)
        result = Hash.new 0
        events.each { |x| (result[x.name] += 1) if x.name != '$view' }
        result
      end
    end
  end
end
