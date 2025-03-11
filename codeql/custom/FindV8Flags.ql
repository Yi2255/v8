/**
 * @name Find usages of v8_flags
 * @description Locates all places where v8_flags.* is accessed
 * @kind problem
 * @problem.severity recommendation
 * @tags diagnostics
 */

import cpp

from MemberAccess ma
where
  ma.getBase().getType().getUnspecifiedType().getName().matches("v8_flags") or
  ma.getBase().toString().matches("v8_flags")
select ma, "Access to v8_flags member: " + ma.getMember().getName()
