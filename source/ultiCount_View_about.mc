import Toybox.Lang;
import Toybox.Graphics;
import Toybox.WatchUi;
import Toybox.System;

class AboutView extends WatchUi.View {
    

    public function initialize() {
        View.initialize();        
    }

    // Load your resources here
    public function onLayout(dc as Dc) as Void {
        setLayout(Rez.Layouts.aboutLayout(dc));
        
    }

    // Called when this View is brought to the foreground. Restore
    // the state of this View and prepare it to be shown. This includes
    // loading resources into memory.
    function onShow() as Void {
        var _swipeUpIcon;
        var _swipeDownIcon;
        _swipeUpIcon = findDrawableById("swipeUp_LightOutline");
        _swipeDownIcon = findDrawableById("swipeDown_LightOutline");
        _swipeUpIcon.setVisible(false);
        _swipeDownIcon.setVisible(true);
    }

    // Update the view
    function onUpdate(dc as Dc) as Void {
        // Call the parent onUpdate function to redraw the layout
        View.onUpdate(dc);        
    }

    // Called when this View is removed from the screen. Save the
    // state of this View here. This includes freeing resources from
    // memory.
    function onHide() as Void {
    }

}