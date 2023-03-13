using System.Collections.Generic;
using System.Linq;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Navigation;
using System.ComponentModel;

namespace GIBDD_Gorlanov_619.Pages
{
    /// <summary>
    /// Логика взаимодействия для DriverListPage.xaml
    /// </summary>
    public partial class DriverListPage : Page, INotifyPropertyChanged
    {
        private List<Driver> _drivers;
        public List<Driver> Drivers { 
            get 
            {
                return _drivers;
            } set
            {
                _drivers = value;
                PropertyChanged(this, new PropertyChangedEventArgs("Drivers"));
            }
        }

        private bool _isArchive;
        public bool IsArchive
        {
            get
            {
                return _isArchive;
            }
            set
            {
                _isArchive = value;
                PropertyChanged(this, new PropertyChangedEventArgs("IsArchive"));
            }
        }

        public event PropertyChangedEventHandler PropertyChanged;

        public DriverListPage()
        {
            InitializeComponent();
            DataContext = this;
        }

        private void UpdateData()
        {
            Drivers = Core.GetContext().Driver.ToList().Where(d => d.IsArchive == IsArchive).ToList();
        }
        
        private void Page_Loaded(object sender, RoutedEventArgs e)
        {
            UpdateData();
        }

        private void DeleteDriverButton_Click(object sender, RoutedEventArgs e)
        {
            if (DriverListView.SelectedItem != null)
            {
                var msg = MessageBox.Show("Вы точно хотите удалить выбранного водителя?", "Подтверждение", MessageBoxButton.YesNo, MessageBoxImage.Question);
                if (msg == MessageBoxResult.Yes)
                {
                    var selectedDriver = DriverListView.SelectedItem as Driver;
                    selectedDriver.IsArchive = true;
                    Core.GetContext().SaveChanges();
                    UpdateData();
                }
            }
        }

        private void ArchiveDriverButton_Click(object sender, RoutedEventArgs e)
        {
            IsArchive = !IsArchive;
            UpdateData();
        }

        private void AddDriverButton_Click(object sender, RoutedEventArgs e)
        {
            NavigationService.Navigate(new AddDriverPage());
        }

        private void EditDriverButton_Click(object sender, RoutedEventArgs e)
        {
            if (DriverListView.SelectedItem != null)
            {
                NavigationService.Navigate(new AddDriverPage(DriverListView.SelectedItem as Driver));
            }
        }

        private void LicensesButton_Click(object sender, RoutedEventArgs e)
        {
            if (DriverListView.SelectedItem != null)
            {
                NavigationService.Navigate(new LicensePage(DriverListView.SelectedItem as Driver));
            }
        }
    }
}
