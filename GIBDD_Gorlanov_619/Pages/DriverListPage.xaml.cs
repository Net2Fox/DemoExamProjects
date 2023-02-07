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
        public DriverListPage()
        {
            InitializeComponent();
            DataContext = this;
        }

        public event PropertyChangedEventHandler PropertyChanged;

        private void Page_Loaded(object sender, RoutedEventArgs e)
        {
            Drivers = Core.GetContext().Driver.ToList();
        }
    }
}
