namespace Wrapper
{
    public class SimpleWrapperLogger : IApplicationLogger
    {
        public SimpleWrapperLogger(DependencyLogger dependencyLogger)
        {
            _dependencyLogger = dependencyLogger;
        }
        public string Name => _dependencyLogger.Name;
        public string Log(string message) => _dependencyLogger.DependencyLog(message);
        public string Warning(string message) => _dependencyLogger.DependencyWarning(message);
        public string Trace(string message) => _dependencyLogger.DependencyTrace(message);

        private readonly DependencyLogger _dependencyLogger;
    }
}
