﻿package com.sulake.habbo.communication.messages.incoming.notifications
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.inventory.pets._Str_7183;

    public class _Str_9047 extends MessageEvent implements IMessageEvent 
    {
        public function _Str_9047(k:Function)
        {
            super(k, _Str_7183);
        }

        public function _Str_2273():_Str_7183
        {
            return _parser as _Str_7183;
        }
    }
}
