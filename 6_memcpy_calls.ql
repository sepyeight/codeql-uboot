/**
 * functioncall 表示某个函数都调用了那些函数
 * getTarget就是链接到具体的函数
 */

import cpp

from FunctionCall call
where call.getTarget().getName().matches("memcpy")
select call
