using System.Collections.Generic;
using System.Threading.Tasks;
using System.Collections.ObjectModel;
using SchoolLynxLibrary.Models;
using System.Net.Http;
using System.Net.Http.Json;
using System.Text.Json;

namespace SchoolLynxUI
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

        internal async Task<ObservableCollection<Person>> GetTeachersAsync()
        {
            IEnumerable<Person>? persons = await _client.GetFromJsonAsync<IEnumerable<Person>>("persons?isteacher=true");
            if (persons == null)
                return new();

            return new(persons);
        }

        internal async Task<ObservableCollection<Message>> GetMessagesForTeacherAsync(int teacherId)
        {
            IEnumerable<Message>? messages = await _client.GetFromJsonAsync<IEnumerable<Message>>($"teachers/{teacherId}/messages");
            if (messages == null) 
                return new();

            return new(messages);
        }

        internal async Task<ICollection<Confirmation>?> GetConfirmationsForMessageAsync(int messageId)
        {
            Message? message = await _client.GetFromJsonAsync<Message>($"messages/{messageId}");
            return message?.Confirmations;
        }

        internal async Task<Message?> AddMessageAsync(Message newMessage)
        {
            var request = await _client.PostAsJsonAsync("messages", newMessage);
            Message? message = await request.Content.ReadFromJsonAsync<Message>();
            return message;
        }

        internal async Task UpdateMessageAsync(Message selectedMessage)
        {
            string content = JsonSerializer.Serialize(new PatchMessage(selectedMessage.Title, selectedMessage.Text));
            await _client.PatchAsync($"messages/{selectedMessage.Id}", new StringContent(content));
        }

        internal async Task DeleteMessageAsync(int messageId)
        {
            await _client.DeleteAsync($"messages/{messageId}");
        }
    }
}
