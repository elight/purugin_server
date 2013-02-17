class OnLoginExperiment
  include Purugin::Plugin, Purugin::Tasks
  description 'OnLoginExperiment', 0.1

  attr_accessor :world
  
  def on_enable 
    event(:player_login) do |e|
      self.world = e.player.world
      sync_task(10) do
        message_all("pwned")
        sync_task(1) do
          message_all("bitch")
        end
      end
    end
  end

  private

  def message_all(msg)
    world.players.each do |p|
      p.send_message msg
    end
  end
end
