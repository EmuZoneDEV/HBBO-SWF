﻿package com.sulake.room.object
{
    import com.sulake.room.utils.IVector3D;
    import com.sulake.room.object.visualization.IRoomObjectVisualization;
    import com.sulake.room.object.logic.IRoomObjectEventHandler;

    public interface IRoomObjectController extends IRoomObject 
    {
        function dispose():void;
        function _Str_17972(_arg_1:Boolean):void;
        function setLocation(_arg_1:IVector3D):void;
        function setDirection(_arg_1:IVector3D):void;
        function _Str_14063(_arg_1:IRoomObjectVisualization):void;
        function setState(_arg_1:int, _arg_2:int):Boolean;
        function _Str_8711(_arg_1:IRoomObjectEventHandler):void;
        function _Str_2377():IRoomObjectEventHandler;
        function getModelController():IRoomObjectModelController;
    }
}
