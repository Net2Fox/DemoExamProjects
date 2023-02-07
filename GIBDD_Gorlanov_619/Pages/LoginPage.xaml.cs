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
using GIBDD_Gorlanov_619.Windows;

namespace GIBDD_Gorlanov_619.Pages
{
    /// <summary>
    /// Логика взаимодействия для LoginPage.xaml
    /// </summary>
    public partial class LoginPage : Page
    {
        public MainWindow window;
        public LoginPage()
        {
            InitializeComponent();
            
        }

        private void LoginButton_Click(object sender, RoutedEventArgs e)
        {
            window = Window.GetWindow(this) as MainWindow;
            if (String.IsNullOrEmpty(LoginTextBox.Text) && String.IsNullOrEmpty(PasswordTextBox.Password))
            {
                MessageBox.Show("Вы не ввели логин или пароль!", "Ошибка!", MessageBoxButton.OK, MessageBoxImage.Error);
                return;
            }

            var inspectors = Core.GetContext().Inspector.ToList();

            var currentInspector = inspectors.FirstOrDefault(i => i.Login == LoginTextBox.Text && i.Password == PasswordTextBox.Password);
            
            if(currentInspector != null)
            {
                if (window.IsCodeNeed == true)
                {
                    CodeWindow code = new CodeWindow(currentInspector.Code);
                    code.Owner = window;
                    code.Owner.IsEnabled = false;
                    if (code.ShowDialog() != true)
                    {
                        code.Owner.IsEnabled = true;
                        return;
                    }
                }
                currentInspector.Code = GenerateCode();
                Core.GetContext().SaveChanges();
                window.IsCodeNeed = true;
                MessageBox.Show($"Вы успешно вошли в систему!\nВаш код для следующего входа: {currentInspector.Code}", "Успех!", MessageBoxButton.OK, MessageBoxImage.Information);
                window.IsLoggedIn = true;
                NavigationService.Navigate(new DriverListPage());
            }
            else
            {
                MessageBox.Show("Пользователь с  таким логином и паролем не был найден!", "Ошибка!", MessageBoxButton.OK, MessageBoxImage.Error);
                return;
            }
        }

        private string GenerateCode()
        {
            Random randCode = new Random((int)DateTime.Now.Ticks);
            string code = "";
            for(int i = 0; i < 4; i++)
            {
                code += randCode.Next(0, 10).ToString();
            }
            return code;
        }
    }
}
