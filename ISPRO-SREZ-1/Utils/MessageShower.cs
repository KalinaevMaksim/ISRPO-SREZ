using System.Windows;

namespace SREZ_1.Utils
{
    public static class MessageShower
    {
        public static void ShowError(string message)
        {
            MessageBox.Show(message, "Ошибка", MessageBoxButton.OKCancel, MessageBoxImage.Error);
        }
    }
}