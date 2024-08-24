import Toybox.Lang;
import Toybox.WatchUi;

class myAppDelegate extends WatchUi.BehaviorDelegate {
    //private var _myThing as myAppView;
    private var _view = getView();

    public function initialize() {
        BehaviorDelegate.initialize();
        //_myThing = view;
        //WatchUi.View.initialize();
    }

    function onMenu() as Boolean {
        WatchUi.pushView(new Rez.Menus.MainMenu(), new myAppMenuDelegate(), WatchUi.SLIDE_UP);
        return true;
    }

    function onBack() as Boolean {
        _view.startNewPotentialPointClock();
        WatchUi.pushView(new Rez.Menus.MainMenu(), new myAppMenuDelegate(), WatchUi.SLIDE_UP);
        return true;
    }

    public function onNextPage() as Boolean {
        //myAppApp._someScore = 2;
        //_myThing.addScore();
        _view.addScore(1);
        requestUpdate();
        //myAppView.addScore();
        return true;
    }

}