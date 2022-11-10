# frozen_string_literal: true
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# User.destroy_all if User.first 
# 5.times do  |x|
#     User.create(name:"name#{x}");
# end 

user1 = User.first  

Food.destroy_all if Food.first 
5.times do |x| 
    Food.create(name:"name#{x}",measurement_unit:"kg",price:x*2, quantity:x,user_id:user1.id)
end 

recipe1 = Recipe.create(user: user1, name: 'First recipe', preparation_time: '60', cooking_time: '30', description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque at tristique nibh. Sed malesuada non mi in consequat. Pellentesque porttitor quam et tellus pellentesque facilisis. Proin non turpis arcu. Pellentesque id purus sem. Aliquam erat volutpat. Praesent commodo, lorem eu tincidunt blandit, quam mi tempor dui, quis finibus magna nulla vel nibh. In quis augue ipsum. Donec a urna a tortor gravida egestas.', public: true)
recipe2 = Recipe.create(user: user1, name: 'Second recipe', preparation_time: '90', cooking_time: '50', description: 'Nam tempus, eros non eleifend rhoncus, mi urna tristique eros, eget cursus enim nisl eleifend mauris. Duis ut lacus placerat, mollis dui eget, efficitur lectus. Phasellus sodales orci pulvinar velit auctor mattis. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Etiam a iaculis lorem. Pellentesque ac auctor justo, vitae scelerisque massa. Suspendisse potenti.', public: true)
recipe3 = Recipe.create(user: user1, name: 'Third recipe', preparation_time: '80', cooking_time: '60', description: 'Nulla non nulla eleifend, tincidunt mauris ut, ultrices lorem. Morbi sagittis dolor ac congue consequat. Nulla at velit euismod felis elementum pulvinar sit amet ut elit. Fusce sed gravida ligula. Nunc in diam augue. Pellentesque vitae mi sed massa tristique ultrices et ut orci. Vivamus consequat odio porttitor viverra sodales. Curabitur interdum eget lorem sit amet venenatis. Proin nibh libero, eleifend in pharetra ac, gravida sed odio. Donec sagittis pellentesque est nec porta. Cras odio magna, cursus sit amet gravida dignissim, dapibus non erat. Integer maximus purus vel erat blandit lacinia. Suspendisse quis commodo ante. Aliquam ac ultricies lorem. Suspendisse auctor nulla vel mattis condimentum. Maecenas tincidunt porttitor elementum.', public: true)
recipe4 = Recipe.create(user: user1, name: 'Fourth recipe', preparation_time: '70', cooking_time: '50', description: 'Ut sodales ullamcorper massa et porttitor. Cras vitae elit non arcu euismod iaculis. Sed volutpat metus risus, ac hendrerit lacus ultricies eu. Nullam eu purus nec elit interdum molestie. In egestas viverra magna, eu facilisis nisl ultricies quis. Morbi tempor lectus eget auctor gravida. Nunc auctor nisi eget commodo maximus. Mauris cursus ipsum vel vulputate tempus. Nulla imperdiet libero a condimentum viverra. Quisque in facilisis nulla, vestibulum consequat dui. Proin iaculis sollicitudin ultrices. Sed mollis turpis vel aliquet pretium.', public: true)

