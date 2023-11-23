using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using OnlineSho.Utility;
using OnlineShop.Data;
using OnlineShop.Models;

namespace OnlineShop.Areas.Customer.Controllers
{
    [Area("Customer")]
    [Authorize]
    public class OrderController : Controller
    {
        private ApplicationDbContext _db;

        public OrderController(ApplicationDbContext db)
        {
            _db = db;
        }
        //Get checkout action method
        public IActionResult CheckOut()
        {
            return View();
        }
        //Post checkout action method
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> CheckOut(Order anOrder)
        {
            List<Products> products = HttpContext.Session.Get<List<Products>>("products");
            if (products != null) 
            {
                foreach (var product in products)
                {
                    OrderDetails orderDetails = new OrderDetails();
                    orderDetails.ProductId = product.Id;
                    anOrder.OrderDetails.Add(orderDetails);
                }
            }
            anOrder.OrderNo = GetOrderNo();
            _db.Orders.Add(anOrder);
            bool isSaved = await _db.SaveChangesAsync()>0;
            if (isSaved) 
            {
                HttpContext.Session.Set<List<Products>>("products", null);
                return RedirectToAction("Index","Home");
            }
            
            return View();
        }

        public string GetOrderNo()
        {
            int rowCount = _db.Orders.ToList().Count+1;
            return rowCount.ToString("000");
        }
    }
}
