namespace TravelProject.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class DiaDanh_DanhMucTour
    {
        [Key]
        [Column(Order = 0)]
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public int MaDiaDanh { get; set; }

        [Key]
        [Column(Order = 1)]
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public int MaDanhMucGoiTour { get; set; }

        [StringLength(3000)]
        public string Mota { get; set; }

        public virtual DanhMucTour DanhMucTour { get; set; }

        public virtual DiaDanh DiaDanh { get; set; }
    }
}
