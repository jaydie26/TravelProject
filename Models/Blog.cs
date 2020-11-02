namespace TravelProject.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Blog")]
    public partial class Blog
    {
        [Key]
        public int mablog { get; set; }

        [StringLength(20)]
        public string img { get; set; }

        [StringLength(20)]
        public string title { get; set; }

        [StringLength(100)]
        public string content { get; set; }

        [StringLength(1000)]
        public string link { get; set; }

        [StringLength(30)]
        public string author { get; set; }

        [StringLength(30)]
        public string date_write { get; set; }
    }
}
