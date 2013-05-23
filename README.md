# CoffeeLog = CoffeeScript+Prolog+some Haskell
A Logic Programming Language

## Introduction

CoffeeLog logic programming language with declarative and logic programming elements.
It based on CoffeeScript and Prolog. 
Easily describe it is a preprocessor for  CoffeeScript.
Some ideas borrowed form Haskell and GOAP.
Now it is only proof of concept language.

## Idea 1: Function declarations

### First Sample - Fibonaci numbers

Here is a first easy sample. Function definition in Haskell style.

    fib 0 := 0
    fib 1 := 1
    fib n when n<0 := console.error "fib(n): n should be a positive number"
    fib n := fib(n-1) + fib(n-2)

### Pattern matching by type    

    fib string(n)     := console.error "fib(n): n should be a positive number, not string"
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

    myAbs 0 := 0
    myAbs x when isPositive(x) := x
    myAbs x when isNegative(x) := -x
    isPositive = (x) -> x > 0
    isNegative = (x) -> x < 0

more complex samples:

    mySum2 x,y := x+y
    mySum3 args... when args.length is 3 := args[0] + args[1] + args[2]

    
## Idea 2: Facts

You can define facts the same way Like in Prolog.

    animal(zebra).
    color(zebra, white).
    
#### Fact properties

    color(bear,brown) {comment: "Regular color of forest bear"}.
    color(bear,white).
        comment: "Regular color of polar bear"
        prob: 0.5
            
## Idea 3: Rules

Again you can define rules like in Prolog:

    man(sokrat).
    mortal(X) :- man(X).
        
## Idea 4: Solve
    
The following three lines are equivalent:
    
    console.log solve(mortal(sokrat))

    console.log solve(mortal(X))
    > ["sokrat"]
    
    console.log solve(mortal(X),CFL_FIRST)
    > "sokrat"


## Idea 5: Heuristics

    man(sokrat) {priority: 200}.
    man(plato) {priority: 300}.
    mortal(X) :- man(x).
   
    console.log solve(mortal(X))
    > ["sokrat", "plato"]
   
    console.log solve(mortal(X),CFL_PRIORITY)
    > ["plato", "sokrat"]
    
   
   
## Other future not realized ideas   
   
## Idea 6: States

    -: At(A),Level(Low),BoxAt(C),BananasAt(B).
    
## Idea 7: Actions, Preconditions, and Effects

    Move(x,y) :- At(x),Level(Low) -: At(y).
    ClimbUp(location) :- At(location), BoxAt(location), Level(low) -: Level(high).              
    ClimbDown(location) :- At(location), BoxAt(location), Level(High) -: Level(Low).
    MoveBox(x,y) :- At(x), BoxAt(x), Level(Low) -: BoxAt(y), At(y).
    TakeBananas(location) :- At(location), BananasAt(location), Level(High) -: Have(Bananas).

## Idea 8: Goals

    strategy = goal Have(Banana)
    console.log strategy.plan
    > [Move(A,B),ClimbUp(C),TakeBananas(C)]
    
## Idea 9: Execution

    make strategy
    
## Idea 10: Bayes Probabilities

    Traffic :- Accident {prob:0.01}.
    Traffic :- President {prob:0.1}.
    
    console.log probability(Traffic :- Accident)
    > 0.14


## Idea 11: Graphs

    A:-B.
    B:-C.
    console.log path C,A.
    > [C,B,A]
    
## Idea 12: Knowledge Base

## Idea 13: Environment

## Conclusion
It just idea.


   
        
        
    
