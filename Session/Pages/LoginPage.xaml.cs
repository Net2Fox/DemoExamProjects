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

namespace Session.Pages
{
    /// <summary>
    /// Логика взаимодействия для LoginPage.xaml
    /// </summary>
    public partial class LoginPage : Page
    {
        public LoginPage()
        {
            InitializeComponent();
        }

        private void LoginButton_Click(object sender, RoutedEventArgs e)
        {
            if (string.IsNullOrEmpty(LoginTextBox.Text))
            {
                MessageBox.Show("Введите логин!", "Ошибка!", MessageBoxButton.OK, MessageBoxImage.Error);
                return;
            }

            if (string.IsNullOrEmpty(PasswordTextBox.Password))
            {
                MessageBox.Show("Введите пароль!", "Ошибка!", MessageBoxButton.OK, MessageBoxImage.Error);
                return;
            }

            var user = Core.GetContext().User.FirstOrDefault(u => u.Login == LoginTextBox.Text && u.Password == PasswordTextBox.Password);
            if (user != null)
            {
                MainWindow mainWindow = Window.GetWindow(this) as MainWindow;
                mainWindow.UpdateUser(user);
                switch (user.JobID)
                {
                    case 1:
                        MessageBox.Show("Вы успешно вошли под аккаунтом менеджера!", "Успешно!", MessageBoxButton.OK, MessageBoxImage.Information);
                        NavigationService.Navigate(new ManagerPage());
                        break;
                    case 2:
                        MessageBox.Show("Вы успешно вошли под аккаунтом исполнитиля!", "Успешно!", MessageBoxButton.OK, MessageBoxImage.Information);
                        break;
                    case 3:
                        MessageBox.Show("Вы успешно вошли под аккаунтом администратора!", "Успешно!", MessageBoxButton.OK, MessageBoxImage.Information);
                        break;
                }
            }
        }
    }
}
