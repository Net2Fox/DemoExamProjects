﻿//------------------------------------------------------------------------------
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
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    
    public partial class KingITEntities : DbContext
    {
        public KingITEntities()
            : base("name=KingITEntities")
        {
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public virtual DbSet<City> City { get; set; }
        public virtual DbSet<Employee> Employee { get; set; }
        public virtual DbSet<Gender> Gender { get; set; }
        public virtual DbSet<Pavilion> Pavilion { get; set; }
        public virtual DbSet<Rent> Rent { get; set; }
        public virtual DbSet<Renter> Renter { get; set; }
        public virtual DbSet<Role> Role { get; set; }
        public virtual DbSet<ShoppingCenter> ShoppingCenter { get; set; }
        public virtual DbSet<StatusPavilion> StatusPavilion { get; set; }
        public virtual DbSet<StatusRent> StatusRent { get; set; }
        public virtual DbSet<StatusSC> StatusSC { get; set; }
        public virtual DbSet<sysdiagrams> sysdiagrams { get; set; }
    }
}
