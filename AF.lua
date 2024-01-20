function dot(obj, x, y)
  obj.ox = x
  obj.oy = y
  obj.draw()
end

function line(obj, x0, y0, x1, y1)
  local length = math.floor(math.sqrt((x0 - x1) ^ 2 + (y0 - y1) ^ 2)) / 2
  for i = 0, length do
    dot(obj, x0 + (x1 - x0) * i / length, y0 + (y1 - y0) * i / length)
  end
end

function gcd(a, b)
  --”ñ®”‚ª“ü‚Á‚Ä‚«‚Ä‚Ñ‚Á‚­‚è‚µ‚Ü‚µ‚½
  if a % 1 ~= 0 or b % 1 ~= 0 then
    return 1
  end

  while b ~= 0 do
    a, b = b, a % b
  end
  return a
end

function rot(vec, theta)
  local a = {}
  a["x"] = vec["x"] * math.cos(theta) - vec["y"] * math.sin(theta)
  a["y"] = vec["x"] * math.sin(theta) + vec["y"] * math.cos(theta)
  return a
end

function arc(obj, x, y, r, angle_start, angle_end)
  local d = 63
  for i = 0, d - 1 do
    local x0 = x + math.cos(angle_start + (angle_end - angle_start) * i / d) * r
    local y0 = y + math.sin(angle_start + (angle_end - angle_start) * i / d) * r
    local x1 = x + math.cos(angle_start + (angle_end - angle_start) * (i + 1) / d) * r
    local y1 = y + math.sin(angle_start + (angle_end - angle_start) * (i + 1) / d) * r
    line(obj, x0, y0, x1, y1)
  end
end
