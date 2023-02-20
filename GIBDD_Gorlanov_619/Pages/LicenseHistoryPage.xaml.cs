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

namespace GIBDD_Gorlanov_619.Pages
{
    /// <summary>
    /// Логика взаимодействия для LicenseHistoryPage.xaml
    /// </summary>
    public partial class LicenseHistoryPage : Page
    {
        public List<LicenseHistory> LicenseHistory { get; set; }
        
        public LicenseHistoryPage(License license)
        {
            InitializeComponent();
            DataContext = this;
            LicenseHistory = Core.GetContext().LicenseHistory.ToList().Where(l => l.License == license).ToList();
        }
    }
}
