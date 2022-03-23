using System.Text.Json.Serialization;

namespace ISRPO_SREZ.Models
{
    public class Client
    {
        public string lastName { get; set; }
        public string firstName { get; set; }
        public string patronymic { get; set; }

        [JsonIgnore]
        public string Initials => $"{lastName} {firstName[0]}.{patronymic[0]}.";
    }
}
