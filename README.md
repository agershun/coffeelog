# CoffeeLog

## Introduction

CoffeeLog logic programming language with declarative and logic programming elements.
It based on CoffeeScript and Prolog. 
Easily describe it is a preprocessor for  CoffeeScript.
Some ideas borrowed form Haskell and GOAP.
Now it is only proof of concept language.

## Idea 1: Function declarations

    fib 0 := 0
    fib 1 := 1
    fib n := fib(n-1) + fib(n-2)
    
    
### Matching by type    

    fib n when n<0    := console.error "fib(n): n should be a positive number"
    fib string(n)     := console.error "fib(n): n should be a positive number, not string"
    fib not number(n) := console.error "fib(n): n should be a positive number"
    fib args... := if args.length > 1 then console.error "fib(n): oly one argument allowed"

#### Definition by Types:

Allowed types:
* number(x)
* string(x)
* object(x)
* function(x)
* array(x)
* Animal(x)  # any class name

#### Multiple arguments:

    add number(x),number(y) := x + y

#### Open arrays:

    sum args… := ret += (a for a in args)

#### Lists (arrays):

    sum3 [a,b,c]  := a+b+c
    head [x,y...] := x
    tail [x,y...] := y

    equalHeads [x1,y1...],[x2,y2...]  := x1 is x2

### Guards (when expressions)

    myAbs x when x >= 0 := x
    myAbs x when x < 0  := -x

or you can use functions for guard expressions:

    myAbs x when isPositive(x) := x
    myAbs x when isNegative(x) := -x
    isPositive = (x) -> x > 0
    isNegative = (x) -> x < 0

more complex:

    mySum3 args... when args.length is 3 := args[0] + args[1] + args[2]


### Terms

    move White                := console.log "White's move"
    move White(Queen)         := console.log "White Queen's move"
    move White(figure)        := console.log "White #{figure} move"    
    move White(Pawn, number)  := console.log "White pawn No. #{number} move"    

## Idea 2: Facts

    Zebra.
    Animal Zebra.
    Color Zebra, White.
    
    
#### Fact variables

    fact1 = Color Zebra, Black.
    
    
#### Fact properties

    fact2 = Color Bear, Brown {comment: "Regular color of forest bear"}.
    fact3 = Color Bear, White.
        comment: "Regular color of polar bear"
        prob: 0.5
        
    console.log "The probability of white color is #{fact3.prob}"
    
## Idea 3: Rules

    Man Sokrat.
    Mortal x :- Man x.
        
## Idea 4: Solve
    
The following three lines are equivalent:
    
    console.log(solve(Mortal(Sokrat)))
    console.log solve(Mortal(Sokrat))
    console.log Mortal(Sokrat)
    console.log Mortal Sokrat
    > true

    console.log Mortal(x)
    > ["Sokrat"]
    
    console.log solve(Mortal(x),CFL_FIRST)
    > "Sokrat"


## Idea 5: Heuristics

    Man Sokrat {priority: 200}.
    Man Plato {priority: 300}.
    Mortal x :- Man x.
   
    console.log Mortal x
    > ["Sokrat", "Plato"]
   
    console.log solve(Mortal(x),CFL_PRIORITY)
    > ["Plato", "Sokrat"]
    
   
   
        
        
    
