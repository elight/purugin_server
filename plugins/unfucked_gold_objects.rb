import 'org.bukkit.Material'
import 'org.bukkit.inventory.ItemStack'
import 'org.bukkit.inventory.ShapelessRecipe'

class UnfuckedGoldObjects
  include Purugin::Plugin
  
  description 'UnfockedGoldObjects', 0.1
  
  ITEM_TO_NUGGET_MAP = {
    :GOLD_AXE => 3,
    :GOLD_BOOTS => 4,
    :GOLD_CHESTPLATE => 8,
    :GOLD_HELMET => 5,
    :GOLD_HOE => 2,
    :GOLD_LEGGINGS => 7,
    :GOLD_PICKAXE => 3,
    :GOLD_SPADE => 1,
    :GOLD_SWORD => 2
  }
  
  def on_enable
    ITEM_TO_NUGGET_MAP.each do |material, num_nuggets|
      result = ItemStack.new(Material::GOLD_NUGGET, num_nuggets)
      recipe = ShapelessRecipe.new(result)
      material_const = Material.const_get(material)
      recipe.addIngredient(1, material_const)
      getServer.addRecipe( recipe )
    end
  end
end
