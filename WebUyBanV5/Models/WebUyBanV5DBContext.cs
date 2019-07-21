namespace WebUyBanV5.Models
{
    using System;
    using System.Data.Entity;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Linq;

    public partial class WebUyBanV5DBContext : DbContext
    {
        public WebUyBanV5DBContext()
            : base("name=WebUyBanV5DBContext")
        {
        }

        public virtual DbSet<account> accounts { get; set; }
        public virtual DbSet<action_permission> action_permission { get; set; }
        public virtual DbSet<data_action> data_action { get; set; }
        public virtual DbSet<data_action_table> data_action_table { get; set; }
        public virtual DbSet<news> news { get; set; }
        public virtual DbSet<newstype> newstypes { get; set; }
        public virtual DbSet<permission> permissions { get; set; }
        public virtual DbSet<user> users { get; set; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Entity<account>()
                .Property(e => e.Username)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<account>()
                .Property(e => e.Password)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<account>()
                .HasMany(e => e.users)
                .WithRequired(e => e.account)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<data_action>()
                .Property(e => e.Name)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<data_action>()
                .HasMany(e => e.data_action_table)
                .WithRequired(e => e.data_action)
                .HasForeignKey(e => e.dataactionID)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<data_action_table>()
                .Property(e => e.TableName)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<data_action_table>()
                .Property(e => e.TableName_vi)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<data_action_table>()
                .HasMany(e => e.action_permission)
                .WithRequired(e => e.data_action_table)
                .HasForeignKey(e => e.dataactiontableID)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<newstype>()
                .HasMany(e => e.news)
                .WithRequired(e => e.newstype)
                .HasForeignKey(e => e.NewstyleID)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<permission>()
                .HasMany(e => e.accounts)
                .WithRequired(e => e.permission)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<permission>()
                .HasMany(e => e.action_permission)
                .WithRequired(e => e.permission)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<user>()
                .Property(e => e.Gender)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<user>()
                .Property(e => e.Phone)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<user>()
                .Property(e => e.Email)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<user>()
                .HasMany(e => e.news)
                .WithRequired(e => e.user)
                .HasForeignKey(e => e.CreateBy)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<user>()
                .HasMany(e => e.user1)
                .WithRequired(e => e.user2)
                .HasForeignKey(e => e.CreateBy);
        }
    }
}
