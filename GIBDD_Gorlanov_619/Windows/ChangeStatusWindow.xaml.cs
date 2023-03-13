using System.Windows;

namespace GIBDD_Gorlanov_619.Windows
{
    /// <summary>
    /// Логика взаимодействия для ChangeStatusWindow.xaml
    /// </summary>
    public partial class ChangeStatusWindow : Window
    {
        public string Description { get; set; }
        public ChangeStatusWindow()
        {
            InitializeComponent();
            DataContext = this;
        }

        private void Button_Click(object sender, RoutedEventArgs e)
        {
            this.DialogResult = true;
            this.Owner.Focus();
            this.Close();
        }
    }
}
