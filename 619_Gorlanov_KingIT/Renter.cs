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
    
    public partial class Renter
    {
        public int ID { get; set; }
        public Nullable<int> IDRent { get; set; }
        public string Name { get; set; }
        public string PhoneNumber { get; set; }
        public string Address { get; set; }
    
        public virtual Rent Rent { get; set; }
    }
}
