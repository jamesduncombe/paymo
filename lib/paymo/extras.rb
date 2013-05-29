module Paymo
  class Extras

    def initialize(user_id)
      @paymo_entries_instance = Paymo::Entries.new
      @cache_instance         = Cache.new(Paymo::Projects.new, :price_per_hour)
      @end_time               = Time.now
      @user_id                = user_id
    end

    def earnt_today?
      @start_time = Date.today.to_time
      run
    end

    def earnt_this_month?
      @start_time = Time.new(Time.now.year, Time.now.month)
      run
    end

    private

      def run
        get_entries
        build_projects_and_hours
        build_per_hour_and_total
        sum_total_hours
      end

      def get_entries
        @entries = @paymo_entries_instance.find_by_user(@user_id, start: @start_time, end: @end_time)
      end

      def build_projects_and_hours
        @project_ids_and_hours = @entries.map do |entry|
          {
            project_id: entry.project_id,
            hours:      ((entry.end.to_time - entry.start.to_time) / 60 / 60)
          }
        end
      end

      def build_per_hour_and_total
        @project_ids_and_hours.each do |entry|
          entry[:per_hour] = @cache_instance.get(entry[:project_id])
          entry[:total]    = (entry[:per_hour] * entry[:hours])
        end
      end

      def sum_total_hours
        @project_ids_and_hours.inject(0) { |sum, hash| sum + hash[:total] }
      end

  end
end