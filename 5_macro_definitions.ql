import cpp

from Macro f
// where f.getName() = "ntohs" or f.getName() = "ntohl" or f.getName() = "ntohll"
where f.getName().regexpMatch("ntoh(s|l|ll)")
select f, "function name"