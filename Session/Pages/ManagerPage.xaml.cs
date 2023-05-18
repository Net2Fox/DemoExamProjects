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

namespace Session.Pages
{
    /// <summary>
    /// Логика взаимодействия для ManagerPage.xaml
    /// </summary>
    public partial class ManagerPage : Page
    {
        public List<Order> Orders { get; set; }
        public List<Status> Statuses { get; set; }
        public ManagerPage()
        {
            InitializeComponent();
            DataContext = this;
            UpdateData();
            Statuses = Core.GetContext().Status.ToList();
            Status allStatuses = new Status();
            allStatuses.Name = "Все статусы";
            Statuses.Insert(0, allStatuses);
            StatusComboBox.ItemsSource = Statuses;
        }

        private void UpdateData()
        {
            Orders = Core.GetContext().Order.ToList();
        }

        private void Sort()
        {
            Orders = Core.GetContext().Order.ToList();
            if (SortComboBox != null && SortComboBox.SelectedIndex != 0)
            {
                switch (SortComboBox.SelectedIndex)
                {
                    case 1:
                        Orders = Orders.OrderBy(u => u.TotalPrice).ToList();
                        break;
                    case 2:
                        Orders = Orders.OrderByDescending(u => u.TotalPrice).ToList();
                        break;
                }
            }
            if (StatusComboBox != null && StatusComboBox.SelectedIndex != 0)
            {
                Orders = Orders.Where(o => o.Status == (StatusComboBox.SelectedItem as Status)).ToList();
            }
            if (OrdersDataGrid != null)
            {
                OrdersDataGrid.ItemsSource = Orders;
            }
        }

        private void SortComboBox_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            Sort();
        }

        private void StatusComboBox_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            Sort();
        }

        private void EditOrderButton_Click(object sender, RoutedEventArgs e)
        {

        }

        private void AddOrderButton_Click(object sender, RoutedEventArgs e)
        {

        }

        private void OrdersDataGrid_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            if (OrdersDataGrid.SelectedItem != null)
            {
                EditOrderButton.IsEnabled = true;
            } 
            else
            {
                EditOrderButton.IsEnabled = false;
            }
        }
    }
}
