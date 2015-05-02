angular.module('SampleApp').directive 'maze', (MazeGenerator) ->
  link: (scope, elem, attrs)->
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
        block = $(document.createElement( "div" ))

        block.addClass('maze__cell')
        block.width (blockWidth + '%')
        block.height (blockHeight + '%')

        block.css {
          'border-top': if mazeWalls.verti[row-1]?[column]? then '0px'
          'border-bottom': if mazeWalls.verti[row][column]? then '0px'
          'border-left': if mazeWalls.horiz[row][column-1]? then '0px'
          'border-right': if mazeWalls.horiz[row][column]? then '0px'
        }

        jElem.append block









