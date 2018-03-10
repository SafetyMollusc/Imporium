require 'squib'

total_cards = 0

data = Squib.csv file: '.\res\imporium_lab_cards.csv'# do |header, value|
#    case header
#    when 'Total_Qty'
#    	total_cards = total_cards + value
#    end
#end

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
    save_pdf trim: 37.5, margin: 37.5
  #end
end
