def flatten_arr(arr)
 result = []

 arr.each do |element| 
    if element.is_a?(Array)
      result += flatten_arr(element)
    else
      result << element
    end
 end
  result 
end

num = [12,3,4,[2,3,4,[2,3,4,5]],[3,3,3]]
p flatten_arr(num)