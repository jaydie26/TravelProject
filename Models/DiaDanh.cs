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
            Tours = new HashSet<Tour>();
        }

        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public int MaDiaDanh { get; set; }

        [StringLength(30)]
        public string TenDiaDanh { get; set; }

        [StringLength(50)]
        public string Img { get; set; }

        [StringLength(5000)]
        public string MoTa { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Tour> Tours { get; set; }
    }
}
