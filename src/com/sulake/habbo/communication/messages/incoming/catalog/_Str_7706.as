﻿package com.sulake.habbo.communication.messages.incoming.catalog
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.catalog._Str_6792;

    public class _Str_7706 extends MessageEvent implements IMessageEvent 
    {
        public function _Str_7706(k:Function)
        {
            super(k, _Str_6792);
        }

        public function _Str_2273():_Str_6792
        {
            return this._parser as _Str_6792;
        }
    }
}
