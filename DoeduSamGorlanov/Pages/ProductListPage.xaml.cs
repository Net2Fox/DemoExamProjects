using System;
using System.Linq;
using System.Windows;
using System.Windows.Controls;

namespace DoeduSamGorlanov.Pages
{
    /// <summary>
    /// Логика взаимодействия для ProductListPage.xaml
    /// </summary>
    public partial class ProductListPage : Page
    {
        int ViewedCountItems = 0;
        int AllCountItems = 0;

        public ProductListPage()
        {
            InitializeComponent();
            Update();
            ViewCountTextBlock.Text = $"{ViewedCountItems} из {AllCountItems}";
            var manufacturers = DoedySamGorlanovEntities.GetContext().Manufacturer.ToList();
            Manufacturer mnAll = new Manufacturer();
            mnAll.Name = "Все производители";
            manufacturers.Insert(0, mnAll);
            ManufacturerComboBox.ItemsSource = manufacturers;
        }

        internal void Update()
        {
            var products = DoedySamGorlanovEntities.GetContext().Product.ToList();
            ProductsListView.ItemsSource = products;
            ViewedCountItems = products.Count();
            AllCountItems = products.Count();
        }

        private void Sort()
        {
            var products = DoedySamGorlanovEntities.GetContext().Product.ToList();
            if (!String.IsNullOrEmpty(TitleTextBox.Text))
            {
                products = products.Where(p => p.Title.ToLower().Contains(TitleTextBox.Text.ToLower())).ToList();
            }
            if (ManufacturerComboBox.SelectedIndex != 0)
            {
                products = products.Where(p => p.Manufacturer == ManufacturerComboBox.SelectedItem).ToList();
            }
            if (CostAscRadioButton.IsChecked == true)
            {
                products = products.OrderBy(p => p.Cost).ToList();
            }
            if (CostDescRadioButton.IsChecked == true)
            {
                products = products.OrderByDescending(p => p.Cost).ToList();
            }
            ViewedCountItems = products.Count();
            ViewCountTextBlock.Text = $"{ViewedCountItems} из {AllCountItems}";
            ProductsListView.ItemsSource = products;
        }

        private void TitleTextBox_TextChanged(object sender, TextChangedEventArgs e)
        {
            Sort();
        }

        private void ManufacturerComboBox_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            Sort();
        }

        private void CostAscRadioButton_Checked(object sender, RoutedEventArgs e)
        {
            Sort();
        }

        private void CostDescRadioButton_Checked(object sender, RoutedEventArgs e)
        {
            Sort();
        }

        private void DeleteButton_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                if (ProductsListView.SelectedItem != null)
                {
                    var selectedProduct = ProductsListView.SelectedItem as Product;
                    if (selectedProduct.ProductSale.FirstOrDefault() == null)
                    {
                        if (selectedProduct.Product1 != null)
                        {
                            foreach (Product attachedProduct in selectedProduct.Product1)
                            {
                                if (attachedProduct.ProductSale.FirstOrDefault() != null)
                                {
                                    MessageBox.Show("Данный товар нельзя удалить!", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
                                    return;
                                }
                            }
                            DoedySamGorlanovEntities.GetContext().Product.RemoveRange(selectedProduct.Product1);
                        }
                        DoedySamGorlanovEntities.GetContext().Product.Remove(selectedProduct);
                        DoedySamGorlanovEntities.GetContext().SaveChanges();
                        MessageBox.Show("Товар был успешно удалён!", "Успех", MessageBoxButton.OK, MessageBoxImage.Information);
                        Update();
                    }
                    else
                    {
                        MessageBox.Show("Данный товар нельзя удалить!", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
                    }
                }
            }
            catch
            {
                MessageBox.Show("Произошла непредвиденная ошибка! Обратитесь к системному администратору!", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
            }
        }

        private void AddButton_Click(object sender, RoutedEventArgs e)
        {
            AddEditProductWindow addEditProduct = new AddEditProductWindow();
            addEditProduct.Show();
        }

        private void EditButton_Click(object sender, RoutedEventArgs e)
        {
            if (ProductsListView.SelectedItem != null)
            {
                AddEditProductWindow addEditProduct = new AddEditProductWindow(ProductsListView.SelectedItem as Product);
                addEditProduct.Show();

            }
        }
    }
}
