﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace DentalClinic.Models
{
    public class GoodsReceiptDetail
    {
        public string GoodsReceiptDetailId { get; set; }
        public string MedicineId { get; set; }
        public int Quantity { get; set; }
        public decimal Price { get; set; }
        public decimal TotalPrice { get; set; }
        public string GoodsReceiptId { get; set; }
    }
}