#
# Regular definition
#

fib1(n) = ->
if n is 0 then 0
	else if n is 1 then 1
	else if n < 0 then console.error “fib1(n): n should be more than 0." 
	else fib1(n-1) + fib1(n-2)


#
# Declarative definition
#

fib2 0 := 0
fib2 1 := 1
fib2 n when n<0 := console.error “fib(n): n should be more than 0.”
fib2 n := fib2(n-1) + fib2(n-2)

#
# Tests
#

console.log fib1(10)
console.log fib(10)
