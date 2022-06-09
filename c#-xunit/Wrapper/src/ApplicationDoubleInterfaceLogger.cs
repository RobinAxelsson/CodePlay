using System;

namespace Wrapper
{
    public class ApplicationDoubleInterfaceLogger : IApplicationLogger
    {
        public ApplicationDoubleInterfaceLogger(ILoggerAdapter loggerAdapter)
        {
            Name = loggerAdapter.Name + "Wrapper";
            _log = loggerAdapter.Log;
            _warning = loggerAdapter.Warning;
            _trace = loggerAdapter.Trace;
        }
        public string Name { get; }
        public string Log(string message) => _log(message);
        public string Warning(string message) => _warning(message);
        public string Trace(string message) => _trace(message);

        private readonly Func<string, string> _trace;
        private readonly Func<string, string> _warning;
        private readonly Func<string, string> _log;
    }
}
