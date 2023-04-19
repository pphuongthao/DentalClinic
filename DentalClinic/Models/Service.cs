﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace DentalClinic.Models
{
    public class Service
    {
        public string ServiceId { get; set; }
        public string Name { get; set; }
        public string Thumbnail { get; set; }
        public long ExpectTime { get; set; }
        public string Description { get; set; }
        public string ServiceCategoryId { get; set; }
        public decimal Price { get; set; }
        public string SearchName { get; set; }
        public long CreateTime { get; set; }

    }
    public class ServiceListViewModel
    {
        public List<Service> ListService { get; set; }
        public int TotalPage { get; set; }
    }
}