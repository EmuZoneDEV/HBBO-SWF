﻿package com.sulake.habbo.session.handler
{
    import com.sulake.habbo.communication.messages.incoming._Str_89._Str_7845;
    import com.sulake.habbo.communication.messages.incoming._Str_89._Str_8236;
    import com.sulake.habbo.communication.messages.incoming._Str_89._Str_5266;
    import com.sulake.core.communication.connection.IConnection;
    import com.sulake.habbo.session.IRoomHandlerListener;
    import com.sulake.habbo.session.IRoomSession;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.session.enum.RoomControllerLevel;

    public class RoomPermissionsHandler extends BaseHandler 
    {
        public function RoomPermissionsHandler(k:IConnection, _arg_2:IRoomHandlerListener)
        {
            super(k, _arg_2);
            if (k == null)
            {
                return;
            }
            k.addMessageEvent(new _Str_7845(this._Str_22887));
            k.addMessageEvent(new _Str_8236(this._Str_25416));
            k.addMessageEvent(new _Str_5266(this._Str_15950));
        }

        private function _Str_22887(k:IMessageEvent):void
        {
            var _local_2:_Str_7845 = (k as _Str_7845);
            if (_local_2 == null)
            {
                return;
            }
            var _local_3:IRoomSession = listener.getSession(_Str_2569);
            if (_local_3 == null)
            {
                return;
            }
            _local_3.roomControllerLevel = _local_2._Str_2273().roomControllerLevel;
        }

        private function _Str_25416(k:IMessageEvent):void
        {
            var _local_2:_Str_8236 = (k as _Str_8236);
            if (_local_2 == null)
            {
                return;
            }
            var _local_3:IRoomSession = listener.getSession(_Str_2569);
            if (_local_3 == null)
            {
                return;
            }
            _local_3.roomControllerLevel = RoomControllerLevel.NONE;
        }

        private function _Str_15950(k:IMessageEvent):void
        {
            var _local_2:_Str_5266 = (k as _Str_5266);
            if (_local_2 == null)
            {
                return;
            }
            var _local_3:IRoomSession = listener.getSession(_Str_2569);
            if (_local_3 == null)
            {
                return;
            }
            _local_3._Str_2781 = true;
        }
    }
}
