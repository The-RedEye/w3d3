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