using _619_Gorlanov_KingIT.Classes;
using System;
using System.Linq;
using System.Windows;
using System.Windows.Controls;

namespace _619_Gorlanov_KingIT.Pages
{
    /// <summary>
    /// Логика взаимодействия для PavilionsPage.xaml
    /// </summary>
    public partial class PavilionsPage : Page
    {
        int ShoppingCenterID;

        public PavilionsPage(int shoppingCenterID)
        {
            InitializeComponent();
            ShoppingCenterID = shoppingCenterID;
            var statuses = Core.GetContext().StatusPavilion.ToList();
            StatusPavilion stsc = new StatusPavilion();
            stsc.Name = "Все";
            statuses.Add(stsc);
            StatusComboBox.ItemsSource = statuses;
            StatusComboBox.SelectedItem = StatusComboBox.Items[StatusComboBox.Items.Count - 1];
            UpdateItems();
        }

        private void StatusComboBox_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            Sort();
        }

        private void CreatePavilionButton_Click(object sender, RoutedEventArgs e)
        {
            this.NavigationService.Navigate(new AddEditPavilionPage(ShoppingCenterID, null));
        }

        private void EditPavilionButton_Click(object sender, RoutedEventArgs e)
        {
            Pavilion selectedPavilion = (PavilionListView.SelectedItem as Pavilion);
            if (PavilionListView.SelectedItem != null && selectedPavilion.StatusPavilionID != 2 && selectedPavilion.StatusPavilionID != 4)
            {
                this.NavigationService.Navigate(new AddEditPavilionPage(ShoppingCenterID, selectedPavilion));
            }
            else if(PavilionListView.SelectedItem == null)
            {
                MessageBox.Show("Выберите павильон!", "Ошибка!", MessageBoxButton.OK, MessageBoxImage.Error);
            }
            else if(selectedPavilion.StatusPavilionID != 2 || selectedPavilion.StatusPavilionID != 4)
            {
                MessageBox.Show("Данный павильон нельзя отредактировать!", "Ошибка!", MessageBoxButton.OK, MessageBoxImage.Error);
            }
        }

        private void UpdateItems()
        {
            var pavilions = Core.GetContext().Pavilion.ToList();
            pavilions = pavilions.Where(p => p.ShoppingCenterID == ShoppingCenterID).ToList();
            PavilionListView.ItemsSource = pavilions;
        }

        private void Page_Loaded(object sender, RoutedEventArgs e)
        {
            UpdateItems();
        }

        private void DeletePavilionButton_Click(object sender, RoutedEventArgs e)
        {
            if (PavilionListView.SelectedItem != null)
            {
                var messageBoxResult = MessageBox.Show("Вы точно хотите удалить данный павильон?", "Уведомление!", MessageBoxButton.YesNo, MessageBoxImage.Warning);
                if (messageBoxResult == MessageBoxResult.Yes)
                {
                    try
                    {
                        Pavilion selectedPavilion = (PavilionListView.SelectedItem as Pavilion);
                        if(selectedPavilion.StatusPavilionID != 2 && selectedPavilion.StatusPavilionID != 4)
                        {
                            Core.GetContext().Pavilion.Remove(selectedPavilion);
                            Core.GetContext().SaveChanges();
                            MessageBox.Show("Данный павильон был успешно удалён!", "Успех!", MessageBoxButton.OK, MessageBoxImage.Information);
                            UpdateItems();
                        }
                        else
                        {
                            MessageBox.Show("Данный павильон нельзя удалить!", "Ошибка!", MessageBoxButton.OK, MessageBoxImage.Error);
                        }
                    }
                    catch
                    {
                        MessageBox.Show("При удалении павильона произошла ошибка!", "Ошибка!", MessageBoxButton.OK, MessageBoxImage.Error);
                    }
                }
            }
            else
            {
                MessageBox.Show("Выберите павильон!", "Ошибка!", MessageBoxButton.OK, MessageBoxImage.Error);
            }

        }

        private void BackButton_Click(object sender, RoutedEventArgs e)
        {
            this.NavigationService.GoBack();
        }

        private void FloorTextBox_TextChanged(object sender, TextChangedEventArgs e)
        {
            Sort();
        }

        private void Sort()
        {
            try
            {
                var pavilions = Core.GetContext().Pavilion.ToList();
                pavilions = pavilions.Where(p => p.ShoppingCenterID == ShoppingCenterID).ToList();

                if ((StatusComboBox.SelectedItem as StatusPavilion).Name != "Все")
                {
                    pavilions = pavilions.Where(p => p.StatusPavilion == (StatusComboBox.SelectedItem as StatusPavilion)).ToList();
                }
                
                if (!String.IsNullOrEmpty(FloorTextBox.Text))
                {
                    pavilions = pavilions.Where(p => p.Floor == Convert.ToInt32(FloorTextBox.Text)).ToList();
                }

                if (!String.IsNullOrEmpty(SquareFromTextBox.Text))
                {
                    pavilions = pavilions.Where(p => p.Square >= Convert.ToInt32(SquareFromTextBox.Text)).ToList();
                }

                if (!String.IsNullOrEmpty(SquareToTextBox.Text))
                {
                    pavilions = pavilions.Where(p => p.Square <= Convert.ToInt32(SquareToTextBox.Text)).ToList();
                }

                PavilionListView.ItemsSource = pavilions;
            }
            catch
            {
                MessageBox.Show("При сортировке возникла ошибка!", "Ошибка!", MessageBoxButton.OK, MessageBoxImage.Error);
            }
        }

        private void SquareFromTextBox_TextChanged(object sender, TextChangedEventArgs e)
        {
            Sort();
        }

        private void SquareToTextBox_TextChanged(object sender, TextChangedEventArgs e)
        {
            Sort();
        }
    }
}
