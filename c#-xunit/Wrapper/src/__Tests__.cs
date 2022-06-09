using FluentAssertions;
using Wrapper.ApplicationDoubleInterfaceLoggerNameSpace;
using Wrapper.DependencyLoggerNameSpace;
using Xunit;

namespace Wrapper
{
    public class __Tests__
    {
        [Fact]
        public void Wrap()
        {
            var depLog = new DependencyLogger();
            var converter = new LoggerAdapter(depLog);
            var ourLog = new ApplicationDoubleInterfaceLogger(converter);

            ourLog.Name.Should().Be("DependencyLoggerWrapper");
            ourLog.Log("Hello World").Should().Be("message: Hello World");
            ourLog.Warning("Execution error").Should().Be("warning: Execution error");
        }
    }
}
