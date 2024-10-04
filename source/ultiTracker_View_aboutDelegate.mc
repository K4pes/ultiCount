import Toybox.Lang;
import Toybox.WatchUi;

class aboutViewDelegate extends WatchUi.BehaviorDelegate {    
    private var _aboutView;
    var _aboutStringCtr as Number;
    var _aboutStrIdArr = new [5];

    public function initialize(aboutView) {
        BehaviorDelegate.initialize();        
        _aboutView = aboutView;
        _aboutStrIdArr = [Rez.Strings.about_1, Rez.Strings.about_2, Rez.Strings.about_3, Rez.Strings.about_4, Rez.Strings.about_5];
        _aboutStringCtr = 0;
    }

    function onMenu() as Boolean {        
        return true;
    }

    function onBack() as Boolean {        
        WatchUi.popView(WatchUi.SLIDE_BLINK);
        return true;
    }

    function onSelect() as Boolean {        
        return true;
    }
     
    public function onPreviousPage() as Boolean {
        // switch to prev. string        
        _aboutStringCtr--;
        updateText();
        return true;
    }

    public function onNextPage() as Boolean {
        // switch to next string              
        _aboutStringCtr++;
        updateText();
        return true;
    }

    public function updateText() as Void{
        var _myTextArea;
        var _swipeUpIcon;
        var _swipeDownIcon;
        
        _swipeUpIcon = _aboutView.findDrawableById("swipeUp_LightOutline");
        _swipeDownIcon = _aboutView.findDrawableById("swipeDown_LightOutline");
        

        if (_aboutStringCtr >= _aboutStrIdArr.size()-1){
            //At last string or trying to go past the last string
            _aboutStringCtr = _aboutStrIdArr.size() - 1;
            _swipeDownIcon.setVisible(false);
        } else if (_aboutStringCtr <=  0){
            // At first string or trying to go past the first string
            _aboutStringCtr = 0;
            _swipeUpIcon.setVisible(false);
        } else {
            _swipeUpIcon.setVisible(true);
            _swipeDownIcon.setVisible(true);
        }

        _myTextArea = _aboutView.findDrawableById("id_aboutTextArea");
        _myTextArea.setText(_aboutStrIdArr[_aboutStringCtr]);
        WatchUi.requestUpdate();
    }

}