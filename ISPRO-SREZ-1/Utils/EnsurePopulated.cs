using SREZ_1.Models.DB;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Threading.Tasks;

namespace SREZ_1.Utils
{
    public static class EnsurePopulated
    {
        private static readonly LabaratoryEntities entities = new LabaratoryEntities();

        public async static Task InsertPhotos()
        {
            string pathPhotoLaborant = @"F:\Задание\Session 1\laborant_2.png",
            pathPhotoBookkeeper = @"F:\Задание\Session 1\Бухгалтер.jpeg",
            pathPhotoAdmin = @"F:\Задание\Session 1\Администратор.png";

            List<User> users = entities.User.ToList();

            foreach (var user in users)
            {
                Dictionary<int, string> typesPhoto = new Dictionary<int, string>()
                {
                    [1] = pathPhotoLaborant,
                    [2] = pathPhotoBookkeeper,
                    [3] = pathPhotoAdmin,
                };

                if (user.Photo == null)
                {
                    user.Photo = File.ReadAllBytes(typesPhoto[user.Type]);
                }
            }

            await entities.SaveChangesAsync();
        }
    }
}