# Read in data as a string
f = File.new("./csvfile.csv", "r")
data_string = f.read
f.close

# Convert string of data into array of data
data_array = data_string.split("\n")
sum = 0
deviationsum = 0
data_array.each do |data_point|
  data_point_values = data_point.split(',')
  data_value = data_point_values[2].to_f
  sum = sum + data_value
end
avg = sum / data_array.count
puts "Average: "
puts avg

data_array.each do |data_point|
  data_point_values = data_point.split(',')
  data_value = data_point_values[2].to_f
  deviation = (data_value - avg)**2
  deviationsum = deviationsum + deviation
end
standarddeviation = (deviationsum / data_array.count)**0.5
puts "Standard Deviation:"
puts standarddeviation

newdataarray = []
data_array.each do |data_point|
  data_point_values = data_point.split(',')
  data_value = data_point_values[2].to_f
  zscore = (data_value - avg)/standarddeviation
  newdataarray.push(data_point + "," + zscore.to_s)
end
newdataarray.shift
puts "Z Scores:"
puts newdataarray
newdataarray.to_s

z = File.new("./zscores.csv", "w")
z.write (newdataarray.to_s)
z.close

# Go through each data point and fetch the needed value by splitting into an array of data value.

