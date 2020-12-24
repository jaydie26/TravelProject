namespace TravelProject.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("DiaDanh")]
    public partial class DiaDanh
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public DiaDanh()
        {
            DiaDanh_DanhMucTour = new HashSet<DiaDanh_DanhMucTour>();
            Tours = new HashSet<Tour>();
        }

        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public int MaDiaDanh { get; set; }

        [StringLength(100)]
        public string TenDiaDanh { get; set; }

        [StringLength(100)]
        public string Img { get; set; }

        [StringLength(1000)]
        public string MoTa { get; set; }

        public int? MaVung { get; set; }

        [StringLength(100)]
        public string Img2 { get; set; }

        public virtual Vung Vung { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<DiaDanh_DanhMucTour> DiaDanh_DanhMucTour { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Tour> Tours { get; set; }
    }
}
