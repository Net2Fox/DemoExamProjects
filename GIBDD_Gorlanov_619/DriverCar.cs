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
    
    public partial class DriverCar
    {
        public int ID { get; set; }
        public int DriverID { get; set; }
        public int CarID { get; set; }
    
        public virtual Car Car { get; set; }
        public virtual Driver Driver { get; set; }
    }
}
