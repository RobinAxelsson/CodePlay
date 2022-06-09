namespace Wrapper
{
    public interface IApplicationLogger
    {
        string Name { get; }

        string Log(string message);
        string Trace(string message);
        string Warning(string message);
    }
}