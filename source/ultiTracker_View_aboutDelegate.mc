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
        var _bottomEllipsis;
        var _topEllipsis;  
        _bottomEllipsis = _aboutView.findDrawableById("id_bottomEllipsis");
        _topEllipsis = _aboutView.findDrawableById("id_topEllipsis");

        if (_aboutStringCtr > _aboutStrIdArr.size()-1){
            //reached the last string
            _aboutStringCtr--;
            _bottomEllipsis.setText("");
        } else if (_aboutStringCtr <  0){
            //reached the first string
            _aboutStringCtr++;
            _topEllipsis.setText("");
        } else {
            _topEllipsis.setText("...");
            _bottomEllipsis.setText("...");
        }
        _myTextArea = _aboutView.findDrawableById("id_aboutTextArea");
        _myTextArea.setText(_aboutStrIdArr[_aboutStringCtr]);
        WatchUi.requestUpdate();
    }

}