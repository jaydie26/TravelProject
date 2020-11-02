namespace TravelProject.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class ChiTietTour_ChiTietNgay_Ngay
    {
        public int? MaChiTietTour { get; set; }

        [Key]
        [Column(Order = 0)]
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public int MaChiTietNgay { get; set; }

        [StringLength(100)]
        public string TieuDe { get; set; }

        [StringLength(10)]
        public string TenNgay { get; set; }

        [Key]
        [Column(Order = 1)]
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public int MaNgay { get; set; }

        [StringLength(1000)]
        public string NoiDung { get; set; }

        [StringLength(100)]
        public string GioHoatDong { get; set; }

        [StringLength(1000)]
        public string MoTaTour { get; set; }
    }
}
