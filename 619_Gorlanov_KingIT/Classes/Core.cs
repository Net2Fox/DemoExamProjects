using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;

namespace _619_Gorlanov_KingIT.Classes
{
    internal class Core
    {
        private static KingITEntities _context;

        public static KingITEntities GetContext()
        {
            if (_context == null)
            {
                _context = new KingITEntities();
            }
            return _context;
        }
    }
}
