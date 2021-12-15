import cpp

class NetworkByteSwap extends Expr{
    NetworkByteSwap(){
        exists( MacroInvocation mi|
            mi.getMacroName().regexpMatch("ntoh(l|s|ll)") and
            this = mi.getExpr()
            )
    }

}

from NetworkByteSwap n

select n
