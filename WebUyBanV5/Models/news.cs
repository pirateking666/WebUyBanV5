namespace WebUyBanV5.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class news
    {
        public int ID { get; set; }

        [Required]
        [StringLength(255)]
        public string Title { get; set; }

        public string Description { get; set; }

        [Required]
        public string Content { get; set; }

        public int Status { get; set; }

        public DateTime CreateDay { get; set; }

        public int CreateBy { get; set; }

        public int NewstyleID { get; set; }

        public virtual user user { get; set; }

        public virtual newstype newstype { get; set; }
    }
}
