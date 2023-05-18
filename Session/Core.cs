using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Session
{
    class Core
    {
        private static user28Entities _context;

        public static user28Entities GetContext()
        {
            if (_context == null)
            {
                _context = new user28Entities();
            }
            return _context;
        }
    }
}
