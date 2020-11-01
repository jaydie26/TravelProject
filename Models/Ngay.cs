namespace TravelProject.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Ngay")]
    public partial class Ngay
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Ngay()
        {
            ChiTietNgays = new HashSet<ChiTietNgay>();
        }

        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public int MaNgay { get; set; }

        [StringLength(10)]
        public string TenNgay { get; set; }

        [StringLength(100)]
        public string TieuDe { get; set; }

        public int? MaChiTietTour { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<ChiTietNgay> ChiTietNgays { get; set; }

        public virtual ChiTietTour ChiTietTour { get; set; }
    }
}
