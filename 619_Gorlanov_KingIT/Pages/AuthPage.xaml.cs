using _619_Gorlanov_KingIT.Classes;
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

namespace _619_Gorlanov_KingIT.Pages
{
    /// <summary>
    /// Логика взаимодействия для AuthPage.xaml
    /// </summary>
    public partial class AuthPage : Page
    {
        private int TryAuthCount = 0;

        public AuthPage()
        {
            InitializeComponent();
        }

        private void LoginButton_Click(object sender, RoutedEventArgs e)
        {
            if(String.IsNullOrEmpty(LoginTextBox.Text) || String.IsNullOrEmpty(PasswordTextBox.Password))
            {
                MessageBox.Show("Введите логин и пароль!", "Ошибка!", MessageBoxButton.OK, MessageBoxImage.Error);
                return;
            }
            
            var users = Core.GetContext().Employee.ToList();
            var currentUser = users.FirstOrDefault(u => u.Login.ToLower() == LoginTextBox.Text.ToLower() && u.Password == PasswordTextBox.Password);

            if(currentUser != null)
            {
                MessageBox.Show("Вы успешно вошли в систему!", "Вход", MessageBoxButton.OK, MessageBoxImage.Information);
                switch(currentUser.RoleID)
                {
                    case 1:
                        this.NavigationService.Navigate(new AdminPage());
                        break;
                    case 2:
                        this.NavigationService.Navigate(new RentersPage());
                        break;
                    case 3:
                        this.NavigationService.Navigate(new ShoppingСentersPage());
                        break;
                    case 4:
                        MessageBox.Show("Данный пользователь был удалён!", "Ошибка!", MessageBoxButton.OK, MessageBoxImage.Error);
                        break;
                }
            }
            else
            {
                TryAuthCount++;
                MessageBox.Show("Логин или пароль неверный!", "Ошибка!", MessageBoxButton.OK, MessageBoxImage.Error);
                if(TryAuthCount == 3)
                {
                    ShowCaptcha();
                    TryAuthCount = 0;
                }
                return;
            }
        }

        private void ShowCaptcha()
        {
            CaptchaWindow captcha = new CaptchaWindow();
            captcha.Owner = Window.GetWindow(this);
            captcha.Owner.IsEnabled = false;
            captcha.Show();
        }

        private void LoginTextBox_GotFocus(object sender, RoutedEventArgs e)
        {
            if(LoginTextBox.Text == "Логин")
                LoginTextBox.Text = "";
        }

        private void PasswordTextBox_GotFocus(object sender, RoutedEventArgs e)
        {
            if(PasswordTextBox.Password == "Пароль")
                PasswordTextBox.Password = "";
        }
    }
}
