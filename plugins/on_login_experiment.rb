class OnLoginExperiment
  include Purugin::Plugin, Purugin::Tasks
  description 'OnLoginExperiment', 0.1

  attr_accessor :world
  
  def on_enable 
    event(:player_login) do |e|
      self.world = e.player.world
      TaskChain.
        task(10) { message_all("pwned") }.
        task(1)  { message_all("bitch") }
    end
  end

  private

  def message_all(msg)
    world.players.each do |p|
      p.send_message msg
    end
  end

  class TaskChain
    include Purugin::Tasks
    
    attr_reader :delay
    
    def initialize(delay, &block)
      @delay = delay
      sync_task(delay, &block)
    end

    def self.task(delay = 0, &block)
      TaskChain.new(delay, &block)
    end
    
    def task(delay = 0, &block)
      TaskChain.new(self.delay + delay, &block)
    end
  end
end
