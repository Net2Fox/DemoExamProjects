//------------------------------------------------------------------------------
// <auto-generated>
//     Этот код создан по шаблону.
//
//     Изменения, вносимые в этот файл вручную, могут привести к непредвиденной работе приложения.
//     Изменения, вносимые в этот файл вручную, будут перезаписаны при повторном создании кода.
// </auto-generated>
//------------------------------------------------------------------------------

namespace _619_Gorlanov_KingIT
{
    using System;
    using System.Collections.Generic;
    
    public partial class Rent
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Rent()
        {
            this.Renter = new HashSet<Renter>();
        }
    
        public int ID { get; set; }
        public int IDRenter { get; set; }
        public int ShoppingCenterID { get; set; }
        public int IDEmployee { get; set; }
        public string PavilionNumber { get; set; }
        public int StatusRentID { get; set; }
        public System.DateTime BeginRent { get; set; }
        public System.DateTime EndRent { get; set; }

        public Nullable<int> RentPrice { get; set; }
    
        public virtual Employee Employee { get; set; }
        public virtual ShoppingCenter ShoppingCenter { get; set; }
        public virtual StatusRent StatusRent { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Renter> Renter { get; set; }
    }
}
