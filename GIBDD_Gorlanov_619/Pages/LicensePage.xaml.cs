using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;
using System.ComponentModel;

namespace GIBDD_Gorlanov_619.Pages
{
    /// <summary>
    /// Логика взаимодействия для LicensePage.xaml
    /// </summary>
    public partial class LicensePage : Page, INotifyPropertyChanged
    {

        private List<License> _licenses;

        public List<License> Licenses
        {
            get
            {
                return _licenses;
            }
            set
            {
                _licenses = value;
                PropertyChanged(this, new PropertyChangedEventArgs("Licenses"));
            }
        }

        private Driver _driver;

        public event PropertyChangedEventHandler PropertyChanged;

        public LicensePage(Driver driver)
        {
            InitializeComponent();
            _driver = driver;
            DataContext = this;
        }

        private void AddLicenseButton_Click(object sender, RoutedEventArgs e)
        {
            NavigationService.Navigate(new AddLicensePage(driver: _driver));
        }

        private void EditLicenseButton_Click(object sender, RoutedEventArgs e)
        {
            NavigationService.Navigate(new AddLicensePage(LicenseListView.SelectedItem as License, _driver));
        }

        private void Page_Loaded(object sender, RoutedEventArgs e)
        {
            Licenses = Core.GetContext().License.ToList();
            Licenses = Licenses.Where(l => l.Driver == _driver).ToList();
        }

        private void LicenseHistoryButton_Click(object sender, RoutedEventArgs e)
        {
            if(LicenseListView.SelectedItem != null)
            {
                NavigationService.Navigate(new LicenseHistoryPage(LicenseListView.SelectedItem as License));
            }
        }
    }
}
