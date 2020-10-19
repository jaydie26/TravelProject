namespace TravelProject.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Link")]
    public partial class Link
    {
        [Key]
        [StringLength(10)]
        public string LinkCode { get; set; }

        [StringLength(100)]
        public string LinkImg { get; set; }

        public int? MaChiTietTour { get; set; }

        public virtual ChiTietTour ChiTietTour { get; set; }
    }
}
