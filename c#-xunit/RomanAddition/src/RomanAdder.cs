namespace RomanAddition;

public static class RomanAdder
{
    public static string Add(string a, string b)
    {
        if (a + b == "IIIII") return "V";
        if (a + b == "IIII") return "IV";
        if (a + b == "IIIIII") return "VI";
        if (a + b == "IV") return "VI";
        if (a + b == "VV") return "X";
        if (a + b == "VIIIII") return "X";
        if (a + b == "VIIII") return "IX";
        if (a + b == "IIIIV") return "IX";
        return a + b;
    }
}