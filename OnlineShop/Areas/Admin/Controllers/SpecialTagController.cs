using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using OnlineShop.Data;
using OnlineShop.Models;

namespace OnlineShop.Areas.Admin.Controllers
{
    [Area("Admin")]
    [Authorize(Policy = "AdminPolicy")]
    public class SpecialTagController : Controller
    {
        private ApplicationDbContext _db;
        public SpecialTagController(ApplicationDbContext db)
        {
            _db = db;
        }
        public IActionResult Index()
        {
            return View(_db.SpecialTags.ToList());
        }

        //create get action method
        public ActionResult Create()
        {
            return View();
        }

        //create Post action method
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create(SpecialTag specialTag)
        {
            if (ModelState.IsValid)
            {
                _db.SpecialTags.Add(specialTag);
                await _db.SaveChangesAsync();
                TempData["Save"] = "Tag name saved successfully.";
                return RedirectToAction(nameof(Index));
            }
            return View(specialTag);
        }

        //Edit get action method
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }
            var specialTag = _db.SpecialTags.Find(id);
            if (specialTag == null)
            {
                return NotFound();
            }
            return View(specialTag);
        }

        //Edit Post action method
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(SpecialTag specialTag)
        {
            if (ModelState.IsValid)
            {
                _db.SpecialTags.Update(specialTag);
                await _db.SaveChangesAsync();
                TempData["Update"] = "Tag name updated successfully.";
                return RedirectToAction(nameof(Index));
            }
            return View(specialTag);
        }

        //Details get action method
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }
            var specialTag = _db.SpecialTags.Find(id);
            if (specialTag == null)
            {
                return NotFound();
            }
            return View(specialTag);
        }

        //Delete get action method
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }
            var specialTag = _db.SpecialTags.Find(id);
            if (specialTag == null)
            {
                return NotFound();
            }
            return View(specialTag);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]

        //Delete post action method
        public async Task<IActionResult> Delete(int? id, SpecialTag specialTags)
        {
            if (id == null)
            {
                return NotFound();
            }
            if (id != specialTags.Id)
            {
                return NotFound();
            }
            var specialTag = _db.SpecialTags.Find(id);
            if (specialTag == null)
            {
                return NotFound();
            }
            _db.SpecialTags.Remove(specialTag);
            await _db.SaveChangesAsync();
            TempData["Delete"] = "Tag name deleted successfully.";
            return RedirectToAction(nameof(Index));
        }
    }
}
