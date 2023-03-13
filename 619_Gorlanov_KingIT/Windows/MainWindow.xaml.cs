using System.Windows;
using System.Windows.Controls;
using System.Windows.Navigation;

namespace _619_Gorlanov_KingIT
{
    /// <summary>
    /// Логика взаимодействия для MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        public MainWindow()
        {
            InitializeComponent();
        }

        private void Frame_Navigated(object sender, NavigationEventArgs e)
        {
            this.Title = $"{(e.Content as Page).Title}";
        }

        private void Window_Closing(object sender, System.ComponentModel.CancelEventArgs e)
        {
            var messageBoxResult = MessageBox.Show("Вы точно хотите выйти?", "Предупреждение!", MessageBoxButton.YesNo, MessageBoxImage.Warning);
            if(messageBoxResult == MessageBoxResult.No)
            {
                e.Cancel = true;
            }
        }
    }
}
