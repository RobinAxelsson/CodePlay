namespace Wrapper
{
    public class DependencyLogger
    {
        public string Name => "DependencyLogger";
        public string DependencyLog(string mess) => "message: " + mess;
        public string DependencyWarning(string mess) => "warning: " + mess;
        public string DependencyTrace(string mess) => "trace: " + mess;
    }
}
