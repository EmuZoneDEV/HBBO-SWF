﻿package com.sulake.habbo.communication.messages.incoming.room.furniture
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.habbo.communication.messages.parser.room.furniture._Str_8190;

    public class _Str_7811 extends MessageEvent 
    {
        public function _Str_7811(k:Function)
        {
            super(k, _Str_8190);
        }

        public function _Str_2273():_Str_8190
        {
            return parser as _Str_8190;
        }
    }
}
