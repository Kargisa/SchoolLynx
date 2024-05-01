using System.Windows;
using SchoolLynxLibrary.Models;
using System.ComponentModel;
using System.Runtime.CompilerServices;

namespace SchoolLynxUI
{
    public partial class NewMessageWindow : Window, INotifyPropertyChanged
    {
        private Message newMessage;

        public event PropertyChangedEventHandler? PropertyChanged;

        public NewMessageWindow(Person teacher)
        {
            InitializeComponent();

            this.newMessage = new Message { SenderId = teacher.Id, ClassgroupId = teacher.ClassgroupId!.Value, Title = "New titel", Text = "New text" };
            DataContext = this;
        }

        public Message NewMessage
        {
            get { return newMessage; }
            set
            {
                newMessage = value;
                OnPropertyChanged();
            }
        }

        private void SendMessageButton_Click(object sender, RoutedEventArgs e)
        {
            this.DialogResult = true;
            this.Close();
        }

        private void OnPropertyChanged([CallerMemberName] string propertyName = "")
        {
            PropertyChanged?.Invoke(this, new PropertyChangedEventArgs(propertyName));
        }
    }
}
