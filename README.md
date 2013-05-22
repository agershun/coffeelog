CoffeeLog
=========

CoffeeLog logic programming language with declarative and logic programming elements.
Now it is only proof of concept language.

==Idea 1: Function declarations

'''coffee-script
fib 0 := 0
fib 1 := 1
fib n when n<0 := console.error "fib(n): n should be a positive number"
fib n := fib(n-1) + fib(n-2)
fib string(n) := console.error "fib(n): n should be a positive number, not string"
'''

Definition by Types:

Allowed types:
* number(x)
* string(x)
* object(x)
* function(x)
* array(x)
* Animal(x)  # any class name

Multiple arguments
add number(x),number(y) := x + y

Open arrays:
sum args… := ret += (a for a in args)

Lists (arrays):
count [a,b,c] := a+b+c
head [x,y...] := x
tail [x,y...] := y
equalHeads [x1,y1...],[x2,y2...] := x1 is x2

== Guards (when expressions)

myAbs x when x >= 0 := x
myAbs x when x < 0 := -x

or you can use functions:

myAbs x when isPositive(x) := x
myAbs x when isNegative(x) := -x
isPositive = (x) -> x > 0
isNegative = (x) -> x < 0

more complex:
mySum3 args... when args.length is 3 := args[0] + args[1] + args[2]



