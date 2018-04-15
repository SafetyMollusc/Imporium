require 'squib'

total_cards = 0

COST_START_X = 655
COST_START_Y = 90
COST_HEIGHT = 75
COST_WIDTH = 75
COST_SPACE = 5
IMP_CUBES = {
  "A"=>"./res/graphics/Cube_Pink.png",
  "C"=>"./res/graphics/Cube_White.png",
  "E"=>"./res/graphics/Cube_Yellow.png",
  "F"=>"./res/graphics/Cube_Red.png",
  "L"=>"./res/graphics/Cube_Green.png",
  "M"=>"./res/graphics/Cube_Rainbow.png",
  "R"=>"./res/graphics/Cube_Gray.png",
  "W"=>"./res/graphics/Cube_Blue.png",
  "!"=>"./res/graphics/not-equal-to.png",
  ""=>nil
}
lab_data = Squib.xlsx file: '.\res\imporium_lab_cards.xlsx'# do |header, value|
#    case header
#    when 'Total_Qty'
#    	total_cards = total_cards + value
#    end
#end

Squib::Deck.new width: 1125, height: 1125, cards: lab_data['title'].size, layout: 'layout_lab.yml' do
  #$i = 0
  #$num_cards = data['Total_Qty']
  #$num_cards = $num_cards.to_i
  #while $i < $num_cards do
  	background color: 'white'
  	png file: lab_data['art'], layout: 'art'
  	rect layout: 'cut'
  	rect layout: 'safe'
  	text str: lab_data['title'], layout: 'title'
  	text str: lab_data['description'], layout: 'description'
  	text str: lab_data['play'], layout: 'play'
  	text str: lab_data['discard'], layout: 'discard'
  	text str: lab_data['cost'], layout: 'cost'
    save_png prefix: 'lab_card_'
    save_pdf file: 'imporium_lab_cards.pdf', trim: 37.5, margin: 37.5
  #end
end


recipe_data = Squib.xlsx file: '.\res\imporium_recipe_cards.xlsx'

recipe_data['Cost_01'].length.times do |i|
  recipe_data['Cost_01'][i] = IMP_CUBES[recipe_data['Cost_01'][i].to_s]
  recipe_data['Cost_02'][i] = IMP_CUBES[recipe_data['Cost_02'][i].to_s]
  recipe_data['Cost_03'][i] = IMP_CUBES[recipe_data['Cost_03'][i].to_s]
  recipe_data['Cost_04'][i] = IMP_CUBES[recipe_data['Cost_04'][i].to_s]
  recipe_data['Cost_05'][i] = IMP_CUBES[recipe_data['Cost_05'][i].to_s]
  recipe_data['Cost_06'][i] = IMP_CUBES[recipe_data['Cost_06'][i].to_s]
  recipe_data['Cost_07'][i] = IMP_CUBES[recipe_data['Cost_07'][i].to_s]
  recipe_data['Cost_08'][i] = IMP_CUBES[recipe_data['Cost_08'][i].to_s]
  recipe_data['Cost_09'][i] = IMP_CUBES[recipe_data['Cost_09'][i].to_s]
  recipe_data['Cost_10'][i] = IMP_CUBES[recipe_data['Cost_10'][i].to_s]
