using System;

namespace HelloCsharp
{
    class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine("C#: Hello!");
            foreach (var a in args)
            {
                System.Console.WriteLine(a);
            }
        }
    }
}
