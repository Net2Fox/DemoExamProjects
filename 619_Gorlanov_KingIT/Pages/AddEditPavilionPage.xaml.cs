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
using _619_Gorlanov_KingIT.Classes;

namespace _619_Gorlanov_KingIT.Pages
{
    /// <summary>
    /// Логика взаимодействия для AddEditPavilionPage.xaml
    /// </summary>
    public partial class AddEditPavilionPage : Page
    {
        Pavilion CurrentPavilion = null;
        int ShoppingCenterID;

        public AddEditPavilionPage(int selectedShoppingCenterID, Pavilion selectedPavilion = null)
        {
            InitializeComponent();
            var statuses = Core.GetContext().StatusPavilion.ToList();
            StatusComboBox.ItemsSource = statuses;
            if (selectedPavilion != null)
            {
                CurrentPavilion = selectedPavilion;
                FloorTextBox.Text = selectedPavilion.Floor.ToString();
                PavilionNumberTextBox.Text = selectedPavilion.PavilionNumber;
                StatusComboBox.SelectedItem = selectedPavilion.StatusPavilion;
                SquareTextBox.Text = selectedPavilion.Square.ToString();
                PriceTextBox.Text = selectedPavilion.PricePerSquare.ToString();
                ValueAddedRatioTextBox.Text = selectedPavilion.ValueAddedRatio.ToString();
                CreateButton.Content = "Сохранить";
            }
            ShoppingCenterID = selectedShoppingCenterID;
        }

        private void CreateButton_Click(object sender, RoutedEventArgs e)
        {
            if (String.IsNullOrEmpty(FloorTextBox.Text) || String.IsNullOrEmpty(ValueAddedRatioTextBox.Text) || String.IsNullOrEmpty(PriceTextBox.Text) || String.IsNullOrEmpty(PavilionNumberTextBox.Text) || String.IsNullOrEmpty(StatusComboBox.Text) || String.IsNullOrEmpty(SquareTextBox.Text))
            {
                MessageBox.Show("Введите данные во все поля!", "Ошибка!", MessageBoxButton.OK, MessageBoxImage.Error);
                return;
            }
            if (CurrentPavilion != null)
            {
                try
                {
                    CurrentPavilion.PavilionNumber = PavilionNumberTextBox.Text;
                    CurrentPavilion.Floor = Convert.ToInt32(FloorTextBox.Text);
                    CurrentPavilion.StatusPavilionID = (StatusComboBox.SelectedItem as StatusPavilion).ID;
                    CurrentPavilion.Square = Convert.ToDouble(SquareTextBox.Text);
                    CurrentPavilion.PricePerSquare = Convert.ToDouble(PriceTextBox.Text);
                    if(Convert.ToDouble(ValueAddedRatioTextBox.Text) < 0.1)
                    {
                        return;
                    }
                    CurrentPavilion.ValueAddedRatio = Convert.ToDouble(ValueAddedRatioTextBox.Text);
                    Core.GetContext().SaveChanges();
                    MessageBox.Show("Павильон был успешно изменён!", "Успех!", MessageBoxButton.OK, MessageBoxImage.Information);
                    this.NavigationService.GoBack();
                }
                catch
                {
                    MessageBox.Show("При изменении павильона произошла ошибка!", "Ошибка!", MessageBoxButton.OK, MessageBoxImage.Error);
                }
            }
            else
            {
                try
                {
                    Pavilion newPavilion = new Pavilion();
                    newPavilion.ShoppingCenterID = ShoppingCenterID;
                    newPavilion.PavilionNumber = PavilionNumberTextBox.Text;
                    newPavilion.Floor = Convert.ToInt32(FloorTextBox.Text);
                    newPavilion.StatusPavilionID = (StatusComboBox.SelectedItem as StatusPavilion).ID;
                    newPavilion.Square = Convert.ToDouble(SquareTextBox.Text);
                    newPavilion.PricePerSquare = Convert.ToDouble(PriceTextBox.Text);
                    newPavilion.ValueAddedRatio = Convert.ToDouble(ValueAddedRatioTextBox.Text);
                    Core.GetContext().Pavilion.Add(newPavilion);
                    Core.GetContext().SaveChanges();
                    MessageBox.Show("Новый павильон был успешно создан!", "Успех!", MessageBoxButton.OK, MessageBoxImage.Information);
                    this.NavigationService.GoBack();
                }
                catch
                {
                    MessageBox.Show("При создании павильона произошла ошибка!", "Ошибка!", MessageBoxButton.OK, MessageBoxImage.Error);
                }
            }
        }

        private void CancelButton_Click(object sender, RoutedEventArgs e)
        {
            this.NavigationService.GoBack();
        }
    }
}
