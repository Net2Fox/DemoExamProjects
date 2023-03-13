using System;
using System.Windows;

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
