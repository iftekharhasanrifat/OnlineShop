using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using OnlineShop.Data;
using OnlineShop.Models;

namespace OnlineShop.Areas.Admin.Controllers
{
    [Area("Admin")]
    [Authorize(Policy = "AdminPolicy")]
    public class ProductController : Controller
    {
        private ApplicationDbContext _db;
        private IWebHostEnvironment _he;
        public ProductController(ApplicationDbContext db, IWebHostEnvironment he)
        {
            _db = db;
            _he = he;
        }
        public IActionResult Index()
        {
            return View(_db.Products.Include(c => c.ProductTypes).Include(f => f.SpecialTag).ToList());
        }

        //Post index mathod
        [HttpPost]
        public IActionResult Index(decimal lowAmount,decimal largeAmount)
        {
            if(lowAmount !=0 && largeAmount != 0)
            {
                return View(_db.Products.Include(c => c.ProductTypes).Include(f => f.SpecialTag).Where(c => c.Price >= lowAmount && c.Price <= largeAmount).ToList());
            }
            return View(_db.Products.Include(c => c.ProductTypes).Include(f => f.SpecialTag).ToList());


        }
        //Get Create method
        public IActionResult Create()
        {
            ViewData["ProductTypeId"] = new SelectList(_db.ProductTypes.ToList(),"Id", "ProductType");
            ViewData["SpecialTagId"] = new SelectList(_db.SpecialTags.ToList(), "Id", "Name");

            return View();
        }

        //Post Create method
        [HttpPost]
        public async Task<IActionResult> Create(Products products,IFormFile? image)
        {
            if (ModelState.IsValid)
            {
                var searchProduct = _db.Products.FirstOrDefault(c => c.Name == products.Name);
                if (searchProduct!=null)
                {
                    ViewBag.message = "This product already exist";
                    ViewData["ProductTypeId"] = new SelectList(_db.ProductTypes.ToList(), "Id", "ProductType");
                    ViewData["SpecialTagId"] = new SelectList(_db.SpecialTags.ToList(), "Id", "Name");
                    return View(products);
                }
                if(image!=null)
                {
                    var name = Path.Combine(_he.WebRootPath+"/Images",Path.GetFileName(image.FileName));
                    await image.CopyToAsync(new FileStream(name, FileMode.Create));
                    products.Image = "Images/"+image.FileName;
                }
                if (image==null)
                {
                    products.Image = "Images/NoImage.jpg";
                }
                _db.Products.Add(products);
                await _db.SaveChangesAsync();
                return RedirectToAction("Index");
            }
            ViewData["ProductTypeId"] = new SelectList(_db.ProductTypes.ToList(), "Id", "ProductType");
            ViewData["SpecialTagId"] = new SelectList(_db.SpecialTags.ToList(), "Id", "Name");
            return View(products);
        }

        //Edit get method
        public IActionResult Edit(int? id)
        {

            ViewData["ProductTypeId"] = new SelectList(_db.ProductTypes.ToList(), "Id", "ProductType");
            ViewData["SpecialTagId"] = new SelectList(_db.SpecialTags.ToList(), "Id", "Name");
            if (id==null)
            {
                return NotFound();
            }
            var product = _db.Products.Include(x => x.ProductTypes).Include(x=>x.SpecialTag).FirstOrDefault(x=>x.Id==id);
            ViewData["ExistingImage"] = product?.Image;

            return View(product);
        }

        //Edit post method

        [HttpPost]
        public async Task<IActionResult> Edit(Products products, IFormFile? image)
        {
            if (ModelState.IsValid)
            {
                if (image != null)
                {
                    var name = Path.Combine(_he.WebRootPath + "/Images", Path.GetFileName(image.FileName));
                    await image.CopyToAsync(new FileStream(name, FileMode.Create));
                    products.Image = "Images/" + image.FileName;
                    ViewData["ExistingImage"] = products.Image;
                }
                if (image == null && !string.IsNullOrEmpty(products.Image))
                {
                    products.Image = products.Image;
                }
                _db.Products.Update(products);
                await _db.SaveChangesAsync();
                return RedirectToAction("Index");
            }
            ViewData["ProductTypeId"] = new SelectList(_db.ProductTypes.ToList(), "Id", "ProductType");
            ViewData["SpecialTagId"] = new SelectList(_db.SpecialTags.ToList(), "Id", "Name");
            return View(products);
        }

        //Details get method
        public IActionResult Details(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }
            var product = _db.Products.Include(x => x.ProductTypes).Include(x => x.SpecialTag).FirstOrDefault(x => x.Id == id);
            if (product == null)
            {
                return NotFound();
            }
            return View(product);
        }

        //Delete get method
        public IActionResult Delete(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }
            var product = _db.Products.Include(x => x.ProductTypes).Include(x => x.SpecialTag).FirstOrDefault(x => x.Id == id);
            if (product == null)
            {
                return NotFound();
            }
            return View(product);
        }

        [HttpPost]
        public async Task<IActionResult> Delete(int? id,Products products)
        {
            if (id == null)
            {
                return NotFound();
            }
            if (products.Id != id)
            {
                return NotFound();
            }
            var product = _db.Products.Include(x => x.ProductTypes).Include(x => x.SpecialTag).FirstOrDefault(x => x.Id == id);
            if (product == null)
            {
                return NotFound();
            }
            _db.Products.Remove(product);
            await _db.SaveChangesAsync();
            return RedirectToAction("Index");
        }

    }
}
