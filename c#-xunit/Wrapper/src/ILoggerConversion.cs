using System;

namespace Wrapper
{
    public interface ILoggerAdapter
    {
        Func<string, string> Log { get; }
        string Name { get; }
        Func<string, string> Trace { get; }
        Func<string, string> Warning { get; }
    }
}