using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GIBDD_Gorlanov_619
{
    internal class Core
    {
        private static GIBDDEntities _context;

        public static GIBDDEntities GetContext()
        {
            if(_context == null)
            {
                _context = new GIBDDEntities();
            }
            return _context;
        }
    }
}
