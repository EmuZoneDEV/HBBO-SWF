﻿package com.sulake.habbo.communication.messages.incoming.room.session
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.habbo.communication.messages.parser.room.session._Str_7701;

    public class _Str_8829 extends MessageEvent 
    {
        public function _Str_8829(k:Function)
        {
            super(k, _Str_7701);
        }

        public function _Str_2273():_Str_7701
        {
            return _parser as _Str_7701;
        }
    }
}
