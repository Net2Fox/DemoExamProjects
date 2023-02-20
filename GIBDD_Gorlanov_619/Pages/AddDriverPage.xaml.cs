using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.IO;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
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
    /// Логика взаимодействия для AddDriverPage.xaml
    /// </summary>
    public partial class AddDriverPage : Page
    {
        public List<Company> Companies { get; set; }

        public List<JobName> JobNames { get; set; }

        public bool IsEdit { get; set; }

        public Driver Driver { get; set; }

        public AddDriverPage(Driver driver = null)
        {
            InitializeComponent();
            DataContext = this;
            if (driver != null)
            {
                Driver = driver;
                IsEdit = true;
            }
            else
            {
                Driver = new Driver();
                IsEdit = false;
            }
            Companies = Core.GetContext().Company.ToList();
            JobNames = Core.GetContext().JobName.ToList();
        }

        private void AddButton_Click(object sender, RoutedEventArgs e)
        {
            var str = new StringBuilder();
            if (string.IsNullOrEmpty(SurnameTextBox.Text))
            {
                str.AppendLine("Напишите фамилию!");
            }
            if (string.IsNullOrEmpty(NameTextBox.Text))
            {
                str.AppendLine("Напишите имя!");
            }
            if (string.IsNullOrEmpty(PatronymicTextBox.Text))
            {
                str.AppendLine("Напишите отчество!");
            }
            if (string.IsNullOrEmpty(PassportSerialTextBox.Text))
            {
                str.AppendLine("Напишите серию паспорта!");
            }
            if (string.IsNullOrEmpty(PassportNumberTextBox.Text))
            {
                str.AppendLine("Напишите номер паспорта!");
            }
            if (string.IsNullOrEmpty(AddressTextBox.Text))
            {
                str.AppendLine("Напишите адрес регистрации!");
            }
            if (string.IsNullOrEmpty(AddressLifeTextBox.Text))
            {
                str.AppendLine("Напишите адрес проживания!");
            }
            if (string.IsNullOrEmpty(EmailTextBox.Text))
            {
                str.AppendLine("Напишите email!");
            }
            if (string.IsNullOrEmpty(PhoneNumberTextBox.Text))
            {
                str.AppendLine("Напишите номер телефона!");
            }
            Match match = Regex.Match(PhoneNumberTextBox.Text, "^((\\+7)+\\(+(([0-9]){3})+\\)+([0-9]){3}-+([0-9]){4})$");
            if (!match.Success)
            {
                str.AppendLine("Напишите номер телефона в формате \"+7(###)###-####!\"");
            }

            if (str.Length > 0)
            {
                MessageBox.Show(str.ToString(), "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
                return;
            }

            if (IsEdit == false)
            {
                Core.GetContext().Driver.Add(Driver);
                Core.GetContext().SaveChanges();
                MessageBox.Show("Водитель был добавлен!", "Успешно", MessageBoxButton.OK, MessageBoxImage.Information);
            }
            else
            {
                var msg = MessageBox.Show("Вы точно хотите сохранить изменения?", "Подтверждение", MessageBoxButton.YesNo, MessageBoxImage.Question);
                if (msg == MessageBoxResult.Yes)
                {
                    Core.GetContext().SaveChanges();
                    MessageBox.Show("Изменения были успешно сохранены!", "Успешно", MessageBoxButton.OK, MessageBoxImage.Information);
                }
            }
            NavigationService.GoBack();
        }
    }
}
