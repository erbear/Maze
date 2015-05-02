angular.module('SampleApp').service 'MazeGenerator', ->
  generate: (x, y) ->
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
  display: (m) ->
    text = []
    j = 0

    while j < m.x * 2 + 1
      line = []
      if 0 is j % 2
        k = 0

        while k < m.y * 4 + 1
          if 0 is k % 4
            line[k] = "+"
          else if j > 0 and m.verti[j / 2 - 1][Math.floor(k / 4)]
            console.log 'verti['+ (j / 2 - 1) + ']['+ Math.floor(k / 4)+'] = ' + m.verti[j / 2 - 1][Math.floor(k / 4)]
            line[k] = " "
          else
            line[k] = "-"
          k++
      else
        k = 0

        while k < m.y * 4 + 1
          if 0 is k % 4
            if k > 0 and m.horiz[(j - 1) / 2][k / 4 - 1]
              console.log 'horiz['+ ((j - 1) / 2) + ']['+ Math.floor(k / 4 - 1)+'] = ' + m.horiz[(j - 1) / 2][k / 4 - 1]
              line[k] = " "
            else
              line[k] = "|"
          else
            line[k] = " "
          k++
      line[1] = line[2] = line[3] = " "  if 0 is j
      line[4 * m.y] = " "  if m.x * 2 - 1 is j
      text.push line.join("") + "\r\n"
      j++
    text.join ""
