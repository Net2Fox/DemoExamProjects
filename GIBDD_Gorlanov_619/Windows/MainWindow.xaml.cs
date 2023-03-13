using System.Windows;
using GIBDD_Gorlanov_619.Pages;

namespace GIBDD_Gorlanov_619.Windows
{
    /// <summary>
    /// Логика взаимодействия для MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        public bool IsLoggedIn = false;
        public bool IsCodeNeed = false;

        public MainWindow()
        {
            InitializeComponent();
            
        }

        private void BackButton_Click(object sender, RoutedEventArgs e)
        {
            if (MainFrame.CanGoBack && IsLoggedIn == true)
            {
                MainFrame.GoBack();
            }
        }

        private void ExitButton_Click(object sender, RoutedEventArgs e)
        {
            if (IsLoggedIn == true)
            {
                IsLoggedIn = false;
                MainFrame.Navigate(new LoginPage());
            }
        }
    }
}
