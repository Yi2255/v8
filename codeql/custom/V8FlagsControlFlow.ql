/**
 * @name v8_flags usage in if conditions
 * @description Detects use of v8_flags in control flow conditions
 * @kind problem
 * @problem.severity recommendation
 * @tags control-flow
 */
import cpp

from IfStmt ifs, Expr cond
where cond = ifs.getCondition() and
      cond.toString().matches("%v8_flags.%")
select ifs, "This if condition depends on v8_flags: " + cond.toString()
