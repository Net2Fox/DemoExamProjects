using _619_Gorlanov_KingIT.Classes;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection.Emit;
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
    /// Логика взаимодействия для RentPage.xaml
    /// </summary>
    public partial class RentPage : Page
    {
        private Renter CurrentRenter;

        public RentPage(Renter selectedRenter)
        {
            InitializeComponent();
            CurrentRenter = selectedRenter;
            UpdateItems();
        }

        private void UpdateItems()
        {
            var rents = Core.GetContext().Rent.ToList();
            rents = rents.Where(r => r.IDRenter == CurrentRenter.ID).ToList();
            //var pav = rents[0].ShoppingCenter.Pavilion.ToList()[0].Square

            // Формула
            // P=(area*area$+level$+complex$)*m;
            // area – площадь павильона, в квадратных метрах; 
            // area$ – стоимость 1 квадратного метра, настраиваемый параметр;
            // level$ –  добавочный коэффициент для стоимости квадратного метра павильона, настраиваемый коэффициент; 
            // complex$ – добавочная стоимость аренды в ТЦ, настраиваемый коэффициент для каждого ТЦ;
            // m – количество месяцев аренды павильона.
            foreach(var rent in rents)
            {
                Pavilion currentPavilion = rent.ShoppingCenter.Pavilion.ToList().FirstOrDefault(p => p.PavilionNumber == rent.PavilionNumber);
                double square = currentPavilion.Square;
                double pricePerSquare = currentPavilion.PricePerSquare;
                double pavilionValueAddedRatio = currentPavilion.ValueAddedRatio;
                double shoppingCenterValueAddedRatio = rent.ShoppingCenter.ValueAddedRatio;
                var diffRentTime = rent.EndRent - rent.BeginRent;
                double months = diffRentTime.TotalDays / 30;
                rent.RentPrice = Convert.ToInt32((square * pricePerSquare + pavilionValueAddedRatio + shoppingCenterValueAddedRatio) * months);
            }
            
            RentListView.ItemsSource = rents;

        }

        private void BackButton_Click(object sender, RoutedEventArgs e)
        {
            this.NavigationService.GoBack();
        }
    }
}
