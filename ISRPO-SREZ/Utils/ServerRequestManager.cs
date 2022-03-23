using System;
using System.Collections.Generic;
using System.Globalization;
using System.Net;
using System.Net.Http;
using System.Text;
using System.Threading;
using System.Threading.Tasks;

namespace MailXamarin.Utils
{
    public static class ServerRequestManager
    {
        private static HttpClient _httpClient = new HttpClient()
        {
            Timeout = TimeSpan.FromDays(1),
            BaseAddress = new Uri("http://localhost:5100")
        };


        public static async Task<string> Send(string partURL, HttpMethod method, DateTime start, DateTime end)
        {
            string formattedStart = start.ToString(DateTimeFormatInfo.InvariantInfo);
            string formattedEnd = end.ToString(DateTimeFormatInfo.InvariantInfo);
            HttpRequestMessage request = new HttpRequestMessage(method, $"{partURL}?dateStart={formattedStart}&dateEnd={formattedEnd}");
            HttpResponseMessage httpResponseMessage = await _httpClient.SendAsync(request);
            httpResponseMessage.EnsureSuccessStatusCode();

            string result = await httpResponseMessage.Content.ReadAsStringAsync();
            return result;
        }
    }
}