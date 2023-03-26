local Util = {}

function Util.convertGenesisPosition(pixel, subPixel)
  return pixel + math.abs(subPixel / 256)
end

function Util.collision(x1, y1, w1, h1, x2, y2, w2, h2)
  return x1 < x2 + w2 and
      x2 < x1 + w1 and
      y1 < y2 + h2 and
      y2 < y1 + h1
end

return Util
