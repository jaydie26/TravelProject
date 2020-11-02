namespace TravelProject.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("MaGiamGia")]
    public partial class MaGiamGia
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public int IdMaGiamGia { get; set; }

        [Column("MaGiamGia")]
        [StringLength(50)]
        public string MaGiamGia1 { get; set; }

        public int? PhanTramGiam { get; set; }

        public int MaTour { get; set; }

        public virtual Tour Tour { get; set; }
    }
}
