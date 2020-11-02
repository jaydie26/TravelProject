namespace TravelProject.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Contact")]
    public partial class Contact
    {
        [Key]
        public int MaContact { get; set; }

        [StringLength(50)]
        public string email { get; set; }

        [StringLength(5000)]
        public string mess { get; set; }
    }
}
