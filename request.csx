using System.Net;

HttpWebRequest request = (HttpWebRequest)WebRequest.Create("http://localhost:8080/hello");
request.AutomaticDecompression = DecompressionMethods.GZip | DecompressionMethods.Deflate;

using (HttpWebResponse response = (HttpWebResponse)await request.GetResponseAsync())
using (Stream stream = response.GetResponseStream())
using (StreamReader reader = new StreamReader(stream))
{
    Console.WriteLine(await reader.ReadToEndAsync());
}