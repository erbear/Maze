angular.module('SampleApp').directive 'maze', (MazeGenerator, hotkeys) ->
  templateUrl: 'assets/templates/maze.html'
  link: (scope, elem, attrs)->
    scope.blocks = []
    jElem = $(elem[0])

    settings =
      height: 600
      width: 600
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

    hero =
      row: 0
      column: 0
      right: false

      moveLeft: ->
        return unless scope.border.left(@row, @column) && @column>0
        @right = false
        @column -= 1

      moveRight: ->
        return unless scope.border.right(@row, @column) && @column<settings.horizontalBlocks
        @right = true
        @column += 1

      moveUp: ->
        return unless scope.border.top(@row, @column) && @row>0
        @row -= 1

      moveDown: ->
        return unless scope.border.bottom(@row, @column) && @row<settings.verticalBlocks
        @row += 1

    scope.isOnCell = (row, column)->
      row == hero.row && column == hero.column

    scope.recentRightMove = ->
      hero.right


    hotkeys.add
      combo: 'up',
      description: 'Description goes here',
      callback: (event, hotkey)->
        hero.moveUp()

    hotkeys.add
      combo: 'down',
      description: 'Description goes here',
      callback: (event, hotkey)->
        hero.moveDown()

    hotkeys.add
      combo: 'left',
      description: 'Description goes here',
      callback: (event, hotkey)->
        hero.moveLeft()

    hotkeys.add
      combo: 'right',
      description: 'Description goes here',
      callback: (event, hotkey)->
        hero.moveRight()






