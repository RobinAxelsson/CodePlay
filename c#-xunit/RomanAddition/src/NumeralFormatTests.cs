using System;
using FluentAssertions;
using Xunit;
using Xunit.Abstractions;

namespace RomanAddition;

public class NumeralFormatTests
{
    private readonly ITestOutputHelper _testOutputHelper;

    public NumeralFormatTests(ITestOutputHelper testOutputHelper)
    {
        _testOutputHelper = testOutputHelper;
    }
    [Fact]
    public void Numeral_Format_I()
    {
        var numeral = new Numeral("I");
        numeral.Should().Be("I");
    }
    
    [Fact]
    public void Numeral_Format_IIII_Short()
    {
        var numeral = new Numeral("IIII");
        numeral.Should().Be("IV");
    }
    
    [Fact]
    public void Numeral_Format_IIII_Long()
    {
        var numeral = new Numeral("IIII");
        numeral.Should().Be("IIII");
    }
    
    [Fact]
    public void Numeral_Format_IIIII()
    {
        var numeral = new Numeral("IIIII");
        numeral.Should().Be("V");
    }
    
    [Fact]
    public void Numeral_Format_IIIIII()
    {
        var numeral = new Numeral("IIIIII");
        numeral.Should().Be("VI");
    }
    
    [Fact]
    public void Numeral_Format_IIIIIII()
    {
        var numeral = new Numeral("IIIIIII");
        numeral.Should().Be("VII");
    }
    
    [Fact]
    public void Numeral_Format_IIIII_IIIII()
    {
        var numeral = new Numeral("IIIIIIIIII");
        numeral.Should().Be("X");
    }
    
    [Fact]
    public void Numeral_addition_IIIII_IIIII()
    {
        var numeral1 = new Numeral("IIIII");
        (numeral1 + "IIIII").Should().Be("X");
    }
    
    [Fact]
    public void Numeral_increment_I()
    {
        var numeral1 = new Numeral("I");
        (++numeral1).Should().Be("II");
    }
    
    [Fact]
    public void Numeral_increment_loop()
    {
        _testOutputHelper.WriteLine("Start");

        for (Numeral n = new Numeral("I"); n != "X"; n++)
        {
            _testOutputHelper.WriteLine("" + n);
        }
    }
    
    [Fact]
    public void Numeral_decrement()
    {
        var num = new Numeral("II");
        num--;
        (num == "I").Should().BeTrue();
    }
    
    [Fact]
    public void Numeral_decrement_below_one()
    {
        var num = new Numeral("I");

        FluentActions.Invoking(() => num--)
            .Should().Throw<ArithmeticException>();
    }

    [Fact]
    public void Numeral_V_I()
    {
        var num = new Numeral("V");
        num += "I";
        num.Should().Be("VI");
    }
    
    [Fact]
    public void Numeral_I_V()
    {
        var num = new Numeral("I");
        num += "V";
        num.Should().Be("VI");
    }
}