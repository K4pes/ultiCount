import Toybox.Lang;
import Toybox.System;
import Toybox.WatchUi;

class InGameMenuDelegate extends WatchUi.MenuInputDelegate {

    private var _view = getView();
    
    function initialize() {
        MenuInputDelegate.initialize();
    }

    function onMenuItem(item as Symbol) as Void {
        if (item == :item_1) {
            _view.addScore(1);
        } else if (item == :item_2) {
            _view.addScore(2);
        } else if (item == :item_4) {
            _view.correctScore(1);
        } else if (item == :item_5) {
            _view.correctScore(2);
        } else if (item == :item_6) {
            var dialog = new WatchUi.Confirmation("Really want to Exit?");
            WatchUi.pushView(dialog, new ConfirmationDialogDelegate(), WatchUi.SLIDE_IMMEDIATE);
            //System.exit();
        }
    }

}