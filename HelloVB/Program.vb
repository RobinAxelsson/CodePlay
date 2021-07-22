Imports System

Module Program
    Sub Main(args As String())
        Console.WriteLine("VB: Hello!")
        For Each a As String In args
            Console.WriteLine(a)
        Next
    End Sub
End Module
