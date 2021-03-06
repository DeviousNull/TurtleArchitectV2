local matrix
matrix = {
  new = function(dimensions,tTable)
    return setmetatable(
      tTable
      or {
        
      },
      {
        __index = function(t,k)
          if k == nil then
            error("Attempt to index nil value",2)
          end
          local dimension = dimensions-1
          if dimension <= 0 then
            return nil
          end
          t[k] = matrix.new(dimension)
          return t[k]
        end
      }
    )
  end
}
return matrix 
