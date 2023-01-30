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
    /// Логика взаимодействия для AddEditUserPage.xaml
    /// </summary>
    public partial class AddEditUserPage : Page
    {

        Employee CurrentUser = null;

        public AddEditUserPage(Employee user = null)
        {
            InitializeComponent();
            var genders = Core.GetContext().Gender.ToList();
            GenderComboBox.ItemsSource = genders;
            var roles = Core.GetContext().Role.ToList();
            RoleComboBox.ItemsSource = roles;
            if (user != null)
            {
                CurrentUser = user;
                FirstNameTextBox.Text = user.FirstName;
                LastNameTextBox.Text = user.LastName;
                MiddleNameTextBox.Text = user.MiddleName;
                LoginTextBox.Text = user.Login;
                PasswordTextBox.Text = user.Password;
                GenderComboBox.SelectedItem = user.Gender;
                RoleComboBox.SelectedItem = user.Role;
                PhoneNumberTextBox.Text = user.PhoneNumber;
                CreateButton.Content = "Сохранить";
            }
        }

        private void CreateButton_Click(object sender, RoutedEventArgs e)
        {
            if (String.IsNullOrEmpty(LastNameTextBox.Text) || String.IsNullOrEmpty(FirstNameTextBox.Text) || String.IsNullOrEmpty(MiddleNameTextBox.Text) || String.IsNullOrEmpty(LoginTextBox.Text) || String.IsNullOrEmpty(PasswordTextBox.Text) || String.IsNullOrEmpty(RoleComboBox.Text) || String.IsNullOrEmpty(GenderComboBox.Text) || String.IsNullOrEmpty(PhoneNumberTextBox.Text))
            {
                MessageBox.Show("Введите данные во все поля!", "Ошибка!", MessageBoxButton.OK, MessageBoxImage.Error);
                return;
            }
            if (CurrentUser != null)
            {
                try
                {
                    CurrentUser.FirstName = FirstNameTextBox.Text;
                    CurrentUser.LastName = LastNameTextBox.Text;
                    CurrentUser.MiddleName = MiddleNameTextBox.Text;
                    CurrentUser.Login = LoginTextBox.Text;
                    CurrentUser.Password = PasswordTextBox.Text;
                    CurrentUser.RoleID = RoleComboBox.SelectedIndex + 1;
                    CurrentUser.GenderID = GenderComboBox.SelectedIndex + 1;
                    Match match = Regex.Match(PhoneNumberTextBox.Text, "^((\\+7)+\\(+(([0-9]){3})+\\)+([0-9]){7})$");
                    if (!match.Success)
                    {
                        MessageBox.Show("Введите корректный номер телефона!", "Ошибка!", MessageBoxButton.OK, MessageBoxImage.Error);
                        return;
                    }
                    CurrentUser.PhoneNumber = PhoneNumberTextBox.Text;
                    Core.GetContext().SaveChanges();
                    MessageBox.Show("Пользователь был успешно изменён!", "Успех!", MessageBoxButton.OK, MessageBoxImage.Information);
                    this.NavigationService.GoBack();
                }
                catch
                {
                    MessageBox.Show("При изменении пользователя произошла ошибка!", "Ошибка!", MessageBoxButton.OK, MessageBoxImage.Error);
                }
            }
            else
            {
                try
                {
                    Employee newUser = new Employee();
                    newUser.FirstName = FirstNameTextBox.Text;
                    newUser.LastName = LastNameTextBox.Text;
                    newUser.MiddleName = MiddleNameTextBox.Text;
                    newUser.Login = LoginTextBox.Text;
                    newUser.Password = PasswordTextBox.Text;
                    newUser.RoleID = RoleComboBox.SelectedIndex + 1;
                    newUser.GenderID = GenderComboBox.SelectedIndex + 1;
                    Match match = Regex.Match(PhoneNumberTextBox.Text, "^((\\+7)+\\(+(([0-9]){3})+\\)+([0-9]){7})$");
                    if (!match.Success)
                    {
                        MessageBox.Show("Введите корректный номер телефона!", "Ошибка!", MessageBoxButton.OK, MessageBoxImage.Error);
                        return;
                    }
                    newUser.PhoneNumber = PhoneNumberTextBox.Text;
                    Core.GetContext().Employee.Add(newUser);
                    Core.GetContext().SaveChanges();
                    MessageBox.Show("Новый пользователь был успешно создан!", "Успех!", MessageBoxButton.OK, MessageBoxImage.Information);
                    this.NavigationService.GoBack();
                }
                catch
                {
                    MessageBox.Show("При создании пользователя произошла ошибка!", "Ошибка!", MessageBoxButton.OK, MessageBoxImage.Error);
                }
            }
        }

        private void CancelButton_Click(object sender, RoutedEventArgs e)
        {
            this.NavigationService.GoBack();
        }
    }
}
