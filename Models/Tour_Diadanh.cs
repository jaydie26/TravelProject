namespace TravelProject.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class Tour_Diadanh
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public int MaTour { get; set; }

        [StringLength(100)]
        public string TenTour { get; set; }

        public decimal? Gia { get; set; }

        public int? MaChiTietTour { get; set; }

        public int? MaDiaDanh { get; set; }

        public int? NumStar { get; set; }

        public int? NumView { get; set; }

        [StringLength(100)]
        public string Place { get; set; }

        [StringLength(100)]
        public string LinkImage { get; set; }

        public int? NumDay { get; set; }

        [StringLength(30)]
        public string TenDiaDanh { get; set; }
    }
}
