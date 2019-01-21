using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebBanNongSanSach.Controllers
{
    [Serializable]
    public class CartItem
    {
        public long ProductId { get; set; }
        public int Quantity { set; get; }
    }
}