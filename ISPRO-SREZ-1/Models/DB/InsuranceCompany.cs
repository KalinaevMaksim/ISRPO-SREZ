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
    
    public partial class InsuranceCompany
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public InsuranceCompany()
        {
            this.Patient = new HashSet<Patient>();
        }
    
        public int InsuranceCompanyID { get; set; }
        public string InsuranceName { get; set; }
        public string insuranceAddress { get; set; }
        public int insuranceInn { get; set; }
        public string IPAdress { get; set; }
        public int InsurancePC { get; set; }
        public int InsuranceBik { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Patient> Patient { get; set; }
    }
}