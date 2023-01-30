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
using System.Windows.Shapes;

namespace _619_Gorlanov_KingIT
{
    /// <summary>
    /// Логика взаимодействия для CaptchaWindow.xaml
    /// </summary>
    public partial class CaptchaWindow : Window
    {
        int Number;
        bool СorrectCaptcha = false;

        public CaptchaWindow()
        {
            InitializeComponent();
            GenerateCaptcha();
        }

        private void CheckButton_Click(object sender, RoutedEventArgs e)
        {
            if(!String.IsNullOrEmpty(CaptchaTextBox.Text) && Convert.ToInt32(CaptchaTextBox.Text) == Number)
            {
                СorrectCaptcha = true;
                this.Owner.Focus();
                this.Owner.IsEnabled = true;
                this.Close();
            }
            else
            {
                MessageBox.Show("Неверно, попробуйте ещё раз!", "Ошибка!", MessageBoxButton.OK, MessageBoxImage.Error);
                GenerateCaptcha();
            }
        }
        
        private void GenerateCaptcha()
        {
            Random rand = new Random();
            Number = rand.Next(-100, 101);
            NumberTextBox.Text = $"Введите число: {Number}";
        }

        private void Window_Closing(object sender, System.ComponentModel.CancelEventArgs e)
        {
            e.Cancel = !СorrectCaptcha;
        }
    }
}
