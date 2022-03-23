using System.Windows;

namespace Mail.Utils
{
    public static class MessageShower
    {
        public static void ShowError(string message)
        {
            MessageBox.Show(message, "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
        }
    }
}