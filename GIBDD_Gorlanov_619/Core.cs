﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GIBDD_Gorlanov_619
{
    internal class Core
    {
        private static Entities _context;

        public static Entities GetContext()
        {
            if(_context == null)
            {
                _context = new Entities();
            }
            return _context;
        }
    }
}
