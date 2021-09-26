using System;
using System.IO;
using System.Net;
using System.Threading.Tasks;
using Xunit;

namespace ServerRequests
{
    public class RequestTests
    {
        [Fact]
        public void Running() => Assert.True(true);
        [Theory]
        [InlineData("hello", "Hello World")]
        public async Task CurlSharp(string query, string expectedResponse)
        {
            string url = Environment.GetEnvironmentVariable("TestUrl", EnvironmentVariableTarget.Process) + query;
            HttpWebRequest request = (HttpWebRequest)WebRequest.Create(url);
            request.AutomaticDecompression = DecompressionMethods.GZip | DecompressionMethods.Deflate;

            using (HttpWebResponse response = (HttpWebResponse)await request.GetResponseAsync())
            using (Stream stream = response.GetResponseStream())
            using (StreamReader reader = new StreamReader(stream))
            {
                var actualResponse = await reader.ReadToEndAsync();
                Assert.Equal(expectedResponse, actualResponse);
            }
        }
    }
}
