using System.Collections.Generic;
using System.Linq;
using System.Windows.Controls;

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
