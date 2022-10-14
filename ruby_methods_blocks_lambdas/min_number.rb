def find_min *nums
    nums.reduce do |x, current_value|
        if x > current_value
            current_value
        else
            x
        end
    end
end


p find_min(20,40,12,17,10,35)  #this will return 10 which is the smallest number argument given


