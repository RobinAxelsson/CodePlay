using System;

namespace Wrapper
{
    public class LoggerAdapter : ILoggerAdapter
    {
        public LoggerAdapter(DependencyLogger dependencyLogger)
        {
            Name = dependencyLogger.Name;
            Log = dependencyLogger.DependencyLog;
            Warning = dependencyLogger.DependencyWarning;
            Trace = dependencyLogger.DependencyTrace;
        }
        public string Name { get; }
        public Func<string, string> Log { get; }
        public Func<string, string> Warning { get; }
        public Func<string, string> Trace { get; }
    }
}
