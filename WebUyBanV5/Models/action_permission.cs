namespace WebUyBanV5.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class action_permission
    {
        public int ID { get; set; }

        public int permissionID { get; set; }

        public int dataactiontableID { get; set; }

        public virtual data_action_table data_action_table { get; set; }

        public virtual permission permission { get; set; }
    }
}
