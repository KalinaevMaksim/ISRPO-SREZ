namespace SREZ_1.Models.DB
{
    public partial class User
    {
        public string GetTypeUser => ((TypesUser)Type).ToString();
    }
}