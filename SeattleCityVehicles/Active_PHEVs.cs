//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace SeattleCityVehicles
{
    using System;
    using System.Collections.Generic;
    
    public partial class Active_PHEVs
    {
        public int ActivePHEVKey { get; set; }
        public int Year { get; set; }
        public int Make { get; set; }
        public string Model { get; set; }
        public string Description { get; set; }
        public int Department { get; set; }
        public System.DateTime InServiceDate { get; set; }
        public int EstReplacementYear { get; set; }
        public string EquipmentType { get; set; }
        public decimal InServiceCost { get; set; }
        public int FuelType { get; set; }
    
        public virtual DepartmentName DepartmentName { get; set; }
        public virtual FuelType FuelType1 { get; set; }
        public virtual VehicleMake VehicleMake { get; set; }
    }
}