using _619_Gorlanov_KingIT.Classes;
using System;
using System.Linq;
using System.Windows;
using System.Windows.Controls;

namespace _619_Gorlanov_KingIT.Pages
{
    /// <summary>
    /// Логика взаимодействия для RentersPage.xaml
    /// </summary>
    public partial class RentersPage : Page
    {
        public RentersPage()
        {
            InitializeComponent();
            UpdateItems();
        }

        private void UpdateItems()
        {
            var renters = Core.GetContext().Renter.ToList();
            RenterListView.ItemsSource = renters;
        }

        private void NameTextBox_TextChanged(object sender, TextChangedEventArgs e)
        {
            var renters = Core.GetContext().Renter.ToList();
            if (!String.IsNullOrEmpty(NameTextBox.Text))
            {
                renters = renters.Where(r => r.Name.ToLower().Contains(NameTextBox.Text.ToLower())).ToList();
            }
            RenterListView.ItemsSource = renters;
        }

        private void EditRenterButton_Click(object sender, RoutedEventArgs e)
        {
            Renter selectedRenter = (RenterListView.SelectedItem as Renter);
            if (RenterListView.SelectedItem != null)
            {
                this.NavigationService.Navigate(new AddEditRenterPage(selectedRenter));
            }
            else if (RenterListView.SelectedItem == null)
            {
                MessageBox.Show("Выберите арендатора!", "Ошибка!", MessageBoxButton.OK, MessageBoxImage.Error);
            }
        }

        private void CreateRenterButton_Click(object sender, RoutedEventArgs e)
        {
            this.NavigationService.Navigate(new AddEditRenterPage());
        }

        private void DeleteRenterButton_Click(object sender, RoutedEventArgs e)
        {
            if (RenterListView.SelectedItem != null)
            {
                var messageBoxResult = MessageBox.Show("Вы точно хотите удалить данного арендатора?", "Уведомление!", MessageBoxButton.YesNo, MessageBoxImage.Warning);
                if (messageBoxResult == MessageBoxResult.Yes)
                {
                    try
                    {
                        Renter selectedRenter = (RenterListView.SelectedItem as Renter);
                        Core.GetContext().Renter.Remove(selectedRenter);
                        Core.GetContext().SaveChanges();
                        MessageBox.Show("Данный арнедатор был успешно удалён!", "Успех!", MessageBoxButton.OK, MessageBoxImage.Information);
                        UpdateItems();

                    }
                    catch
                    {
                        MessageBox.Show("При удалении арендатора произошла ошибка!", "Ошибка!", MessageBoxButton.OK, MessageBoxImage.Error);
                    }
                }
            }
            else
            {
                MessageBox.Show("Выберите арендатора!", "Ошибка!", MessageBoxButton.OK, MessageBoxImage.Error);
            }
        }

        private void OpenRenterListButton_Click(object sender, RoutedEventArgs e)
        {
            if (RenterListView.SelectedItem != null)
            {
                this.NavigationService.Navigate(new RentPage(RenterListView.SelectedItem as Renter));
            }
        }

        private void Page_Loaded(object sender, RoutedEventArgs e)
        {
            UpdateItems();
        }
    }
}
