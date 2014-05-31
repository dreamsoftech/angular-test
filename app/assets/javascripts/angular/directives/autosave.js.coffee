angular.module("testApp").directive "autoSave", ->
  restrict: "A"
  link: (scope, element, attrs, ctrl) ->
    debugger
    
    # TODO: support model callbacks
    save = ->
      console.log "Autosave"
      ctrl.update element.val()
      return

    element.bind "blur", scope.update(element.val())
    return
