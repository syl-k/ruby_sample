require 'benchmark'

def erato1(n)
    numbers = (2..n).to_a
    primes = []

    loop do
        d = numbers.shift
    break if d == nil
        primes << d
        to_delete = []

        numbers.each do |x|
            to_delete << x if x % d == 0
        end

        numbers -= to_delete
    end

    return primes
end

def erato2(n)
    numbers = (2..n).to_a
    i = 0
    loop do
    break unless d = numbers[i]
        to_delete = []
        (2*d..n).step(d){|e| to_delete << e}
        numbers -= to_delete
        i += 1
    end
    return numbers
end

def erato3(n)
    sqrt = Math.sqrt(n).floor
    numbers = (2..n).to_a
    i = 0

    loop do
        break if i >= sqrt
        d = numbers[i]
        to_delete = []
        (2*d..n).step(d){|e| to_delete << e}
        numbers -= to_delete
        i += 1
    end
    return numbers
end

def erato4(n)
    numbers = (0..n).to_a
    numbers[0], numbers[1] = nil
    numbers.each do |d|
        next if d == nil
        break if (Math.sqrt(n) < d)
        (2*d..n).step(d){|e| numbers[e] = nil}
    end

    numbers.compact!
    return numbers
end

puts Benchmark.measure{ erato4(10000) }