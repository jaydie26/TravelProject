namespace TravelProject.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("ChiTietNgay")]
    public partial class ChiTietNgay
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public int MaChiTietNgay { get; set; }

        [StringLength(1000)]
        public string NoiDung { get; set; }

        [StringLength(100)]
        public string GioHoatDong { get; set; }

        public int? MaNgay { get; set; }

        public virtual Ngay Ngay { get; set; }
    }
}
