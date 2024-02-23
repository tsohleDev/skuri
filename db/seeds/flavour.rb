
flavour_data = [{
  name: 'Chocolate',
  description: 'Chocolate is a popular flavor for dietary supplements. It is made from cocoa beans, and is known for its rich and creamy taste. Chocolate is a popular flavor for dietary supplements, and is available in a variety of products.',
}, {
  name: 'Vanilla',
  description: 'Vanilla is a popular flavor for dietary supplements. It is made from vanilla beans, and is known for its sweet and creamy taste. Vanilla is a popular flavor for dietary supplements, and is available in a variety of products.',
}, {
  name: 'Strawberry',
  description: 'Strawberry is a popular flavor for dietary supplements. It is made from strawberries, and is known for its sweet and fruity taste. Strawberry is a popular flavor for dietary supplements, and is available in a variety of products.',
}, {
  name: 'Banana',
  description: 'Banana is a popular flavor for dietary supplements. It is made from bananas, and is known for its sweet and fruity taste. Banana is a popular flavor for dietary supplements, and is available in a variety of products.',
}, {
  name: 'Mint',
  description: 'Mint is a popular flavor for dietary supplements. It is made from mint leaves, and is known for its fresh and cool taste. Mint is a popular flavor for dietary supplements, and is available in a variety of products.',
}]

flavour_data.each do |flavor|
  Flavour.find_or_create_by!(flavor)
end

puts 'Flavors created successfully'

