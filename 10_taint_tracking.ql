import cpp
import semmle.code.cpp.dataflow.TaintTracking
import DataFlow::PathGraph

/**
 * 网络入口
 */
class IsSourceExpr extends Expr {
  IsSourceExpr() {
    exists(MacroInvocation mi |
      mi.getMacroName().indexOf("ntoh") = 0 and
      this = mi.getExpr()
    )
  }
}

/**
 * 判断
 */
class TraceExample extends TaintTracking::Configuration {
  TraceExample() { this = "TraceExample" }

  override predicate isSource(DataFlow::Node source) { source.asExpr() instanceof IsSourceExpr }

  override predicate isSink(DataFlow::Node sink) {
    exists(FunctionCall fc |
      fc.getTarget().getName() = "memcpy"
      and sink.asExpr() = fc.getArgument(2) 
      and not fc.getArgument(0).isConstant()
    )
  }
}

from TraceExample te, DataFlow::PathNode source, DataFlow::PathNode sink
where te.hasFlowPath(source, sink)
select sink, source
