using System;
using System.Linq;
using System.Windows;

namespace DoeduSamGorlanov
{
    /// <summary>
    /// Логика взаимодействия для AddEditProductWindow.xaml
    /// </summary>
    public partial class AddEditProductWindow : Window
    {
        Product CurrentProduct;

        public AddEditProductWindow(Product selectedProduct = null)
        {
            InitializeComponent();
            var manufacturers = DoedySamGorlanovEntities.GetContext().Manufacturer.ToList();
            ManufacturerComboBox.ItemsSource = manufacturers;
            if (selectedProduct != null)
            {
                CurrentProduct = selectedProduct;
                IDTextBox.Text = selectedProduct.ID.ToString();
                ProductNameTextBox.Text = selectedProduct.Title;
                CostTextBox.Text = selectedProduct.Cost.ToString();
                DescriptionTextBox.Text = selectedProduct.Description;
                MainImagePathTextBox.Text = selectedProduct.MainImagePath;
                ManufacturerComboBox.SelectedItem = selectedProduct.Manufacturer;
            }
            else if(selectedProduct == null)
            {
                IDTextBlock.Visibility = Visibility.Hidden;
                IDTextBox.Visibility = Visibility.Hidden;
                SaveButton.Content = "Добавить";
            }
        }

        private void SaveButton_Click(object sender, RoutedEventArgs e)
        {
            if(CurrentProduct == null)
            {
                CurrentProduct = new Product();
                CurrentProduct.Title = ProductNameTextBox.Text;
                try
                {
                    CurrentProduct.Cost = Convert.ToDecimal(CostTextBox.Text);
                }
                catch
                {
                    MessageBox.Show("Укажите корректное значение стоимости!", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
                    return;
                }
                CurrentProduct.Description = DescriptionTextBox.Text;
                CurrentProduct.MainImagePath = MainImagePathTextBox.Text;
                if (ManufacturerComboBox.SelectedItem == null)
                {
                    MessageBox.Show("Выберите производителя!", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
                    return;
                }
                CurrentProduct.Manufacturer = ManufacturerComboBox.SelectedItem as Manufacturer;
                CurrentProduct.IsActive = true;
                try
                {
                    DoedySamGorlanovEntities.GetContext().Product.Add(CurrentProduct);
                    DoedySamGorlanovEntities.GetContext().SaveChanges();
                }
                catch
                {
                    MessageBox.Show("Произошла непредвиденная ошибка! Обратитесь к системному администратору!", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
                }
                MessageBox.Show("Товар был успешно добавлен!", "Успех", MessageBoxButton.OK, MessageBoxImage.Information);
            }
            else
            {
                CurrentProduct.Title = ProductNameTextBox.Text;
                try
                {
                    CurrentProduct.Cost = Convert.ToDecimal(CostTextBox.Text);
                }
                catch
                {
                    MessageBox.Show("Укажите корректное значение стоимости!", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
                    return;
                }
                CurrentProduct.Description = DescriptionTextBox.Text;
                CurrentProduct.MainImagePath = MainImagePathTextBox.Text;
                if(ManufacturerComboBox.SelectedItem == null)
                {
                    MessageBox.Show("Выберите производителя!", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
                    return;
                }
                CurrentProduct.Manufacturer = ManufacturerComboBox.SelectedItem as Manufacturer;
                try
                {
                    DoedySamGorlanovEntities.GetContext().SaveChanges();
                }
                catch
                {
                    MessageBox.Show("Произошла непредвиденная ошибка! Обратитесь к системному администратору!", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
                }
                MessageBox.Show("Товар был успешно изменён!", "Успех", MessageBoxButton.OK, MessageBoxImage.Information);
            }
            
            this.Close();
        }

        private void CancelButton_Click(object sender, RoutedEventArgs e)
        {
            this.Close();
        }
    }
}
