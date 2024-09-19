import Toybox.Lang;
import Toybox.WatchUi;

class myAppDelegate extends WatchUi.BehaviorDelegate {
    //private var _myThing as myAppView;
    private var _view = getView();
    private var _settingsMenu = Application.getApp().getSettingsMenu();

    public function initialize() {
        BehaviorDelegate.initialize();
        //_myThing = view;
        //WatchUi.View.initialize();
    }

    function onMenu() as Boolean {
        //WatchUi.pushView(new Rez.Menus.InGameMenu(), new InGameMenuDelegate(), WatchUi.SLIDE_UP);
        return true;
    }

    function onBack() as Boolean {
        _view.startNewPotentialPointClock();
        WatchUi.pushView(new Rez.Menus.InGameMenu(), new InGameMenuDelegate(), WatchUi.SLIDE_UP);
        return true;
    }

    function onSelect() as Boolean {
        _view.startStopTimer();
        return true;
    }
     

    public function onNextPage() as Boolean {
        WatchUi.pushView(_settingsMenu, new myAppSettingsMenuDelegate(), WatchUi.SLIDE_UP);
        return true;
    }

}