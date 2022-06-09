namespace Wrapper
{
    public interface ILoggerAdapter
    {
        string Name { get; }
        string Log(string message);
        string Trace(string message);
        string Warning(string message);
    }
}