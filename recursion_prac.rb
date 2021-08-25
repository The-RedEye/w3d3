require "byebug"
#iterative version
def iterative_range(start, final)
    result = []    
    (start...final).each do |i|
        result << i
    end
    result
end

#recursive version

def recursive_range(start, final)
    return [] if final < start
    return [start] if start + 1 == final
    
    result = []
    result.concat([start] + recursive_range(start + 1, final))
   
    # result.concat([start])
    # result.concat(recursive_range(start + 1, final))
end

# p recursive_range(1, 5)

def exp_1(base, power)
    return 1 if power == 0
    return base if power == 1

    base * exp_1(base, power - 1)
end

# p exp_1(4, 3)

def exp_2(base, power)
    return 1 if power == 0
    return base if power == 1

    if power % 2 == 0
        return exp_2(base, power / 2) ** 2
    else
        return base * exp_2(base , (power - 1) / 2) ** 2
    end
end
# p exp_2(4, 3)


#base:
# if length == 1 return arr.first

#step
def deep_dup(arr)
    #base
    return arr.first if arr.length == 1
    result = []
    arr.each do |ele|
        if ele.is_a?(Array)
            result << deep_dup(ele)
        else
            result << ele
        end
    end
    result
end

# robot_parts = [
#     ["nuts", "bolts", "washers"],
#     ["capacitors", "resistors", "inductors"]
# ]
# p deep_dup(robot_parts)

#cur idx - cur idx - 1
#to get fib(n) -> you will need prev 2 -> fib(n - 1) + fib(n - 2)

#------------------NEW CODE
# create loop, go through until i = n
# shovel fib(n) into result
#retun result


def fibonacci(n)

    result = []

    (1...n).each do |i|
        result << fib(i)
    end

    result
end

def fib(n)
    return 1 if n <=2

    fib(n-1) +  fib(n-2)
end

# p fibonacci(10)

#find midpoint of array
#compare array[midpoint] == target
    #if array[midpoint]==target, return midpoint
    #if midpoint>target , target in lower half. recurse from 0...midpoint, (Return 0+call)
    #else, target in upper, recurse midpoint+1...arr.length -(Return:mid + call)


def bsearch(arr, target)
    # debugger
    return nil if !arr.include?(target)
    midpoint = arr.length/2
   
    # debugger
    if arr[midpoint]==target
        return midpoint
    elsif arr[midpoint]>target
        return 0 + bsearch(arr[0...midpoint], target)
    else
        return midpoint+1 + bsearch(arr[midpoint+1..-1], target)
    end

end
#  p '-------------------'
# p bsearch([1, 2, 3], 1) # => 0
# p bsearch([2, 3, 4, 5], 3) # => 1
# p bsearch([2, 4, 6, 8, 10], 6) # => 2
# p bsearch([1, 3, 4, 5, 9], 5) # => 3
# p bsearch([1, 2, 3, 4, 5, 6], 6) # => 5
# p bsearch([1, 2, 3, 4, 5, 6], 0) # => nil
# p bsearch([1, 2, 3, 4, 5, 7], 6) # => nil

# create a recursive func that splits in half if length of array is > 2
# base case :length is two -> swap the two elements if they arent in order
# else return
# create a merge helper method to merge them together

def merge_sort(arr)
    midpoint = arr.length / 2
    if arr.length > 2
        first_half = arr[0...midpoint]
        second_half = arr[midpoint...arr.length]
                            #debugger
        return merge(merge_sort(first_half), merge_sort(second_half))
        #return merge(merge_sort(arr[0...midpoint]), merge_sort(arr[midpoint...arr.length]))
        p "merge complete"
                            #debugger
    elsif arr.length == 1
        return arr
    else
        if arr[0] < arr[1]
            return arr
        else
            return [arr[1], arr[0]]
        end
    end
end

# two counters 1 for first 1 for 2nd
# compare the first two eles and shovel in the smaller ele inc counter 1
# while both counters are < length of respec arrays -> do this loop where
# we compare the element @ the index to the last <<'d ele
# which ever one is smaller gets <<'d in AND inc the respec counter 

def merge(arr1, arr2)
    temp = []
                    #debugger
    count1 = 0
    count2 = 0

    while count1 < arr1.length || count2 < arr2.length
                    #debugger
        if arr1[count1] == nil
            return temp.concat(arr2[count2...arr2.length])
        elsif arr2[count2]== nil
            return temp.concat(arr1[count1...arr1.length])
        elsif arr1[count1] < arr2[count2]
            temp << arr1[count1]
            count1 += 1 
                    #debugger
        else
            temp << arr2[count2]
            count2 += 1
                    #debugger
        end
    end
    #debugger
    temp
end


# p merge_sort(a)

#create a empty arr
#push into it all the subsets of the current arr
#recursively call again with the arr unshifted off

#base -> empty arr

#step -> concat onto the empty all subsets

#helper function that accepts an init num and an array
#return an array with all subsets with that number AND the array itself 
# def subsets(nums)
#     result = []

#     (0...nums.length).each do |i|
        
#     end

#     return result if nums.empty?

#     result.concat(create_subs(nums[0], nums))
# end

# def create_subs(num, arr) #   1 || [2, 3]
#     result = []
    
#     result.concat(num)
#     result.concat(num) + create_subs(arr.shift, arr)

#     result
# end
# a = [2, 5, 6, 9, 3, 1]
# p subsets(a)

#have an achor
#have a result arr and a temp arr
#make a loop going through the entire arr
#idex becomes anchor
#recurs call a helper method -> anchor and the rest of the arr
#return the value into the temp arr
#shovel temp arr into the result arr

def perm(arr)
    result = []

    (0...arr.length).each do |i|
        temp = []
        pass_thru = arr.except(arr[i])
        temp << arr[i].concat(help(arr))
        else
            
        end
    end
end

def help(arr)

end