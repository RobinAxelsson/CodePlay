using System;
using System.Collections.Generic;
using System.Linq;

namespace RomanAddition;

public class Numeral
{
    private string _i = string.Empty;
    private string _v = string.Empty;
    private string _x = string.Empty;
    
    public string GetLong() => _x + _v + _i;
    public string Value => Short(_x + _v + _i);
    public Numeral(string unformattedNumeral)
    {
        var longNumeral = Long(unformattedNumeral);
        Sort(longNumeral);
    }

    private Numeral Add(Numeral numeral)
    {
        var unsorted = GetLong() + numeral.GetLong();
        var sorted = unsorted
            .ToList()
            .OrderByDescending(c =>c == 'X')
            .ThenByDescending(c => c == 'V')
            .ThenByDescending(c => 'I');
        
        return new Numeral(string.Join("", sorted));
    }

    public override bool Equals(object? obj)
    {
        if (obj == null) return false;
        if (obj is string s) return s == Value;
        if (obj.GetType() != this.GetType()) return false;
        return Equals((Numeral) obj);
    }

    private void SubtractI()
    {
        if (_i != string.Empty)
        {
            var stack = new Stack<char>(_i);
            stack.Pop();
            _i = string.Join("", stack);
        }
    }
    
    private void AddI()
    {
        if (_i == "IIII")
        {
            AddV();
            _i = string.Empty;
            return;
        }

        _i += "I";
    }
    
    private void AddV()
    {
        if (_v == "V")
        {
            _x += "X";
            _v = string.Empty;
            return;
        }

        _v += "V";
    }
    private void Sort(string rawString)
    {
        if(string.IsNullOrEmpty(rawString)) 
            ArgumentNullException.ThrowIfNull(nameof(rawString));

        using var iterator = rawString.GetEnumerator();
        
        while (iterator.MoveNext())
        {
            var c = iterator.Current;
            switch (c)
            {
                case 'I':
                    AddI();
                    break;
                case 'V':
                    AddV();
                    break;
                case 'X':
                    _x += 'X';
                    break;
            }
            
        } 
    }
    
    private string Short(string num)
    {
        return num
            .Replace("VIIII", "IX")
            .Replace("IIII", "IV");
    }
    
    public override string ToString() => Value;
    
    public override int GetHashCode()
    {
        return Value.GetHashCode();
    }
    
    public static Numeral operator ++(Numeral n)
    {
        return n.Add(new Numeral("I"));
    }  
    
    public static Numeral operator --(Numeral n)
    {
        n.SubtractI();
        return n;
    }

    public static Numeral operator +(Numeral n1, Numeral n2)  
    {
        return n1.Add(n2);
    }
    
    public static bool operator ==(Numeral n1, string n2)
    {
        return n1.Value == n2;
    }

    public static bool operator !=(Numeral n1, string n2)
    {
        return !(n1 == n2);
    }

    public static Numeral operator +(Numeral n1, string numeralString)  
    {
        return n1.Add(new Numeral(numeralString));
    }  
    
    private static string Long(string num)
    {
        return num.Replace("IV", "IIII");
    }

    private bool Equals(Numeral other)
    {
        return Value == other.Value;
    }
}