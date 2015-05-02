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

    blockHeight = 100 / settings.verticalBlocks
    blockWidth = 100 / settings.horizontalBlocks

    for row in [0..settings.horizontalBlocks - 1]
      for column in [0..settings.verticalBlocks - 1]
        scope.blocks.push
          border:
            top: if mazeWalls.verti[row-1]?[column]? then '0px'
            bottom: if mazeWalls.verti[row][column]? then '0px'
            left: if mazeWalls.horiz[row][column-1]? then '0px'
            right: if mazeWalls.horiz[row][column]? then '0px'
          width: blockWidth
          height: blockHeight










