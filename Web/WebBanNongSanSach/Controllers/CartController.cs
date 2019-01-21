using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace WebBanNongSanSach.Controllers
{
    public class CartController : Controller
    {
        private const string CartSession = "CartSession";
        // GET: Cart
        public ActionResult Index()
        {
            var cart = Session[CartSession];
            var list = new List<CartItem>();
            if(cart !=null)
            {
                list = (List<CartItem>)cart;
            }
            return View();
        }

        public ActionResult AddItem(long productId, int quantity)
        {
            var cart = Session[CartSession];
            if (cart != null)
            {

                var list = (List<CartItem>)cart;
                if (list.Exists(x => x.ProductId == productId))
                {

                    foreach (var item in list)
                    {
                        if (item.ProductId == productId)
                        {
                            item.Quantity += quantity;
                        }
                    }
                }
                else
                {
                    //tạo đối tượng mới
                    var item = new CartItem();
                    item.ProductId = productId;
                    item.Quantity = quantity;
                    list.Add(item);
                }
                //Gán vào session
                Session[CartSession] = list;
            }
            else
            {//tạo đối tượng mới
                var item = new CartItem();
                item.ProductId = productId;
                item.Quantity = quantity;
                var list = new List<CartItem>();
                
                //Gán vào session
                Session[CartSession] = list;
            }
            return RedirectToAction("Index");
        }
    }
}