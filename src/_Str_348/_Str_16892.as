﻿package _Str_348
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.game.directory._Str_6529;

    public class _Str_16892 extends MessageEvent implements IMessageEvent 
    {
        public function _Str_16892(k:Function)
        {
            super(k, _Str_6529);
        }

        public function _Str_2273():_Str_6529
        {
            return this._parser as _Str_6529;
        }
    }
}
