import Toybox.Lang;
import Toybox.System;
import Toybox.WatchUi;

class InGameMenuDelegate extends WatchUi.MenuInputDelegate {

    private var _mainView =Application.getApp().getMainView();
    
    function initialize() {
        MenuInputDelegate.initialize();
    }

    function onMenuItem(item as Symbol) as Void {
        if (item == :item_1) {
            _mainView.addScore(1);
        } else if (item == :item_2) {
            _mainView.addScore(2);
        } else if (item == :item_4) {
            _mainView.correctScore(1);
        } else if (item == :item_5) {
            _mainView.correctScore(2);
        }
    }

}