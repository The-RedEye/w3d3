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

def fibonacci(n)
    return [] if n == 0
    return [1] if n == 1
    return [1, 1] if n == 2
    return 0 if n > 0

    result = []
    (1..n).each do |i|
        result.concat(fibonacci(i - 1) + fibonacci(i - 2))
    end

end

