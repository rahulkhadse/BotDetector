using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Security.Cryptography;
using System.Text;


namespace BotNinjaMVC.Controllers
{
    public class IndexController : Controller
    {
        // GET: Index
        public ActionResult Index()
        {
            using (MD5 md5Hash = MD5.Create())
            {
                string hash = GetMd5Hash(md5Hash, DateTime.Now.ToString("MMddyyyy"));
                ViewBag.HashWithDate = hash; //HoneyPot
            }
            return View();
        }

        [HttpPost]
        public string FormTwo()
        {
            var keys = Request.Form.AllKeys;
            string tbHoneyPots = "", tbHashWithDate ="";
            tbHashWithDate = Request.Form["tbHashWithDate"];

            tbHoneyPots = Request.Form["tbHoneyPots"];  

            using (MD5 md5Hash = MD5.Create())
            {
                string hash = GetMd5Hash(md5Hash, DateTime.Now.ToString("MMddyyyy"));
                if (tbHashWithDate == hash && string.IsNullOrEmpty(tbHoneyPots))
                {
                    return "Form Submitted Successfully";
                }
                else
                {
                    return "Error";
                }

            }
            

        }

        static string GetMd5Hash(MD5 md5Hash, string input)
        {

            // Convert the input string to a byte array and compute the hash.
            byte[] data = md5Hash.ComputeHash(Encoding.UTF8.GetBytes(input));

            // Create a new Stringbuilder to collect the bytes
            // and create a string.
            StringBuilder sBuilder = new StringBuilder();

            // Loop through each byte of the hashed data 
            // and format each one as a hexadecimal string.
            for (int i = 0; i < data.Length; i++)
            {
                sBuilder.Append(data[i].ToString("x2"));
            }

            // Return the hexadecimal string.
            return sBuilder.ToString();
        }

        // Verify a hash against a string.
        static bool VerifyMd5Hash(MD5 md5Hash, string input, string hash)
        {
            // Hash the input.
            string hashOfInput = GetMd5Hash(md5Hash, input);

            // Create a StringComparer an compare the hashes.
            StringComparer comparer = StringComparer.OrdinalIgnoreCase;

            if (0 == comparer.Compare(hashOfInput, hash))
            {
                return true;
            }
            else
            {
                return false;
            }
        }

    }
}