//com.sulake.habbo.communication.messages.parser.game.lobby.GameConfigurationData

package com.sulake.habbo.communication.messages.parser.game.lobby{
    public class GameConfigurationData {

        private var _gameId:int;
        private var _gameNameId:String;
        private var _bgColor:uint;
        private var _textColor:uint;
        private var _assetUrl:String;
        private var _supportUrl:String;

        public function GameConfigurationData(k:int, _arg_2:String, _arg_3:uint, _arg_4:uint, _arg_5:String, _arg_6:String);

        public function get gameId():int;

        public function get gameNameId():String;

        public function get bgColor():uint;

        public function get textColor():uint;

        public function get assetUrl():String;

        public function get supportUrl():String;


    }
}//package com.sulake.habbo.communication.messages.parser.game.lobby

