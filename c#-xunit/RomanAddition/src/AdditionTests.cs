using FluentAssertions;
using Xunit;

namespace RomanAddition;

public class AdditionTests
{
    [Fact]
    public void Add_I_I()
    {
        RomanAdder.Add("I", "I").Should().Be("II");
    }
    
    [Fact]
    public void Add_II_I()
    {
        RomanAdder.Add("II", "I").Should().Be("III");
    }
    
    [Fact]
    public void Add_II_III()
    {
        RomanAdder.Add("II", "III").Should().Be("V");
    }
    
    [Fact]
    public void Add_III_II()
    {
        RomanAdder.Add("III", "II").Should().Be("V");
    }
    
    [Fact]
    public void Add_I_IIII()
    {
        RomanAdder.Add("I", "IIII").Should().Be("V");
    }
    
    [Fact]
    public void Add_I_III()
    {
        RomanAdder.Add("I", "III").Should().Be("IV");
    }
    
    [Fact]
    public void Add_III_III()
    {
        RomanAdder.Add("III", "III").Should().Be("VI");
    }
    
    [Fact]
    public void Add_V_I()
    {
        RomanAdder.Add("V", "I").Should().Be("VI");
    }
    [Fact]
    public void Add_V_II()
    {
        RomanAdder.Add("V", "II").Should().Be("VII");
    }
    [Fact]
    public void Add_V_III()
    {
        RomanAdder.Add("V", "III").Should().Be("VIII");
    }
    
    [Fact]
    public void Add_V_V()
    {
        RomanAdder.Add("V", "V").Should().Be("X");
    }
    
    [Fact]
    public void Add_VII_III()
    {
        RomanAdder.Add("VII", "III").Should().Be("X");
    }
    
    [Fact]
    public void Add_VII_II()
    {
        RomanAdder.Add("VII", "II").Should().Be("IX");
    }
    
    [Fact]
    public void Add_I_V()
    {
        RomanAdder.Add("I", "V").Should().Be("VI");
    }
    
    [Fact]
    public void Add_IIII_V()
    {
        RomanAdder.Add("IIII", "V").Should().Be("IX");
    }
}