//------------------------------------------------------------------------------
// <auto-generated>
//     Этот код создан по шаблону.
//
//     Изменения, вносимые в этот файл вручную, могут привести к непредвиденной работе приложения.
//     Изменения, вносимые в этот файл вручную, будут перезаписаны при повторном создании кода.
// </auto-generated>
//------------------------------------------------------------------------------

namespace GIBDD_Gorlanov_619
{
    using System;
    using System.Collections.Generic;
    
    public partial class LicenseHistory
    {
        public int ID { get; set; }
        public int LicenseID { get; set; }
        public int StatusID { get; set; }
        public string Description { get; set; }
    
        public virtual License License { get; set; }
        public virtual Status Status { get; set; }
    }
}