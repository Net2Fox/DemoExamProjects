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
using System.ComponentModel;

namespace Session
{
    /// <summary>
    /// Логика взаимодействия для MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        public User CurrentUser { get; set; }

        public MainWindow()
        {
            InitializeComponent();
        }

        public void UpdateUser(User user)
        {
            CurrentUser = user;
            if (CurrentUser.Image == null)
            {
                Uri avatar = new Uri("/Images/picture.png", UriKind.Relative);
                UserImage.Source = new BitmapImage(avatar);
            }
            else
            {
                Uri avatar = new Uri(CurrentUser.Image, UriKind.Relative);
                UserImage.Source = new BitmapImage(avatar);
            }
            FullNameTextBlock.Text = $"{CurrentUser.Surname} {CurrentUser.Name} {CurrentUser.Patronymic}";
            UserRoleTextBlock.Text = CurrentUser.JobTitle.Name;
        }

        private void BackButton_Click(object sender, RoutedEventArgs e)
        {
            if (MainFrame.CanGoBack)
            {
                MainFrame.GoBack();
            }
        }

        private void MainFrame_Navigated(object sender, NavigationEventArgs e)
        {
            BackButton.IsEnabled = MainFrame.CanGoBack;
        }
    }
}
