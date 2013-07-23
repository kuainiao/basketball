%%%--------------------------------------
%%% @Module  : pp_matchengine
%%% @Author  : lsm
%%% @Email   : lsm19870508@gmail.com
%%% @Created : 2013.07.22
%%% @Description:比赛引擎
%%%--------------------------------------
-module(pp_matchengine).
-export([handle/3]).
-include("common.hrl").
-include("record.hrl").

%%比赛引擎处理
handle(41000,Socket,_Data) ->
	Data = mod_matchengine:start_match(),
	{ok,BinData} = pt_40:write(40000,Data),
	lib_send:send_one(Socket,BinData);
