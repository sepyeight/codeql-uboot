import cpp

from MacroInvocation mi

where mi.getMacro().getName().indexOf("ntoh") = 0

select mi.getExpr()