﻿package com.sulake.habbo.communication.messages.incoming.room.furniture
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.room.furniture._Str_7612;

    public class _Str_8183 extends MessageEvent implements IMessageEvent 
    {
        public function _Str_8183(k:Function)
        {
            super(k, _Str_7612);
        }

        public function _Str_2273():_Str_7612
        {
            return _parser as _Str_7612;
        }
    }
}
