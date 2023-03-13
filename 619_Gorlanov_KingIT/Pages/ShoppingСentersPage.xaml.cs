using _619_Gorlanov_KingIT.Classes;
using System.Linq;
using System.Windows;
using System.Windows.Controls;

namespace _619_Gorlanov_KingIT.Pages
{
    /// <summary>
    /// Логика взаимодействия для ShoppingСentersPage.xaml
    /// </summary>
    public partial class ShoppingСentersPage : Page
    {
        public ShoppingСentersPage()
        {
            InitializeComponent();
            var statuses = Core.GetContext().StatusSC.ToList();
            StatusSC stsc = new StatusSC();
            stsc.Name = "Все";
            statuses.Add(stsc);
            StatusComboBox.ItemsSource = statuses;
            StatusComboBox.SelectedItem = StatusComboBox.Items[StatusComboBox.Items.Count - 1];
            UpdateItems();
        }

        private void StatusComboBox_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            var shoppingCenters = Core.GetContext().ShoppingCenter.ToList();
            if((StatusComboBox.SelectedItem as StatusSC).Name == "Все")
            {
                shoppingCenters = shoppingCenters.OrderBy(sc => sc.City.Name).OrderBy(sc => sc.StatusSC.Name).ToList();
                SCListView.ItemsSource = shoppingCenters;
                return;
            }
            var filteredShoppingCenters = shoppingCenters.Where(sc => sc.StatusSC.Name == (StatusComboBox.SelectedItem as StatusSC).Name);
            filteredShoppingCenters = filteredShoppingCenters.OrderBy(sc => sc.City.Name).OrderBy(sc => sc.StatusSC.Name).ToList();
            SCListView.ItemsSource = filteredShoppingCenters;
        }

        private void CreateSCButton_Click(object sender, RoutedEventArgs e)
        {
            this.NavigationService.Navigate(new AddEditSCPage());
        }

        private void EditSCButton_Click(object sender, RoutedEventArgs e)
        {
            if(SCListView.SelectedItem != null)
            {
                ShoppingCenter selectedShoppingCenter = (SCListView.SelectedItem as ShoppingCenter);
                this.NavigationService.Navigate(new AddEditSCPage(selectedShoppingCenter));
            }
            else
            {
                MessageBox.Show("Выберите тороговый центр!", "Ошибка!", MessageBoxButton.OK, MessageBoxImage.Error);
            }
        }

        private void UpdateItems()
        {
            var shoppingCenters = Core.GetContext().ShoppingCenter.ToList();
            shoppingCenters = shoppingCenters.OrderBy(sc => sc.City.Name).ThenBy(sc => sc.StatusSC.Name).ToList();
            SCListView.ItemsSource = shoppingCenters;
        }

        private void Page_Loaded(object sender, RoutedEventArgs e)
        {
            UpdateItems();
        }

        private void DeleteSCButton_Click(object sender, RoutedEventArgs e)
        {
            if (SCListView.SelectedItem != null)
            {
                var messageBoxResult = MessageBox.Show("Вы точно хотите удалить данный торговый центр?", "Уведомление!", MessageBoxButton.YesNo, MessageBoxImage.Warning);
                if (messageBoxResult == MessageBoxResult.Yes)
                {
                    try
                    {
                        ShoppingCenter selectedShoppingCenter = (SCListView.SelectedItem as ShoppingCenter);
                        Core.GetContext().ShoppingCenter.Remove(selectedShoppingCenter);
                        Core.GetContext().SaveChanges();
                        MessageBox.Show("Данный торговый центр был успешно удалён!", "Успех!", MessageBoxButton.OK, MessageBoxImage.Information);
                        UpdateItems();
                    }
                    catch
                    {
                        MessageBox.Show("При удалении торгового центра произошла ошибка!", "Ошибка!", MessageBoxButton.OK, MessageBoxImage.Error);
                    }
                }
            }
            else
            {
                MessageBox.Show("Выберите тороговый центр!", "Ошибка!", MessageBoxButton.OK, MessageBoxImage.Error);
            }
        }

        private void OpenPavilionListButton_Click(object sender, RoutedEventArgs e)
        {
            if (SCListView.SelectedItem != null)
            {
                this.NavigationService.Navigate(new PavilionsPage((SCListView.SelectedItem as ShoppingCenter).ID));
            }
            else
            {
                MessageBox.Show("Выберите тороговый центр!", "Ошибка!", MessageBoxButton.OK, MessageBoxImage.Error);
            }
        }
    }
}
