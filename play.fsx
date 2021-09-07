let name = "Bob"
let rank = "101"

printfn $"Name: {name}, rank: {rank}"

let adder (x: int, y: int) : int = x + y
let a = adder (5, 6)
printfn $"{string a}"
let add6 x : int = adder (x, 6)
let add3 x : int = adder (x, 3)
let add1 x : int = adder (x, 1)

let b = 1
let pipe = add1 >> add1 >> add1 >> add6
printfn $"{string (pipe b)}"

let pipe2 x : int =
    x
    // 1
    |> add1
    |> add1
    |> add1
    |> add6

printfn $"{string (pipe2 1)}"

let fruits = [ "banana"; "apple"; "pear"; "melon" ]
fruits
|> String.concat 
// for f in fruits do
//     printf $"{f} "
let concat = fruits |> String.concat "+"
printfn "%s", concat
// let func list =
//     list |> List.iter (fun f -> printfn $"{f}")



// let conc list =
