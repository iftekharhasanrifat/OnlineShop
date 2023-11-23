using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using OnlineShop.Data;
using OnlineShop.Models;

namespace OnlineShop.Areas.Customer.Controllers
{
    [Area("Customer")]
    [Authorize(Policy = "AdminPolicy")]
    public class UserController : Controller
    {
        UserManager<IdentityUser> _userManager;
        ApplicationDbContext _db;
        public UserController(UserManager<IdentityUser> userManager, ApplicationDbContext db)
        {
            _userManager = userManager;
            _db = db;
        }
       
        public IActionResult Index()
        {
            return View(_db.ApllicationUsers.ToList());
        }
        [AllowAnonymous]
        public async Task<IActionResult> Create()
        {
            return View();
        }
        [AllowAnonymous]
        [HttpPost]
        public async Task<IActionResult> Create(ApplicatonUser user)
        {
            if (ModelState.IsValid)
            {
                var searchUser = _db.ApllicationUsers.FirstOrDefault(c => c.UserName == user.UserName);
                if (searchUser != null)
                {
                    ViewBag.message = "Email already taken";
                }
                user.Email = user.UserName;
                user.EmailConfirmed = true;
                var result = await _userManager.CreateAsync(user, user.PasswordHash);
                if (result.Succeeded)
                {
                    var isSavedRole = await _userManager.AddToRoleAsync(user, "User");
                    TempData["Save"] = "user has been created successfully";
                    return RedirectToAction("Index","Home");
                }
                foreach (var error in result.Errors)
                {
                    ModelState.AddModelError(string.Empty, error.Description);
                }

            }

            return View();
        }

        public async Task<IActionResult> Edit (string id)
        {
            var searchUser = _db.ApllicationUsers.FirstOrDefault(c => c.Id == id);
            return View(searchUser);
        }
        [HttpPost]
        public async Task<IActionResult> Edit(ApplicatonUser user)
        {
            var searchUser = _db.ApllicationUsers.FirstOrDefault(c => c.Id == user.Id);
            if (searchUser == null)
            {
                return NotFound();
            }
            searchUser.FirstName = user.FirstName;
            searchUser.LastName = user.LastName;
            var result =await _userManager.UpdateAsync(searchUser);
            if (result.Succeeded)
            {
                TempData["Update"] = "user has been Updated successfully";
                return RedirectToAction("Index");
            }
            return View(searchUser);
        }

        public async Task<IActionResult> Details(string id)
        {
            var userInfo = _db.ApllicationUsers.FirstOrDefault(c => c.Id == id);
            if (userInfo == null)
            {
                return NotFound();
            }
            return View(userInfo);
        }

        public async Task<IActionResult> LockOut(string id)
        {
            var userInfo = _db.ApllicationUsers.FirstOrDefault(c => c.Id == id);
            if (userInfo == null) 
            {
                return NotFound();
            }
            return View(userInfo);
        }

        [HttpPost]
        public async Task<IActionResult> LockOut(ApplicatonUser user)
        {
            var userInfo = _db.ApllicationUsers.FirstOrDefault(c => c.Id == user.Id);
            if (userInfo == null)
            {
                return NotFound();
            }
            userInfo.LockoutEnd = DateTime.Now.AddYears(10);
            var result = await _userManager.UpdateAsync(userInfo);
            if (result.Succeeded)
            {
                TempData["Update"] = "user has been Lockedout successfully";
                return RedirectToAction("Index");
            }
            return View(userInfo);
        }

        public async Task<IActionResult> Active(string id)
        {
            var userInfo = _db.ApllicationUsers.FirstOrDefault(c => c.Id == id);
            if (userInfo == null)
            {
                return NotFound();
            }
            return View(userInfo);
        }

        [HttpPost]
        public async Task<IActionResult> Active(ApplicatonUser user)
        {
            var userInfo = _db.ApllicationUsers.FirstOrDefault(c => c.Id == user.Id);
            if (userInfo == null)
            {
                return NotFound();
            }
            userInfo.LockoutEnd = DateTime.Now.AddDays(-1);
            var result = await _userManager.UpdateAsync(userInfo);
            if (result.Succeeded)
            {
                TempData["Update"] = "user has been activated successfully";
                return RedirectToAction("Index");
            }
            return View(userInfo);
        }
        public async Task<IActionResult> Delete(string id)
        {
            var userInfo = _db.ApllicationUsers.FirstOrDefault(c => c.Id == id);
            if (userInfo == null)
            {
                return NotFound();
            }
            return View(userInfo);
        }

        [HttpPost]
        public async Task<IActionResult> Delete(ApplicatonUser user)
        {
            var userInfo = _db.ApllicationUsers.FirstOrDefault(c => c.Id == user.Id);
            if (userInfo == null)
            {
                return NotFound();
            }
            _db.ApllicationUsers.Remove(userInfo);
            int rowAffect = await _db.SaveChangesAsync() ;
            if (rowAffect>0)
            {
                TempData["Update"] = "user has been deleted successfully";
                return RedirectToAction("Index");
            }
            return View(userInfo);
        }

    }
}
