namespace TravelProject.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Tour")]
    public partial class Tour
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Tour()
        {
            BangGias = new HashSet<BangGia>();
            DanhGias = new HashSet<DanhGia>();
            MaGiamGias = new HashSet<MaGiamGia>();
            PhieuDatTours = new HashSet<PhieuDatTour>();
        }

        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public int MaTour { get; set; }

        [StringLength(100)]
        public string TenTour { get; set; }

        [StringLength(100)]
        public string Mota { get; set; }

        public decimal? Gia { get; set; }

        public int? MaDiaDanh { get; set; }

        public int? MaChiTietTour { get; set; }

        public int? NumView { get; set; }

        [StringLength(100)]
        public string LinkImage { get; set; }

        [StringLength(100)]
        public string DiaDiem { get; set; }

        public int? NumDay { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<BangGia> BangGias { get; set; }

        public virtual ChiTietTour ChiTietTour { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<DanhGia> DanhGias { get; set; }

        public virtual DiaDanh DiaDanh { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<MaGiamGia> MaGiamGias { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<PhieuDatTour> PhieuDatTours { get; set; }
    }
}
