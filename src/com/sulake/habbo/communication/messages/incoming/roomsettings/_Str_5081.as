﻿package com.sulake.habbo.communication.messages.incoming.roomsettings
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.roomsettings._Str_6506;

    public class _Str_5081 extends MessageEvent implements IMessageEvent 
    {
        public function _Str_5081(k:Function)
        {
            super(k, _Str_6506);
        }

        public function _Str_2273():_Str_6506
        {
            return this._parser as _Str_6506;
        }
    }
}
