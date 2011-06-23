require "time_remaining/version"
require 'rubygems'
require 'algorithms'
require 'time_diff'

class TimeRemaining
  
  def initialize( min_data=2, max_duration=2 )
    @minimum_data  = min_data
    @maximum_ticks = max_duration * 10
    @queue = Containers::Queue.new
    @start_time = Time.now
    
    @current = {}
    @oldest  = {}
  end
  
  def reset
    @queue.clear
    @start_time = nil
  end
  
  def add progress
    clear_expired
    current_ticks = elapsed_ticks
    @current = {:current_ticks => current_ticks,:progress=>progress}

    @queue.push(@current);

    if @queue.size == 1
      @oldest = @current
    end
  end
  
  def completed_in
    oldest  = @oldest;
    current = @current;

    if (@queue.size < @minimum_data || oldest[:progress] == current[:progress])
      return 99999
    end
    
    #puts "(1.0 - #{current[:progress].to_f}) * ((#{current[:current_ticks]} - #{oldest[:current_ticks]}) / (#{current[:progress]} - #{oldest[:progress]}))"

    finishedInTicks = (1.0 - current[:progress].to_f) * ((current[:current_ticks] - oldest[:current_ticks]) / (current[:progress] - oldest[:progress]));
    finishedInTicks
  end
  
  def completed_at
    Time.at(Time.now.to_i + completed_in)
  end
  
  def time_remaining_available?
    return (@queue.size >= @minimum_data && @oldestcurrent[:progress] != @currentcurrent[:progress]);
  end
  
  def to_s
    Time.diff( completed_at, Time.now-1 )[:diff]
  end
  
  private
    
    def elapsed_ticks
      (Time.now-@start_time).to_i
    end
    
    def clear_expired
      expired = elapsed_ticks - @maximum_ticks;

      while (@queue.size > @minimum_data && @queue.next[:current_ticks] < expired) do
        @oldest = @queue.pop
      end
    end
     
end
