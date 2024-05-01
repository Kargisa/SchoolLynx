using System;
using System.Threading.Tasks;
using System.Windows;
using SchoolLynxLibrary.Models;
using System.Collections.ObjectModel;
using System.ComponentModel;
using System.Runtime.CompilerServices;
using SchoolLynxParentUI;

namespace SchoolLynxUI
{
    public partial class MainWindow : Window, INotifyPropertyChanged
    {
        private readonly RestHelper restHelper;
        private ObservableCollection<Person> parents;
        private Person? selectedParent;
        private ObservableCollection<Message> messages;
        private Message? selectedMessage;

        public event PropertyChangedEventHandler? PropertyChanged;

        public MainWindow()
        {
            InitializeComponent();

            restHelper = new RestHelper();
            parents = new ObservableCollection<Person>();
            messages = new ObservableCollection<Message>();

            DataContext = this;
        }

        public ObservableCollection<Person> Parents
        {
            get => parents;
            set
            {
                parents = value;
                OnPropertyChanged();
            }
        }

        public Person? SelectedParent
        {
            get { return selectedParent; }
            set
            {
                selectedParent = value;
                OnPropertyChanged();
                OnPropertyChanged(nameof(HasSelectedParent));
                _ = RefreshMessagesAsync();
            }
        }

        public bool HasSelectedParent => SelectedParent != null;

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
                OnPropertyChanged(nameof(HasUnconfirmedSelectedMessage));
            }
        }

        public bool HasUnconfirmedSelectedMessage => SelectedMessage != null && !SelectedMessage.IsConfirmed;


        private async void Window_Loaded(object sender, RoutedEventArgs e)
        {
            try
            {
                Parents = await restHelper.GetParentsAsync();
                if (Parents.Count > 0)
                    SelectedParent = Parents[0];
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
        }

        private async Task RefreshMessagesAsync()
        {
            if (SelectedParent == null)
            {
                MessageBox.Show("No parent selected.");
                return;
            }
            
            try
            {
                Messages = await restHelper.GetMessagesForParentAsync(SelectedParent.Id);
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
        }

        private async void ConfirmMessageButton_Click(object sender, RoutedEventArgs e)
        {
            if (SelectedMessage == null)
            {
                MessageBox.Show("No message selected.");
                return;
            }

            if (SelectedMessage.IsConfirmed)
            {
                MessageBox.Show("Message is already confirmed.");
                return;
            }

            try
            {
                Confirmation? addedConfirmation = await restHelper.AddConfirmationAsync(SelectedMessage.Id, SelectedParent!.Id);
                if (addedConfirmation != null)
                    await RefreshMessagesAsync();
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
        }

        private void OnPropertyChanged([CallerMemberName] string propertyName = "")
        {
            PropertyChanged?.Invoke(this, new PropertyChangedEventArgs(propertyName));
        }
    }
}
