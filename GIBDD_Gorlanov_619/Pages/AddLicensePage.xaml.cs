using GIBDD_Gorlanov_619.Windows;
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
    /// Логика взаимодействия для AddLicensePage.xaml
    /// </summary>
    public partial class AddLicensePage : Page
    {
        public bool IsEdit { get; set; }

        public List<Status> Statuses { get; set; }

        public License License { get; set; }

        public Status LicenseStatus { get; set; }

        private bool _isStatusChaged = false;

        private string _description;

        private Driver _driver;

        public AddLicensePage(License license = null, Driver driver = null)
        {
            InitializeComponent();
            DataContext = this;
            _driver = driver;
            if (license != null)
            {
                License = license;
                LicenseStatus = License.Status;
                IsEdit = true;
            }
            else
            {
                License = new License();
                License.Driver = _driver;
                IsEdit = false;
            }
            Statuses = Core.GetContext().Status.ToList();
        }

        private void AddButton_Click(object sender, RoutedEventArgs e)
        {
            License.Status = LicenseStatus;
            if (IsEdit == false)
            {
                Core.GetContext().License.Add(License);
                Core.GetContext().SaveChanges();
                MessageBox.Show("Лицензия была добавлена!", "Успешно", MessageBoxButton.OK, MessageBoxImage.Information);
            }
            else
            {
                var msg = MessageBox.Show("Вы точно хотите сохранить изменения?", "Подтверждение", MessageBoxButton.YesNo, MessageBoxImage.Question);
                if (msg == MessageBoxResult.Yes)
                {
                    if(_isStatusChaged == true)
                    {
                        LicenseHistory licenseHistory = new LicenseHistory();
                        licenseHistory.License = License;
                        licenseHistory.Status = LicenseStatus;
                        licenseHistory.Description = _description;
                        Core.GetContext().LicenseHistory.Add(licenseHistory);
                    }
                    Core.GetContext().SaveChanges();
                    MessageBox.Show("Изменения были успешно сохранены!", "Успешно", MessageBoxButton.OK, MessageBoxImage.Information);
                }
            }
            NavigationService.GoBack();
        }

        private void StatusComboBox_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            if (StatusComboBox.SelectedIndex == 0)
            {
                var activeLicense = _driver.License.FirstOrDefault(l => l.StatusID == 1 && l.ID != License.ID);
                if (activeLicense != null)
                {
                    MessageBox.Show("У данного водителя уже есть активное ВУ!", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
                    StatusComboBox.SelectedItem = License.Status;
                    return;
                }
            }

            if (IsEdit == true)
            {
                if (License.Status != LicenseStatus)
                {
                    MessageBox.Show("При смене статуса необходимо написать комментарий - причину изменения", "Предупреждение", MessageBoxButton.OK, MessageBoxImage.Warning);
                    ChangeStatusWindow changeStatusWindow = new ChangeStatusWindow();
                    changeStatusWindow.Owner = Window.GetWindow(this);
                    if(changeStatusWindow.ShowDialog() == true)
                    {
                        _isStatusChaged = true;
                        _description = changeStatusWindow.Description;
                    }
                    
                    return;
                }
            }
        }
    }
}
