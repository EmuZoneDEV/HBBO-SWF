﻿package com.sulake.habbo.communication.messages.incoming.catalog
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.catalog._Str_7118;

    public class _Str_8784 extends MessageEvent implements IMessageEvent 
    {
        public function _Str_8784(k:Function)
        {
            super(k, _Str_7118);
        }

        public function _Str_2273():_Str_7118
        {
            return this._parser as _Str_7118;
        }
    }
}
