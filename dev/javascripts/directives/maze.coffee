angular.module('SampleApp').directive 'maze', (MazeGenerator) ->
  templateUrl: 'assets/templates/maze.html'
  link: (scope, elem, attrs)->
    scope.blocks = []
    jElem = $(elem[0])

    settings =
      height: 300
      width: 300
      verticalBlocks: 10
      horizontalBlocks: 10


    mazeWalls = MazeGenerator.generate(settings.verticalBlocks, settings.horizontalBlocks)

    jElem.width settings.height
    jElem.height settings.width

    scope.blockHeight = 100 / settings.verticalBlocks
    scope.blockWidth = 100 / settings.horizontalBlocks

    scope.border =
      left: (row, column)->
        if mazeWalls.horiz[row][column-1]? then '0px'
      right: (row, column)->
        if mazeWalls.horiz[row][column]? then '0px'
      top: (row, column)->
        if mazeWalls.verti[row-1]?[column]? then '0px'
      bottom: (row, column)->
        if mazeWalls.verti[row][column]? then '0px'

    for row in [0..settings.horizontalBlocks - 1]
      for column in [0..settings.verticalBlocks - 1]
        scope.blocks.push
          row: row
          column: column










