angular.module('SampleApp').service 'MazeGenerator', ->
  generateMaze: (x, y) ->
    n = x * y - 1
    if n < 0
      alert "illegal maze dimensions"
      return
    horiz = []
    j = 0

    while j < x + 1
      horiz[j] = []
      verti = []
      j++
    j = 0

    while j < x + 1
      verti[j] = []
      here = [ Math.floor(Math.random() * x), Math.floor(Math.random() * y) ]
      path = [ here ]
      unvisited = []
      j++
    j = 0

    while j < x + 2
      unvisited[j] = []
      k = 0

      while k < y + 1
        unvisited[j].push j > 0 and j < x + 1 and k > 0 and (j isnt here[0] + 1 or k isnt here[1] + 1)
        k++
      j++
    while 0 < n
      potential = [ [ here[0] + 1, here[1] ], [ here[0], here[1] + 1 ], [ here[0] - 1, here[1] ], [ here[0], here[1] - 1 ] ]
      neighbors = []
      j = 0

      while j < 4
        neighbors.push potential[j]  if unvisited[potential[j][0] + 1][potential[j][1] + 1]
        j++
      if neighbors.length
        n = n - 1
        next = neighbors[Math.floor(Math.random() * neighbors.length)]
        unvisited[next[0] + 1][next[1] + 1] = false
        if next[0] is here[0]
          horiz[next[0]][(next[1] + here[1] - 1) / 2] = true
        else
          verti[(next[0] + here[0] - 1) / 2][next[1]] = true
        path.push here = next
      else
        here = path.pop()
    x: x
    y: y
    horiz: horiz
    verti: verti
