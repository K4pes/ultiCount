import Toybox.Lang;
import Toybox.System;
import Toybox.WatchUi;

class myAppMenuDelegate extends WatchUi.MenuInputDelegate {

    private var _view = getView();
    
    function initialize() {
        MenuInputDelegate.initialize();
    }

    function onMenuItem(item as Symbol) as Void {
        if (item == :item_1) {
            _view.addScore(1);
            //System.println("item 1");
        } else if (item == :item_2) {
            _view.addScore(2);
            //System.println("item 2");
        }
    }

}