using FluentAssertions;
using Xunit;

namespace Wrapper
{
    public class ILoggerConversionTests
    {
        [Fact]
        public void Wrap()
        {
            var depLog = new DependencyLogger();
            var converter = new LoggerAdapter(depLog);
            var ourLog = new OurLogger(converter);

            ourLog.Name.Should().Be("DependencyLoggerWrapper");
            ourLog.Log("Hello World").Should().Be("message: Hello World");
            ourLog.Warning("Execution error").Should().Be("warning: Execution error");
        }
    }
}
