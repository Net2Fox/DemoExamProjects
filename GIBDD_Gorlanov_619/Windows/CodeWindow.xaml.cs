using GIBDD_Gorlanov_619.Pages;
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

namespace GIBDD_Gorlanov_619.Windows
{
    /// <summary>
    /// Логика взаимодействия для CodeWindow.xaml
    /// </summary>
    public partial class CodeWindow : Window
    {
        public string Code;
        public CodeWindow(string code)
        {
            InitializeComponent();
            Code = code;
        }

        private void ConfirmButton_Click(object sender, RoutedEventArgs e)
        {
            if(CodeTextBox.Text == Code)
            {
                this.Owner.Focus();
                this.Owner.IsEnabled = true;
                this.DialogResult = true;
                this.Close();
            }
            else
            {
                MessageBox.Show("Неверно, попробуйте ещё раз!", "Ошибка!", MessageBoxButton.OK, MessageBoxImage.Error);
            }
        }
    }
}
