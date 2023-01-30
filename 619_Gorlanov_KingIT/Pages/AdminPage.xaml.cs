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
    /// Логика взаимодействия для AdminPage.xaml
    /// </summary>
    public partial class AdminPage : Page
    {
        public AdminPage()
        {
            InitializeComponent();
            UpdateItems();
        }

        private void LastNameTextBox_TextChanged(object sender, TextChangedEventArgs e)
        {
            var users = Core.GetContext().Employee.ToList();
            if (!String.IsNullOrEmpty(LastNameTextBox.Text))
            {
                users = users.Where(u => u.LastName.ToLower().Contains(LastNameTextBox.Text.ToLower())).ToList();
            }
            UserListView.ItemsSource = users;
        }

        private void UpdateItems()
        {
            var users = Core.GetContext().Employee.ToList();
            UserListView.ItemsSource = users;
        }

        private void CreateUserButton_Click(object sender, RoutedEventArgs e)
        {
            this.NavigationService.Navigate(new AddEditUserPage());
        }

        private void EditUserButton_Click(object sender, RoutedEventArgs e)
        {
            Employee selectedUser = (UserListView.SelectedItem as Employee);
            if (UserListView.SelectedItem != null)
            {
                this.NavigationService.Navigate(new AddEditUserPage(selectedUser));
            }
            else if (UserListView.SelectedItem == null)
            {
                MessageBox.Show("Выберите пользователя!", "Ошибка!", MessageBoxButton.OK, MessageBoxImage.Error);
            }
        }

        private void DeleteUserButton_Click(object sender, RoutedEventArgs e)
        {
            if (UserListView.SelectedItem != null)
            {
                var messageBoxResult = MessageBox.Show("Вы точно хотите удалить данного пользователя?", "Уведомление!", MessageBoxButton.YesNo, MessageBoxImage.Warning);
                if (messageBoxResult == MessageBoxResult.Yes)
                {
                    try
                    {
                        Employee selectedUser = (UserListView.SelectedItem as Employee);
                        Core.GetContext().Employee.Remove(selectedUser);
                        Core.GetContext().SaveChanges();
                        MessageBox.Show("Данный пользователь был успешно удалён!", "Успех!", MessageBoxButton.OK, MessageBoxImage.Information);
                        UpdateItems();
                        
                    }
                    catch
                    {
                        MessageBox.Show("При удалении пользователя произошла ошибка!", "Ошибка!", MessageBoxButton.OK, MessageBoxImage.Error);
                    }
                }
            }
            else
            {
                MessageBox.Show("Выберите пользователя!", "Ошибка!", MessageBoxButton.OK, MessageBoxImage.Error);
            }
        }

        private void Page_Loaded(object sender, RoutedEventArgs e)
        {
            UpdateItems();
        }
    }
}
