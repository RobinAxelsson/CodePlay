using System;

namespace Wrapper
{
    public class LoggerAdapter : ILoggerAdapter
    {
        private readonly DependencyLogger _dependencyLogger;
        public LoggerAdapter(DependencyLogger dependencyLogger)
        {
            _dependencyLogger = dependencyLogger;
        }

        public string Name { get; }
        public string Log(string message) => _dependencyLogger.DependencyLog(message);
        public string Warning(string message) => _dependencyLogger.DependencyWarning(message);
        public string Trace(string message) => _dependencyLogger.DependencyTrace(message);
    }
    public class LoggerAdapterFileLogger : ILoggerAdapter
    {
        private readonly DependencyFileLogger _dependencyFileLogger;

        public LoggerAdapterFileLogger(DependencyFileLogger dependencyFileLogger)
        {
            _dependencyFileLogger = dependencyFileLogger;
        }

        string ILoggerAdapter.Log(string message)
        {
            throw new NotImplementedException();
        }

        string ILoggerAdapter.Trace(string message)
        {
            throw new NotImplementedException();
        }

        string ILoggerAdapter.Warning(string message)
        {
            throw new NotImplementedException();
        }
    }
}
