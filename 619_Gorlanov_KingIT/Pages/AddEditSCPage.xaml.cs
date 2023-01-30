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
    /// Логика взаимодействия для AddSCPage.xaml
    /// </summary>
    public partial class AddEditSCPage : Page
    {
        ShoppingCenter CurrentShoppingCenter = null;

        public AddEditSCPage(ShoppingCenter shoppingCenter = null)
        {
            InitializeComponent();
            var statuses = Core.GetContext().StatusSC.ToList();
            StatusComboBox.ItemsSource = statuses;
            var cities = Core.GetContext().City.ToList();
            CityComboBox.ItemsSource = cities;
            if(shoppingCenter != null)
            {
                CurrentShoppingCenter = shoppingCenter;
                NameTextBox.Text = shoppingCenter.Name;
                StatusComboBox.SelectedItem = shoppingCenter.StatusSC;
                PavilionsCountTextBox.Text = shoppingCenter.PavilionsCount.ToString();
                CityComboBox.SelectedItem = shoppingCenter.City;
                PriceTextBox.Text = shoppingCenter.Price.ToString();
                ValueAddedRatioTextBox.Text = shoppingCenter.ValueAddedRatio.ToString();
                FloorsTextBox.Text = shoppingCenter.Floors.ToString();
                PathImageTextBox.Text = shoppingCenter.Image;
                CreateButton.Content = "Сохранить";
            }
        }

        private void CreateButton_Click(object sender, RoutedEventArgs e)
        {
            if(String.IsNullOrEmpty(NameTextBox.Text) || String.IsNullOrEmpty(ValueAddedRatioTextBox.Text) || String.IsNullOrEmpty(PriceTextBox.Text) || String.IsNullOrEmpty(FloorsTextBox.Text) || String.IsNullOrEmpty(PavilionsCountTextBox.Text) || String.IsNullOrEmpty(StatusComboBox.Text) || String.IsNullOrEmpty(CityComboBox.Text))
            {
                MessageBox.Show("Введите данные во все поля!", "Ошибка!", MessageBoxButton.OK, MessageBoxImage.Error);
                return;
            }
            if(CurrentShoppingCenter != null)
            {
                try
                {
                    CurrentShoppingCenter.Name = NameTextBox.Text;
                    CurrentShoppingCenter.StatusSCID = StatusComboBox.SelectedIndex + 1;
                    CurrentShoppingCenter.PavilionsCount = Convert.ToInt32(PavilionsCountTextBox.Text);
                    CurrentShoppingCenter.CityID = CityComboBox.SelectedIndex + 1;
                    if(Convert.ToInt32(PriceTextBox.Text) < 0)
                    {
                        MessageBox.Show("Укажите корректные данные затрат!", "Ошибка!", MessageBoxButton.OK, MessageBoxImage.Error);
                        return;
                    }
                    CurrentShoppingCenter.Price = Convert.ToInt32(PriceTextBox.Text);
                    CurrentShoppingCenter.ValueAddedRatio = Convert.ToDouble(ValueAddedRatioTextBox.Text);
                    CurrentShoppingCenter.Floors = Convert.ToInt32(FloorsTextBox.Text);
                    CurrentShoppingCenter.Image = PathImageTextBox.Text;
                    Core.GetContext().SaveChanges();
                    MessageBox.Show("Торговый центр был успешно изменён!", "Успех!", MessageBoxButton.OK, MessageBoxImage.Information);
                    this.NavigationService.GoBack();
                }
                catch
                {
                    MessageBox.Show("При изменении торгового центра произошла ошибка!", "Ошибка!", MessageBoxButton.OK, MessageBoxImage.Error);
                }
            }
            else
            {
                try
                {
                    ShoppingCenter newShoppingCenter = new ShoppingCenter();
                    newShoppingCenter.Name = NameTextBox.Text;
                    newShoppingCenter.StatusSCID = StatusComboBox.SelectedIndex + 1;
                    newShoppingCenter.PavilionsCount = Convert.ToInt32(PavilionsCountTextBox.Text);
                    newShoppingCenter.CityID = CityComboBox.SelectedIndex + 1;
                    if (Convert.ToInt32(PriceTextBox.Text) < 0)
                    {
                        MessageBox.Show("Укажите корректные данные затрат!", "Ошибка!", MessageBoxButton.OK, MessageBoxImage.Error);
                        return;
                    }
                    newShoppingCenter.Price = Convert.ToInt32(PriceTextBox.Text);
                    newShoppingCenter.ValueAddedRatio = Convert.ToDouble(ValueAddedRatioTextBox.Text);
                    newShoppingCenter.Floors = Convert.ToInt32(FloorsTextBox.Text);
                    newShoppingCenter.Image = PathImageTextBox.Text;
                    Core.GetContext().ShoppingCenter.Add(newShoppingCenter);
                    Core.GetContext().SaveChanges();
                    MessageBox.Show("Новый торговый центр был успешно создан!", "Успех!", MessageBoxButton.OK, MessageBoxImage.Information);
                    this.NavigationService.GoBack();
                }
                catch
                {
                    MessageBox.Show("При создании торгового центра произошла ошибка!", "Ошибка!", MessageBoxButton.OK, MessageBoxImage.Error);
                }
            }
        }

        private void CancelButton_Click(object sender, RoutedEventArgs e)
        {
            this.NavigationService.GoBack();
        }

        private void StatusComboBox_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            if((StatusComboBox.SelectedItem as StatusSC).ID == 3 && CurrentShoppingCenter != null)
            {
                MessageBox.Show("Нельзя установить статус \"Удалён\"!", "Предупреждение!", MessageBoxButton.OK, MessageBoxImage.Warning);
                StatusComboBox.SelectedItem = CurrentShoppingCenter.StatusSC;
            }

            if((StatusComboBox.SelectedItem as StatusSC).ID == 1 && CurrentShoppingCenter != null)
            {
                var shoppingCenters = Core.GetContext().ShoppingCenter.ToList();
                var reversedPavilion = CurrentShoppingCenter.Pavilion.FirstOrDefault(p => p.StatusPavilionID == 2);
                if(reversedPavilion != null)
                {
                    MessageBox.Show("Нельзя установить статус \"План\" для данного отеля!", "Предупреждение!", MessageBoxButton.OK, MessageBoxImage.Warning);
                    StatusComboBox.SelectedItem = CurrentShoppingCenter.StatusSC;
                }
            }
        }
    }
}
