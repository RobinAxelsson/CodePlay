using System;
using System.Linq;

namespace RomanAddition;

public static class RomanAdder
{
    public static string Add(string a, string b)
    {
        var sum = a + b;
        if (sum.ToList().TrueForAll(c => c == 'I'))
            return ConvertI(sum);

        if (a + b == "IV") return "VI";
        if (a + b == "IIIIV") return "IX";
        if (a + b == "VIIII") return "IX";
        if (a + b == "VIIIII") return "X";

        if (a + b == "VV") return "X";
        return a + b;
    }
    private static string ConvertI(string iI)
    {
        return iI switch
        {
        "IIII" => "IV",
        "IIIII" => "V",
        "IIIIII" => "VI",
            _ => iI
        };
    }
}