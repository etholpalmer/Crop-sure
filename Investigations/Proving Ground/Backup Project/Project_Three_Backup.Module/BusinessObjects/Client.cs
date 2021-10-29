using DevExpress.Persistent.BaseImpl;
using DevExpress.Xpo;
using System.ComponentModel;

namespace Project_Three_Backup.Module.BusinessObjects {
    public class Clients:XPBaseObject {
        public Clients(Session session):base(session) {
        }

        private long _id;
        [Key(true), Browsable(false)]
        public long ID {
            get { return _id; }
            set { SetPropertyValue<long>(nameof(ID), ref _id, value); }
        }

        private string _FirstName;
        [Size(30)]
        public string FirstName {
            get { return _FirstName; }
            set { SetPropertyValue<string>(nameof(FirstName), ref _FirstName, value); }
        }

        private string _LastName;
        [Size(30)]
        public string LastName {
            get { return _LastName; }
            set { SetPropertyValue<string>(nameof(LastName), ref _LastName, value); }
        }

        private string _AccAddress;
        [Size(120)]
        public string Address {
            get { return _AccAddress; }
            set { SetPropertyValue<string>(nameof(Address), ref _AccAddress, value); }
        }

        private string _PropertyAddress;
        [Size(120)]
        public string PropertyAddress {
            get { return _PropertyAddress; }
            set => SetPropertyValue<string>(nameof(PropertyAddress), ref _PropertyAddress, value);
        }

        private decimal _PropertyValue;
        [Size(12)]
        public decimal PropertyValue {
            get { return _PropertyValue; }
            set => SetPropertyValue<decimal>(nameof(PropertyValue), ref _PropertyValue, value);
        }

        private decimal _AnnualProduction;
        [Size(12)]
        public decimal AnnualProduction {
            get { return _AnnualProduction; }
            set => SetPropertyValue<decimal>(nameof(AnnualProduction), ref _AnnualProduction, value);
        }

        private XPCollection<AuditDataItemPersistent> _auditTrail;
        public XPCollection<AuditDataItemPersistent> AuditTrail {
            get {
                return _auditTrail ?? (_auditTrail = AuditedObjectWeakReference.GetAuditTrail(Session, this));
            }
        }
    }
}