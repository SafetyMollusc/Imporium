require 'squib'

total_cards = 0

data = Squib.csv file: '.\res\imporium_lab_cards.csv'# do |header, value|
#    case header
#    when 'Total_Qty'
#    	total_cards = total_cards + value
#    end
#end

=begin

Squib::Deck.new width: 1125, height: 1125, cards: data['title'].size, layout: 'layout_lab.yml' do
  #$i = 0
  #$num_cards = data['Total_Qty']
  #$num_cards = $num_cards.to_i
  #while $i < $num_cards do
  	background color: 'white'
  	png file: data['art'], layout: 'art'
  	rect layout: 'cut'
  	rect layout: 'safe'
  	#rect layout: 'title_bkgd'
  	#rect layout: 'play_bkgd'
  	#rect layout: 'discard_bkgd'
  	text str: data['title'], layout: 'title'
  	text str: data['description'], layout: 'description'
  	text str: data['play'], layout: 'play'
  	text str: data['discard'], layout: 'discard'
  	text str: data['cost'], layout: 'cost'
    save_png
    save_pdf file: 'imporium_lab_cards.pdf', trim: 37.5, margin: 37.5
  #end
end

=end

recipe_data = Squib.xlsx file: '.\res\imporium_recipe_cards.xlsx'

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
    #rect layout: 'title_bkgd'
    #rect layout: 'play_bkgd'
    #rect layout: 'discard_bkgd'
    text str: recipe_data['Recipe_Title'], layout: 'title'
    text str: recipe_data['Recipe_Purchase'], layout: 'purchase'
    text str: recipe_data['Recipe_Type'], layout: 'type'
    text str: recipe_data['Recipe_Effect'], layout: 'description'
    text str: recipe_data['Recipe_Flavour'], layout: 'flavour'
    text str: recipe_data['Recipe_Value'], layout: 'value'
    save_png
    save_pdf file: 'imporium_recipe_cards.pdf', trim: 37.5, margin: 37.5
  #end
end
