﻿package com.sulake.habbo.communication.messages.incoming._Str_87
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.habbo.communication.messages.parser.inventory.badges._Str_7305;

    public class _Str_8980 extends MessageEvent 
    {
        public function _Str_8980(k:Function)
        {
            super(k, _Str_7305);
        }

        public function _Str_2273():_Str_7305
        {
            return _parser as _Str_7305;
        }
    }
}
