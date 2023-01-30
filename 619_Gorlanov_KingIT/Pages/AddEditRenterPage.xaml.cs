using _619_Gorlanov_KingIT.Classes;
using System;
using System.Collections.Generic;
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

namespace _619_Gorlanov_KingIT.Pages
{
    /// <summary>
    /// Логика взаимодействия для AddEditRenterPage.xaml
    /// </summary>
    public partial class AddEditRenterPage : Page
    {
        Renter CurrentRenter = null;

        public AddEditRenterPage(Renter renter = null)
        {
            InitializeComponent();
            if (renter != null)
            {
                CurrentRenter = renter;
                NameTextBox.Text = renter.Name;
                AddressTextBox.Text = renter.Address;
                PhoneNumberTextBox.Text = renter.PhoneNumber;
                CreateButton.Content = "Сохранить";
            }
        }

        private void CreateButton_Click(object sender, RoutedEventArgs e)
        {
            if (String.IsNullOrEmpty(NameTextBox.Text) || String.IsNullOrEmpty(AddressTextBox.Text) || String.IsNullOrEmpty(PhoneNumberTextBox.Text))
            {
                MessageBox.Show("Введите данные во все поля!", "Ошибка!", MessageBoxButton.OK, MessageBoxImage.Error);
                return;
            }
            if (CurrentRenter != null)
            {
                try
                {
                    CurrentRenter.Name = NameTextBox.Text;
                    CurrentRenter.Address = AddressTextBox.Text;
                    Match match = Regex.Match(PhoneNumberTextBox.Text, "^((\\+7)+\\(+(([0-9]){3})+\\)+([0-9]){7})$");
                    if (!match.Success)
                    {
                        MessageBox.Show("Введите корректный номер телефона!", "Ошибка!", MessageBoxButton.OK, MessageBoxImage.Error);
                        return;
                    }
                    CurrentRenter.PhoneNumber = PhoneNumberTextBox.Text;
                    Core.GetContext().SaveChanges();
                    MessageBox.Show("Арендатор был успешно изменён!", "Успех!", MessageBoxButton.OK, MessageBoxImage.Information);
                    this.NavigationService.GoBack();
                }
                catch
                {
                    MessageBox.Show("При изменении арендатора произошла ошибка!", "Ошибка!", MessageBoxButton.OK, MessageBoxImage.Error);
                }
            }
            else
            {
                try
                {
                    Renter newRenter = new Renter();
                    newRenter.Name = NameTextBox.Text;
                    newRenter.Address = AddressTextBox.Text;
                    Match match = Regex.Match(PhoneNumberTextBox.Text, "^((\\+7)+\\(+(([0-9]){3})+\\)+([0-9]){7})$");
                    if (!match.Success)
                    {
                        MessageBox.Show("Введите корректный номер телефона!", "Ошибка!", MessageBoxButton.OK, MessageBoxImage.Error);
                        return;
                    }
                    newRenter.PhoneNumber = PhoneNumberTextBox.Text;
                    Core.GetContext().Renter.Add(newRenter);
                    Core.GetContext().SaveChanges();
                    MessageBox.Show("Новый арендатор был успешно создан!", "Успех!", MessageBoxButton.OK, MessageBoxImage.Information);
                    this.NavigationService.GoBack();
                }
                catch
                {
                    MessageBox.Show("При создании арендатора произошла ошибка!", "Ошибка!", MessageBoxButton.OK, MessageBoxImage.Error);
                }
            }
        }

        private void CancelButton_Click(object sender, RoutedEventArgs e)
        {
            this.NavigationService.GoBack();
        }
    }
}
