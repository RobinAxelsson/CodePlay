namespace Wrapper
{
    public class DependencyFileLogger //MEL
    {
        public string Name => "DependencyFileLogger";
        public string DependencyLog(string mess) => "message: " + mess;
        public string DependencyWarning(string mess) => "warning: " + mess;
        public string DependencyTrace(string mess) => "trace: " + mess;
    }
}
