using DoeduSamGorlanov.Pages;
using System;
using System.Windows;

namespace DoeduSamGorlanov
{
    /// <summary>
    /// Логика взаимодействия для MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        public MainWindow()
        {
            InitializeComponent();
        }

        private void Window_Activated(object sender, EventArgs e)
        {
            (MainFrame.Content as ProductListPage).Update();
        }
    }
}
