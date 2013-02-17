class OnLoginExperiment
  include Purugin::Plugin, Purugin::Tasks
  
  description 'OnLoginExperiment', 0.1
  
  def on_enable 
    event(:player_login) do |e|
      sync_task(10) { e.player.world.players.each { |p| p.send_message 'P0wnd' } }
    end
  end
end
