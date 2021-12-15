import cpp

from MacroInvocation mi, Macro m

where m.getName().regexpMatch("ntoh(s|l|ll)") and mi.getMacro() = m

select mi