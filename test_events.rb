event "the sky is falling" do
  @sky_height < 300
end

event "its getting closer" do
  @sky_height < @mountain_height
end

setup do
  puts "setting the sky"
  @sky_height = 100
end

setup do
  puts "setting up mountains"
  @mountain_height = 200
end
