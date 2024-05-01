using System;
using System.Windows;
using SchoolLynxLibrary.Models;
using System.Collections.ObjectModel;
using System.ComponentModel;
using System.Runtime.CompilerServices;
using System.Threading.Tasks;

namespace SchoolLynxUI
{
    public partial class MainWindow : Window, INotifyPropertyChanged
    {
        private RestHelper restHelper;
        private ObservableCollection<Person> teachers;
        private Person? selectedTeacher;
        private ObservableCollection<Message> messages;
        private Message? selectedMessage;

        public event PropertyChangedEventHandler? PropertyChanged;

        public MainWindow()
        {
            InitializeComponent();

            restHelper = new();
            teachers = new ObservableCollection<Person>();
            messages = new ObservableCollection<Message>();

            DataContext = this;
        }

        public ObservableCollection<Person> Teachers
        {
            get => teachers;
            set
            {
                teachers = value;
                OnPropertyChanged();
            }
        }

        public Person? SelectedTeacher
        {
            get { return selectedTeacher; }
            set
            {
                selectedTeacher = value;
                OnPropertyChanged();
                OnPropertyChanged(nameof(HasSelectedTeacher));
                _ = RefreshMessages();
            }
        }

        public bool HasSelectedTeacher => SelectedTeacher != null;

        public ObservableCollection<Message> Messages
        {
            get => messages;
            set
            {
                messages = value;
                OnPropertyChanged();
            }
        }

        public Message? SelectedMessage
        {
            get { return selectedMessage; }
            set
            {
                selectedMessage = value;
                OnPropertyChanged();
                OnPropertyChanged(nameof(HasSelectedMessage));
            }
        }

        public bool HasSelectedMessage => SelectedMessage != null;

        private async void Window_Loaded(object sender, RoutedEventArgs e)
        {
            try
            {
                Teachers = await restHelper.GetTeachersAsync();
                if (Teachers.Count > 0)
                    SelectedTeacher = Teachers[0];
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
        }

        private async Task RefreshMessages()
        {
            if (SelectedTeacher != null)
            {
                try
                {
                    Messages = await restHelper.GetMessagesForTeacherAsync(SelectedTeacher.Id);
                }
                catch (Exception ex)
                {
                    MessageBox.Show(ex.Message);
                }
            }
            else
            {
                MessageBox.Show("No teacher selected.");
            }
        }

        private async void DeleteMessageButton_Click(object sender, RoutedEventArgs e)
        {
            if (SelectedMessage != null)
            {
                try
                {
                    await restHelper.DeleteMessageAsync(SelectedMessage.Id);
                    Messages.Remove(SelectedMessage);
                }
                catch (Exception ex)
                {
                    MessageBox.Show(ex.Message);
                }
            }
            else
            {
                MessageBox.Show("No message selected.");
            }
        }

        private async void AddMessageButton_Click(object sender, RoutedEventArgs e)
        {
            if (selectedTeacher != null)
            {
                var newMessageWindow = new NewMessageWindow(SelectedTeacher!);
                newMessageWindow.Owner = this;
                if (newMessageWindow.ShowDialog() == true)
                {
                    Message newMessage = newMessageWindow.NewMessage;
                    try
                    {
                        Message? addedMessage = await restHelper.AddMessageAsync(newMessage);
                        if (addedMessage != null)
                        {
                            messages.Add(addedMessage);
                            dgMessages.SelectedItem = addedMessage;
                        }
                    }
                    catch (Exception ex)
                    {
                        MessageBox.Show(ex.Message);
                    }
                }
            }
            else
            {
                MessageBox.Show("No message selected.");
            }
        }

        private async void UpdateMessageButton_Click(object sender, RoutedEventArgs e)
        {
            if (SelectedMessage != null)
            {
                try
                {
                    await restHelper.UpdateMessageAsync(SelectedMessage);
                }
                catch (Exception ex)
                {
                    MessageBox.Show(ex.Message);
                }
            }
            else
            {
                MessageBox.Show("No message selected.");
            }
        }

        private async void RefreshConfirmationsButton_Click(object sender, RoutedEventArgs e)
        {
            if (SelectedMessage != null && SelectedMessage.Confirmations != null)
            {
                try
                {
                    var updatedConfirmations = await restHelper.GetConfirmationsForMessageAsync(SelectedMessage.Id);
                    if (updatedConfirmations != null)
                    {
                        SelectedMessage.Confirmations.Clear();
                        foreach (var item in updatedConfirmations)
                        {
                            SelectedMessage.Confirmations.Add(item);
                        }
                        lbConfirmations.Items.Refresh();
                    }
                }
                catch (Exception ex)
                {
                    MessageBox.Show(ex.Message);
                }
            }
            else
            {
                MessageBox.Show("No message selected or invalid message state.");
            }
        }

        private void OnPropertyChanged([CallerMemberName] string propertyName = "")
        {
            PropertyChanged?.Invoke(this, new PropertyChangedEventArgs(propertyName));
        }
    }
}
