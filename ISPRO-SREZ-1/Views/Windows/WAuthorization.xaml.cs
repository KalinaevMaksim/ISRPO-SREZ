using SREZ_1.Models.DB;
using SREZ_1.Utils;
using System.Linq;
using System.Windows;

namespace SREZ_1.Views.Windows
{
    /// <summary>
    /// Логика взаимодействия для wAuthorization.xaml
    /// </summary>
    public partial class WAuthorization : Window
    {
        private readonly LabaratoryEntities entities = new LabaratoryEntities();

        public User User { get; set; } = new User();

        public WAuthorization()
        {
            InitializeComponent();
            DataContext = this;
        }

        private async void Window_Loaded(object sender, RoutedEventArgs e)
        {
            //await EnsurePopulated.InsertPhotos();
        }

        private void PBPassword_PasswordChanged(object sender, RoutedEventArgs e)
        {
            TBPassword.Text = PBPassword.Password;
            User.Password = PBPassword.Password;
        }

        private void BtnLogIn_Click(object sender, RoutedEventArgs e)
        {
            User user = entities.User.FirstOrDefault(us => us.Login == User.Login && us.Password == User.Password);

            if (user == null)
            {
                MessageShower.ShowError("Неправильны логин или пароль");
                return;
            }

            Properties.Settings.Default.UserType = user.Type;

            new WMain(user).Show();
            Close();
        }
    }
}