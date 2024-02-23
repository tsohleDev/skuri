
size_data = [{
  size: 'Small'}, {
  size: 'Medium'}, {
  size: 'Large'}, {
  size: 'Extra Large'}, {
  size: 'One Size'}, {
  UK: 3,}, {
  UK: 4,}, {
  UK: 5,}, {
  UK: 6,}, {
  UK: 7,}, {  
  UK: 8,}, {
  UK: 9,}, {
  UK: 10,}, {
  cm: 50,}, {
  cm: 55.5,}, {
  cm: 60,}, {
  cm: 65.5
}]

size_data.each do |size|
  Size.find_or_create_by!(size)
end
  
puts 'Sizes created successfully'

