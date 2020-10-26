namespace TravelProject.Models
{
    using System;
    using System.Data.Entity;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Linq;

    public partial class TravelContext : DbContext
    {
        public TravelContext()
            : base("name=TravelContext2")
        {
        }

        public virtual DbSet<ChiTietTour> ChiTietTours { get; set; }
        public virtual DbSet<DiaDanh> DiaDanhs { get; set; }
        public virtual DbSet<KhachHang> KhachHangs { get; set; }
        public virtual DbSet<Link> Links { get; set; }
        public virtual DbSet<PhanHoi> PhanHois { get; set; }
        public virtual DbSet<PhieuDatTour> PhieuDatTours { get; set; }
        public virtual DbSet<ThanhVien> ThanhViens { get; set; }
        public virtual DbSet<Tour> Tours { get; set; }
        public virtual DbSet<Tour_Diadanh> Tour_Diadanh { get; set; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Entity<DiaDanh>()
                .Property(e => e.Img)
                .IsUnicode(false);

            modelBuilder.Entity<DiaDanh>()
                .Property(e => e.MoTa)
                .IsUnicode(false);

            modelBuilder.Entity<KhachHang>()
                .Property(e => e.Email)
                .IsUnicode(false);

            modelBuilder.Entity<KhachHang>()
                .Property(e => e.SoDienThoai)
                .IsUnicode(false);

            modelBuilder.Entity<Link>()
                .Property(e => e.LinkCode)
                .IsUnicode(false);

            modelBuilder.Entity<Link>()
                .Property(e => e.LinkImg)
                .IsUnicode(false);

            modelBuilder.Entity<ThanhVien>()
                .Property(e => e.username)
                .IsUnicode(false);

            modelBuilder.Entity<ThanhVien>()
                .Property(e => e.pass)
                .IsUnicode(false);

            modelBuilder.Entity<ThanhVien>()
                .Property(e => e.email)
                .IsUnicode(false);

            modelBuilder.Entity<Tour>()
                .Property(e => e.Gia)
                .HasPrecision(18, 0);

            modelBuilder.Entity<Tour>()
                .Property(e => e.Place)
                .IsUnicode(false);

            modelBuilder.Entity<Tour>()
                .Property(e => e.LinkImage)
                .IsUnicode(false);

            modelBuilder.Entity<Tour_Diadanh>()
                .Property(e => e.Gia)
                .HasPrecision(18, 0);

            modelBuilder.Entity<Tour_Diadanh>()
                .Property(e => e.Place)
                .IsUnicode(false);

            modelBuilder.Entity<Tour_Diadanh>()
                .Property(e => e.LinkImage)
                .IsUnicode(false);
        }
    }
}
