using SREZ_1.Models.DB;
using SREZ_1.Views.Pages;
using SREZ_1.Views.Windows;
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

namespace SREZ_1
{
    /// <summary>
    /// Логика взаимодействия для MainWindow.xaml
    /// </summary>
    public partial class WMain : Window
    {
        public User User { get; set;}

        public WMain(User user)
        {
            InitializeComponent();
            User = user;
            DataContext = this;
        }

        private void Window_Loaded(object sender, RoutedEventArgs e)
        {
            Dictionary<int, Page> typeUserPage = new Dictionary<int, Page>
            {
                [1] = new PLaborant(),
                [2] = new PBookkepeer(),
                [3] = new PAdmin(),
            };

            FrMain.Navigate(typeUserPage[User.Type]);
        }

        private void BtnLogOut_Click(object sender, RoutedEventArgs e)
        {
            new WAuthorization().Show();
            Close();
        }
    }
}