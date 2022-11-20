namespace RomanAddition;

public abstract class NumeralUnit
{
    public string ShortValue { get; }
    public string LongValue { get; }
    protected NumeralUnit(string shortValue, string longValue)
    {
        ShortValue = shortValue;
        LongValue = longValue;
    }
    protected NumeralUnit Left { get; }
}