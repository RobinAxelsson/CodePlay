// numbs |> List.iter (fun n -> printfn "%i" n)

for n in [ 1 .. 100 ] do
    if n % 15 = 0 then printfn "FizzBuzz"
    elif n % 3 = 0 then printfn "Fizz"
    elif n % 5 = 0 then printfn "Buzz"
    else printfn "%i" n

// let f p x =
//     match x with
//     | x when x < p -> -1
//     | x when x = p ->  0
//     | _ -> 1

// let y = Seq.groupBy (f p)
