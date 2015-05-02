angular.module('SampleApp').controller 'HomeCtrl', ($scope, MazeGenerator) ->

  console.log MazeGenerator.generateMaze(20, 20)
