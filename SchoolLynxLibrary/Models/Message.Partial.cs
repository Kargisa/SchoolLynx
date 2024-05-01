namespace SchoolLynxLibrary.Models
{
    public partial class Message
    {
        public bool IsConfirmed => Confirmations?.Count > 0;
    }
}