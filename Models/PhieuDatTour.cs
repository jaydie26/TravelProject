namespace TravelProject.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("PhieuDatTour")]
    public partial class PhieuDatTour
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public int MaPhieuDat { get; set; }

        public int? MaNguoiLienHe { get; set; }

        public int? MaTour { get; set; }

        [StringLength(1000)]
        public string DiaDiemDon { get; set; }

        public virtual NguoiLienHe NguoiLienHe { get; set; }

        public virtual Tour Tour { get; set; }
    }
}
