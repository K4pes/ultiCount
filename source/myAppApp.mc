import Toybox.Application;
import Toybox.Lang;
import Toybox.WatchUi;

class myAppApp extends Application.AppBase {
    public var _someScore;
    private var _view;

    function initialize() {
        AppBase.initialize();
        _someScore = 0;
    }

    // onStart() is called on application start up
    function onStart(state as Dictionary?) as Void {
    }

    // onStop() is called when your application is exiting
    function onStop(state as Dictionary?) as Void {
    }

    // Return the initial view of your application here
    function getInitialView() as [Views] or [Views, InputDelegates] {
        _view = new myAppView();
        return [ _view, new myAppDelegate() ];
    }

    // Returns main view Instance
    function getView() as myAppView {
        return _view;
    }

}

function getApp() as myAppApp {
    return Application.getApp() as myAppApp;
}

//Returns main view instance
function getView() as myAppView{
    return Application.getApp().getView();
}