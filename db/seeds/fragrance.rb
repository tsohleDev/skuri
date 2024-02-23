fragrance_data = [
    {
        'name': 'Fresh Linen',
        'description': 'Fresh Linen fragrance captures the crisp, clean scent of freshly laundered linens, evoking a sense of cleanliness and comfort.',
    },
    {
        'name': 'Citrus Burst',
        'description': 'Citrus Burst fragrance is zesty and invigorating, combining notes of lemon, lime, and orange to create a refreshing and uplifting aroma.',
    },
    {
        'name': 'Floral Bliss',
        'description': 'Floral Bliss fragrance is a delicate bouquet of spring flowers, with hints of jasmine, rose, and lily of the valley, offering a soothing and feminine scent.',
    },
    {
        'name': 'Ocean Breeze',
        'description': 'Ocean Breeze fragrance captures the essence of a cool sea breeze, with hints of saltwater, sea moss, and driftwood, creating a calming and revitalizing aroma.',
    },
    {
        'name': 'Warm Vanilla',
        'description': 'Warm Vanilla fragrance is comforting and inviting, with notes of rich vanilla bean and creamy caramel, enveloping you in a cozy and indulgent scent.',
    },
    {
        'name': 'Sandalwood Musk',
        'description': 'Sandalwood Musk fragrance is exotic and sensual, blending warm sandalwood with musky undertones, creating a luxurious and captivating aroma.',
    },
    {
        'name': 'Spiced Amber',
        'description': 'Spiced Amber fragrance is warm and spicy, with notes of amber, cinnamon, and cloves, invoking a sense of coziness and nostalgia.',
    },
]

fragrance_data.each do |fragrance|
  Fragrance.find_or_create_by!(fragrance)
end

puts "Fragrance data has been seeded successfully!"
