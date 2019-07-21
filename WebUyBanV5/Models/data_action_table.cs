namespace WebUyBanV5.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class data_action_table
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public data_action_table()
        {
            action_permission = new HashSet<action_permission>();
        }

        public int ID { get; set; }

        [Required]
        [StringLength(20)]
        public string TableName { get; set; }
        [StringLength(50)]
        public string TableName_vi { get; set; }

        public int dataactionID { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<action_permission> action_permission { get; set; }

        public virtual data_action data_action { get; set; }
    }
}
