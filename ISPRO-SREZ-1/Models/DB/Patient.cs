//------------------------------------------------------------------------------
// <auto-generated>
//     Этот код создан по шаблону.
//
//     Изменения, вносимые в этот файл вручную, могут привести к непредвиденной работе приложения.
//     Изменения, вносимые в этот файл вручную, будут перезаписаны при повторном создании кода.
// </auto-generated>
//------------------------------------------------------------------------------

namespace SREZ_1.Models.DB
{
    using System;
    using System.Collections.Generic;
    
    public partial class Patient
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Patient()
        {
            this.ProvideService = new HashSet<ProvideService>();
        }
    
        public int PatientID { get; set; }
        public string FullName { get; set; }
        public string Login { get; set; }
        public string Password { get; set; }
        public System.Guid GUID { get; set; }
        public string Email { get; set; }
        public int SocialSecNumber { get; set; }
        public string Ein { get; set; }
        public string SocialType { get; set; }
        public string Phone { get; set; }
        public string PassportSerie { get; set; }
        public string PassportNumber { get; set; }
        public byte[] Birthdate { get; set; }
        public string Country { get; set; }
        public string UserAgent { get; set; }
        public Nullable<int> InsuranceCompanyID { get; set; }
    
        public virtual InsuranceCompany InsuranceCompany { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<ProvideService> ProvideService { get; set; }
    }
}