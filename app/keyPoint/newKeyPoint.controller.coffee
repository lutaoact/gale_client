'use strict'

angular.module('clarkApp').controller 'NewKeyPointCtrl', (
  $scope
  $modalInstance
  Restangular
  sentence
) ->

  angular.extend $scope,
    sentence: sentence
    newKeyPoint:
      key: null
      text: null
    save: (form) ->
      unless form.$valid then return
      Restangular.one('sentences', sentence._id)
      .post('new_key_point', $scope.newKeyPoint)
      .then (result)->
        sentence.keyPoints = result.keyPoints
      .finally ->
        $modalInstance.close()
    cancel: ->
      $modalInstance.dismiss('cancel')