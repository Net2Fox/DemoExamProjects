using System.Windows;

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
