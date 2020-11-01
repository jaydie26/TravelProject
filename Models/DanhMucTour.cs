namespace TravelProject.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("DanhMucTour")]
    public partial class DanhMucTour
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public int MaDanhMucGoiTour { get; set; }

        [StringLength(100)]
        public string TenDanhMucGoiTour { get; set; }

        [StringLength(2000)]
        public string Mota { get; set; }

        public int? MaDiaDanh { get; set; }

        public virtual DiaDanh DiaDanh { get; set; }
    }
}
