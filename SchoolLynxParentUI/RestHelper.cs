using System.Collections.Generic;
using System.Threading.Tasks;
using System.Collections.ObjectModel;
using SchoolLynxLibrary.Models;
using System.Net.Http;
using System.Net.Http.Json;

namespace SchoolLynxParentUI
{
    internal class RestHelper
    {
        private HttpClient _client = new HttpClient()
        {
            BaseAddress = new("http://localhost:5189/api/")
        };

        public RestHelper()
        {
        }

        internal async Task<ObservableCollection<Person>> GetParentsAsync()
        {
            IEnumerable<Person>? persons = await _client.GetFromJsonAsync<IEnumerable<Person>>("persons?isteacher=false");
            if (persons == null)
                return new();

            return new(persons);
        }

        internal async Task<ObservableCollection<Message>> GetMessagesForParentAsync(int id)
        {
            IEnumerable<Message>? messages = await _client.GetFromJsonAsync<IEnumerable<Message>>($"parents/{id}/messages");
            if (messages == null) return new();

            return new(messages);
        }

        internal async Task<Confirmation?> AddConfirmationAsync(int messageId, int parentId)
        {
            var response = await _client.PostAsJsonAsync($"messages/{messageId}/confirmations", parentId);
            Confirmation? confirmation = await response.Content.ReadFromJsonAsync<Confirmation>();
            return confirmation;
        }
    }
}
