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
            DanhMucTours = new HashSet<DanhMucTour>();
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

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<DanhMucTour> DanhMucTours { get; set; }

        public virtual Vung Vung { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Tour> Tours { get; set; }
    }
}
