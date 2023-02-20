﻿using System;
using System.Collections.Generic;
using System.ComponentModel;
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
using System.Windows.Threading;
using GIBDD_Gorlanov_619.Pages;

namespace GIBDD_Gorlanov_619.Windows
{
    /// <summary>
    /// Логика взаимодействия для MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        public bool IsLoggedIn = false;
        public bool IsCodeNeed = false;

        public MainWindow()
        {
            InitializeComponent();
            
        }

        private void BackButton_Click(object sender, RoutedEventArgs e)
        {
            if (MainFrame.CanGoBack && IsLoggedIn == true)
            {
                MainFrame.GoBack();
            }
        }

        private void ExitButton_Click(object sender, RoutedEventArgs e)
        {
            if (IsLoggedIn == true)
            {
                IsLoggedIn = false;
                MainFrame.Navigate(new LoginPage());
            }
        }
    }
}
