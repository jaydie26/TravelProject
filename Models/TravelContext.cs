namespace TravelProject.Models
{
    using System;
    using System.Data.Entity;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Linq;

    public partial class TravelContext : DbContext
    {
        public TravelContext()
            : base("name=MyDB")
        {
        }

        public virtual DbSet<ChiTietTour> ChiTietTours { get; set; }
        public virtual DbSet<DiaDanh> DiaDanhs { get; set; }
        public virtual DbSet<KhachHang> KhachHangs { get; set; }
        public virtual DbSet<PhanHoi> PhanHois { get; set; }
        public virtual DbSet<PhieuDatTour> PhieuDatTours { get; set; }
        public virtual DbSet<sysdiagram> sysdiagrams { get; set; }
        public virtual DbSet<ThanhVien> ThanhViens { get; set; }
        public virtual DbSet<Tour> Tours { get; set; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Entity<KhachHang>()
                .Property(e => e.Email)
                .IsUnicode(false);

            modelBuilder.Entity<KhachHang>()
                .Property(e => e.SoDienThoai)
                .IsUnicode(false);

            modelBuilder.Entity<ThanhVien>()
                .Property(e => e.username)
                .IsUnicode(false);

            modelBuilder.Entity<ThanhVien>()
                .Property(e => e.pass)
                .IsUnicode(false);

            modelBuilder.Entity<Tour>()
                .Property(e => e.Gia)
                .HasPrecision(18, 0);
        }
    }
}
