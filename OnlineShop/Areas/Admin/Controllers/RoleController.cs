using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using OnlineShop.Areas.Admin.Models;
using OnlineShop.Data;

namespace OnlineShop.Areas.Admin.Controllers
{
    [Area("Admin")]
    [Authorize(Policy = "AdminPolicy")]
    public class RoleController : Controller
    {
        RoleManager<IdentityRole> _roleManager;
        ApplicationDbContext _db;
        UserManager<IdentityUser> _userManager;
        public RoleController(RoleManager<IdentityRole> roleManager,ApplicationDbContext db, UserManager<IdentityUser> userManager)
        {
             _roleManager = roleManager;
            _db = db;
            _userManager = userManager;
        }
        public IActionResult Index()
        {
            var roles = _roleManager.Roles.ToList();
            ViewBag.Roles = roles;
            return View();
        }

        public async Task<IActionResult> Create()
        {
            return View();
        }
        [HttpPost]
        public async Task<IActionResult> Create(string name)
        {
            IdentityRole role = new IdentityRole();
            role.Name = name;
            bool isExist = await _roleManager.RoleExistsAsync(name);
            if (isExist)
            {
                ViewBag.message = "This role already exist";
                ViewBag.Role = role.Name;
                return View();
            }
            var result =await _roleManager.CreateAsync(role);
            
            if (result.Succeeded)
            {
                TempData["Update"] = "Role has been saved successfully";
                return RedirectToAction("Index");
            }
            return View();
        }

        public async Task<IActionResult> Edit(string id)
        {
            var role =await _roleManager.FindByIdAsync(id);
            if (role == null)
            {
                return NotFound();
            }
            
            return View(role);
        }
        [HttpPost]
        public async Task<IActionResult> Edit(string id,string name)
        {
            var role = await _roleManager.FindByIdAsync(id);
            if (role == null)
            {
                return NotFound();
            }
            role.Name = name;
            bool isExist = await _roleManager.RoleExistsAsync(role.Name);
            if (isExist)
            {
                ViewBag.message = "This role already exist";
                ViewBag.name = role.Name;
                return View(role);
            }
            
            var result = await _roleManager.UpdateAsync(role);

            if (result.Succeeded)
            {
                TempData["Update"] = "Role has been updated successfully";
                return RedirectToAction("Index");
            }
            return View(role);
        }

        public async Task<IActionResult> Delete(string id)
        {
            var role = await _roleManager.FindByIdAsync(id);
            if (role == null)
            {
                return NotFound();
            }

            return View(role);
        }
        [HttpPost]
        public async Task<IActionResult> Delete(string id, string name)
        {
            var role = await _roleManager.FindByIdAsync(id);
            if (role == null)
            {
                return NotFound();
            }
            role.Name = name;
            var result = await _roleManager.DeleteAsync(role);

            if (result.Succeeded)
            {
                TempData["Update"] = "Role has been deleted successfully";
                return RedirectToAction("Index");
            }
            return View(role);
        }

        public async Task<IActionResult> Assign()
        {
            ViewData["UserID"] = new SelectList(_db.ApllicationUsers.Where(f=>f.LockoutEnd<DateTime.Now|| f.LockoutEnd==null).ToList(), "Id", "UserName");
            ViewData["RoleId"] = new SelectList(_roleManager.Roles.Where(c=>c.Name!="superadmin").ToList(), "Name", "Name");

            return View();
        }

        [HttpPost]
        public async Task<IActionResult> Assign(RoleUserVM roleUser)
        {
            var user = _db.ApllicationUsers.FirstOrDefault(c => c.Id == roleUser.UserId);
            bool isRoleExist = await _userManager.IsInRoleAsync(user, roleUser.RoleId);
            if (isRoleExist)
            {
                ViewBag.message = "The same role is already assigned to this user";
                ViewData["UserID"] = new SelectList(_db.ApllicationUsers.Where(f => f.LockoutEnd < DateTime.Now || f.LockoutEnd == null).ToList(), "Id", "UserName");
                ViewData["RoleId"] = new SelectList(_roleManager.Roles.ToList(), "Name", "Name");
                return View();
            }
            var result = await _userManager.AddToRoleAsync(user, roleUser.RoleId);
            if (result.Succeeded)
            {
                TempData["Save"] = "Role has been assigned successfully";
                return RedirectToAction("AssignUserRole");
            }
            return View();
        }
        public IActionResult AssignUserRole()
        {
            var result = from ur in _db.UserRoles
                         join r in _db.Roles on ur.RoleId equals r.Id
                         join a in _db.ApllicationUsers on ur.UserId equals a.Id
                         select new UserRoleMapping
                         {
                             RoleId = ur.RoleId,
                             UserId = ur.UserId,
                             UserName = a.UserName,
                             RoleName = r.Name
                         };
            ViewBag.UserRoles = result;
            return View();
        }
    }
}