end
Squib::Deck.new cards: recipe_data['Recipe_Title'].size, layout: 'layout_recipe.yml' do
  #$i = 0
  #$num_cards = data['Total_Qty']
  #$num_cards = $num_cards.to_i
  #while $i < $num_cards do
    background color: 'white'
    if recipe_data['Recipe_Art'] != ''
      png file: recipe_data['Recipe_Art'], layout: 'art'
    end
    rect layout: 'cut'
    rect layout: 'safe'
    text str: recipe_data['Recipe_Title'], layout: 'title'
    text str: recipe_data['Recipe_Purchase'], layout: 'purchase'
    text str: recipe_data['Recipe_Type'], layout: 'type'
    text str: recipe_data['Recipe_Effect'], layout: 'description'
    text str: recipe_data['Recipe_Flavour'], layout: 'flavour'
    text str: recipe_data['Recipe_Value'], layout: 'value'
    png file: recipe_data['Cost_01'], x: COST_START_X, y: COST_START_Y, width: COST_WIDTH, height: COST_HEIGHT 
    png file: recipe_data['Cost_02'], x: COST_START_X, y: COST_START_Y + 1 * (COST_HEIGHT + COST_SPACE), width: COST_WIDTH, height: COST_HEIGHT
    png file: recipe_data['Cost_03'], x: COST_START_X, y: COST_START_Y + 2 * (COST_HEIGHT + COST_SPACE), width: COST_WIDTH, height: COST_HEIGHT
    png file: recipe_data['Cost_04'], x: COST_START_X, y: COST_START_Y + 3 * (COST_HEIGHT + COST_SPACE), width: COST_WIDTH, height: COST_HEIGHT
    png file: recipe_data['Cost_05'], x: COST_START_X, y: COST_START_Y + 4 * (COST_HEIGHT + COST_SPACE), width: COST_WIDTH, height: COST_HEIGHT
    png file: recipe_data['Cost_06'], x: COST_START_X, y: COST_START_Y + 5 * (COST_HEIGHT + COST_SPACE), width: COST_WIDTH, height: COST_HEIGHT
    png file: recipe_data['Cost_07'], x: COST_START_X, y: COST_START_Y + 6 * (COST_HEIGHT + COST_SPACE), width: COST_WIDTH, height: COST_HEIGHT
    png file: recipe_data['Cost_08'], x: COST_START_X, y: COST_START_Y + 7 * (COST_HEIGHT + COST_SPACE), width: COST_WIDTH, height: COST_HEIGHT
    png file: recipe_data['Cost_09'], x: COST_START_X, y: COST_START_Y + 8 * (COST_HEIGHT + COST_SPACE), width: COST_WIDTH, height: COST_HEIGHT
    png file: recipe_data['Cost_10'], x: COST_START_X, y: COST_START_Y + 9 * (COST_HEIGHT + COST_SPACE), width: COST_WIDTH, height: COST_HEIGHT
    save_png prefix: 'recipe_card_'
    save_pdf file: 'imporium_recipe_cards.pdf', trim: 37.5, margin: 75
  #end
end

Squib::Deck.new cards: 4, layout: 'layout_player_ref.yml' do
  #$i = 0
  #$num_cards = data['Total_Qty']
  #$num_cards = $num_cards.to_i
  #while $i < $num_cards do
    background color: 'white'
    rect layout: 'cut'
    rect layout: 'safe'
    text str: "How To Play Imporium", layout: 'title'

    title_phase_1 = "Phase 1 (Imp Arrival)"
    txt_phase_1 = "* Add 2 imps per Aspirator to the portal bag\n* Draw >= 1 and <= STA imps from the portal bag"
    title_phase_2 = "Phase 2 (Lab Prep)"
    txt_phase_2 = "If the portal is open, draw one imp. If you have not passed,\nyou lose 1 stamina and discard the imp.\n"\
      "Do any (or none) of the following:\n  * Discard any number of lab cards\n  * Give a gift\n  * Use a consumable\n"\
      "  * Buy another player\'s recipe\nAnd then do one of:\n  * Play a lab component\n  * Activate equipment\n  * Pass\n"\
      "On passing, total up: buys, credits, imps, dispensers, lab\ncards on played and discarded cards. Buy lab cards,\n"\
      "place dispensers, spend any leftover credits on cards\nand draw new hand."
    title_phase_3 = "Phase 3 (Process)"
    txt_phase_3 = "On your turn, move one imp through your lab from an\nAspirator"
    title_phase_4 = "Phase 4 (Cleanup)"
    txt_phase_4 = "Check for win conditions:\n  * Player sold 6 or more recipes\n  * Three colours of imps are no longer available\n"\
      "IF no winner:\n  * Flip any purchased/used recipes back to facing up"

    text str: title_phase_1, layout: 'sub_1'
    text str: txt_phase_1, layout: 'body_1'
    text str: title_phase_2, layout: 'sub_2'
    text str: txt_phase_2, layout: 'body_2'
    text str: title_phase_3, layout: 'sub_3'
    text str: txt_phase_3, layout: 'body_3'
    text str: title_phase_4, layout: 'sub_4'
    text str: txt_phase_4, layout: 'body_4'
    save_png prefix: 'player_ref_card_'
    save_pdf file: 'imporium_player_ref.pdf', trim: 37.5, margin: 75
  #end
end
