open System

let from whom = sprintf "from %s" whom

[<EntryPoint>]
let main argv =
    let numbs = [ 1 .. 15 ]
    printfn "Hello world %s" numbs
    0 // return an integer exit code
