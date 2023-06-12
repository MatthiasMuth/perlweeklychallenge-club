#! /usr/bin/lua

-- by Michael Anderson at
-- https://stackoverflow.com/questions/8722620/comparing-two-index-tables-by-index-value-in-lua
-- modified by Roger
function recursive_compare(t1,t2)
  -- Use usual comparison first.
  if t1==t2 then return true end
  -- We only support non-default behavior for tables
  if (type(t1)~="table") then return false end
  -- They better have the same metatables
  local mt1 = getmetatable(t1)
  local mt2 = getmetatable(t2)
  if( not recursive_compare(mt1,mt2) ) then return false end
  -- Build list of all keys
  local kk = {}
  for k1, _ in pairs(t1) do
     kk[k1] = true
  end
  for k2, _ in pairs(t2) do
     kk[k2] = true
  end
  -- Check each key that exists in at least one table
  for _, k in ipairs(kk) do
     if (not recursive_compare(t1[k], t2[k])) then
        return false
     end
  end
  return true
end

function keys(t)
   local a = {}
   for k, v in pairs(t) do
      table.insert(a, k)
   end
   return a
end

function word2set(word)
   local s = {}
   for c in string.gmatch(string.lower(word), "%a") do
      s[c] = true
   end
   return s
end

function commoncharacters(lst)
   local c = word2set(lst[1])
   for i = 2, #lst do
      local d = word2set(lst[i])
      for k, _ in pairs(c) do
         if d[k] == nil then
            c[k] = nil
         end
      end
   end
   local o = keys(c)
   table.sort(o)
   return o
end

if recursive_compare(commoncharacters({"Perl", "Rust", "Raku"}), {"r"}) then
  io.write("Pass")
else
  io.write("FAIL")
end
io.write(" ")

if recursive_compare(commoncharacters({"love", "live", "leave"}), {"e", "l", "v"}) then
  io.write("Pass")
else
  io.write("FAIL")
end
print("")

