namespace TravelProject.Models
{
    using System;
    using System.Data.Entity;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Linq;

    public partial class TravelContext : DbContext
    {
        public TravelContext()
            : base("name=TravelContext")
        {
        }

        public virtual DbSet<Blog> Blogs { get; set; }
        public virtual DbSet<ChiTietNgay> ChiTietNgays { get; set; }
        public virtual DbSet<ChiTietTour> ChiTietTours { get; set; }
        public virtual DbSet<Contact> Contacts { get; set; }
        public virtual DbSet<DanhGia> DanhGias { get; set; }
        public virtual DbSet<DanhMucTour> DanhMucTours { get; set; }
        public virtual DbSet<DiaDanh> DiaDanhs { get; set; }
        public virtual DbSet<DichVuTour> DichVuTours { get; set; }
        public virtual DbSet<KhachHang> KhachHangs { get; set; }
        public virtual DbSet<Link> Links { get; set; }
        public virtual DbSet<MaGiamGia> MaGiamGias { get; set; }
        public virtual DbSet<Ngay> Ngays { get; set; }
        public virtual DbSet<NguoiLienHe> NguoiLienHes { get; set; }
        public virtual DbSet<PhieuDatTour> PhieuDatTours { get; set; }
        public virtual DbSet<ThanhVien> ThanhViens { get; set; }
        public virtual DbSet<Tour> Tours { get; set; }
        public virtual DbSet<Vung> Vungs { get; set; }
        public virtual DbSet<Soluong_DanhGia> Soluong_DanhGia { get; set; }
        public virtual DbSet<Vung_Diadanh> Vung_Diadanh { get; set; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Blog>()
                .Property(e => e.img)
                .IsUnicode(false);

            modelBuilder.Entity<Blog>()
                .Property(e => e.title)
                .IsUnicode(false);

            modelBuilder.Entity<Blog>()
                .Property(e => e.content)
                .IsUnicode(false);

            modelBuilder.Entity<Blog>()
                .Property(e => e.link)
                .IsUnicode(false);

            modelBuilder.Entity<Blog>()
                .Property(e => e.author)
                .IsUnicode(false);

            modelBuilder.Entity<Blog>()
                .Property(e => e.date_write)
                .IsUnicode(false);

            modelBuilder.Entity<Contact>()
                .Property(e => e.email)
                .IsUnicode(false);

            modelBuilder.Entity<Contact>()
                .Property(e => e.mess)
                .IsUnicode(false);

            modelBuilder.Entity<DiaDanh>()
                .Property(e => e.Img)
                .IsUnicode(false);

            modelBuilder.Entity<DiaDanh>()
                .Property(e => e.MoTa)
                .IsUnicode(false);

            modelBuilder.Entity<KhachHang>()
                .Property(e => e.NgaySinh)
                .IsUnicode(false);

            modelBuilder.Entity<KhachHang>()
                .Property(e => e.GioiTinh)
                .IsUnicode(false);

            modelBuilder.Entity<KhachHang>()
                .Property(e => e.Loai)
                .IsUnicode(false);

            modelBuilder.Entity<Link>()
                .Property(e => e.LinkCode)
                .IsUnicode(false);

            modelBuilder.Entity<Link>()
                .Property(e => e.LinkImg)
                .IsUnicode(false);

            modelBuilder.Entity<MaGiamGia>()
                .Property(e => e.MaGiamGia1)
                .IsUnicode(false);

            modelBuilder.Entity<NguoiLienHe>()
                .Property(e => e.Email)
                .IsUnicode(false);

            modelBuilder.Entity<NguoiLienHe>()
                .Property(e => e.SoDienThoai)
                .IsUnicode(false);

            modelBuilder.Entity<PhieuDatTour>()
                .Property(e => e.DiaDiemDon)
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

            modelBuilder.Entity<ThanhVien>()
                .HasMany(e => e.DanhGias)
                .WithRequired(e => e.ThanhVien)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<Tour>()
                .Property(e => e.Gia)
                .HasPrecision(18, 0);

            modelBuilder.Entity<Tour>()
                .Property(e => e.LinkImage)
                .IsUnicode(false);

            modelBuilder.Entity<Tour>()
                .HasMany(e => e.DanhGias)
                .WithRequired(e => e.Tour)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<Tour>()
                .HasMany(e => e.MaGiamGias)
                .WithRequired(e => e.Tour)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<Vung_Diadanh>()
                .Property(e => e.Img)
                .IsUnicode(false);

            modelBuilder.Entity<Vung_Diadanh>()
                .Property(e => e.MoTa)
                .IsUnicode(false);
        }
    }
}
