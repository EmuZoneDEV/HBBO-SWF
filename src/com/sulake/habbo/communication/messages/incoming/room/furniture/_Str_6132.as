﻿package com.sulake.habbo.communication.messages.incoming.room.furniture
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.habbo.communication.messages.parser.room.furniture._Str_9499;

    public class _Str_6132 extends MessageEvent 
    {
        public function _Str_6132(k:Function)
        {
            super(k, _Str_9499);
        }

        public function _Str_2273():_Str_9499
        {
            return parser as _Str_9499;
        }
    }
}
