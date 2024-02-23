# Colour data

colour_data = [{
  name: 'Black',
  hex: '#000000',
  description: 'The absence of colour'
}, {
  name: 'White',
  hex: '#FFFFFF',
  description: 'The presence of all colours'
}, {
  name: 'Red',
  hex: '#FF0000',
  description: 'The colour of blood and fire'
}, {
  name: 'Green',
  hex: '#00FF00',
  description: 'The colour of nature'
}, {
  name: 'Blue',
  hex: '#0000FF',
  description: 'The colour of the sky and sea'
}, {
  name: 'Yellow',
  hex: '#FFFF00',
  description: 'The colour of sunshine'
}, {
  name: 'Purple',
  hex: '#800080',
  description: 'The colour of royalty'
}, {
  name: 'Orange',
  hex: '#FFA500',
  description: 'The colour of the fruit'
}, {
  name: 'Pink',
  hex: '#FFC0CB',
  description: 'The colour of love'
}, {
  name: 'Brown',
  hex: '#A52A2A',
  description: 'The colour of earth'
}, {
  name: 'rose',
  hex: '#FF007F',
  description: 'The colour of the flower'
}, {
  name: 'Violet',
  hex: '#8A2BE2',
  description: 'The colour of the flower'
}, {
  name: 'Indigo',
  hex: '#4B0082',
  description: 'The colour of the flower'
}, {
  name: 'Gold',
  hex: '#FFD700',
  description: 'The colour of the metal'
}, {
  name: 'Silver',
  hex: '#C0C0C0',
  description: 'The colour of the metal'
}]

# Create the colours
colour_data.each do |colour|
  Colour.find_or_create_by!(colour)
end

puts 'Colours created'
